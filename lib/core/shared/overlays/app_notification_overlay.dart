import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';

class AppNotificationOverlay {
  AppNotificationOverlay._();

  static final instance = AppNotificationOverlay._();

  final Queue<({String message, Duration duration, AppNotificationType type})>
  _queue = Queue();

  bool _isShowing = false;

  void show({
    required String message,
    Duration duration = const Duration(seconds: 3),
    required AppNotificationType type,
  }) {
    _queue.add((
      message: message,
      duration: duration,
      type: type,
    ));

    if (!_isShowing) {
      _showNext();
    }
  }

  Future<void> _showNext() async {
    if (_queue.isEmpty) {
      _isShowing = false;
      return;
    }

    _isShowing = true;

    final request = _queue.removeFirst();

    final overlay = appRouter.navigatorKey.currentState?.overlay;

    if (overlay?.context == null) {
      _isShowing = false;
      return;
    }

    final completer = Completer<void>();

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => _NotificationWidget(
        request: request,
        onDismissed: () {
          if (entry.mounted) {
            entry.remove();
          }

          if (!completer.isCompleted) {
            completer.complete();
          }
        },
      ),
    );

    overlay?.insert(entry);

    await completer.future;

    _showNext();
  }
}

class _NotificationWidget extends StatefulWidget {
  const _NotificationWidget({
    required this.request,
    required this.onDismissed,
  });

  final ({String message, Duration duration, AppNotificationType type}) request;
  final VoidCallback onDismissed;

  @override
  State<_NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  double _dragOffset = 0;

  bool _closing = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 250),
    );

    _show();
  }

  Future<void> _show() async {
    await _controller.forward();

    await Future.delayed(widget.request.duration);

    if (!_closing) {
      await _dismiss();
    }
  }

  Future<void> _dismiss() async {
    if (_closing) return;

    _closing = true;

    await _controller.reverse();

    widget.onDismissed();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).viewPadding.top;

    final animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    return Positioned(
      top: topInset + 12,
      left: 16,
      right: 16,
      child: Material(
        elevation: 12,
        color: Colors.transparent,
        child: AnimatedBuilder(
          animation: animation,
          builder: (_, child) {
            return Opacity(
              opacity: animation.value,
              child: Transform.translate(
                offset: Offset(
                  0,
                  (-100 * (1 - animation.value)) + _dragOffset,
                ),
                child: child,
              ),
            );
          },
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < 0) {
                setState(() => _dragOffset += details.delta.dy);
              }
            },
            onVerticalDragEnd: (_) async {
              if (_dragOffset < -40) {
                await _dismiss();
              } else {
                setState(() => _dragOffset = 0);
              }
            },
            child: AppNotification(
              type: widget.request.type,
              msg: widget.request.message,
              onClose: _dismiss,
            ),
          ),
        ),
      ),
    );
  }
}
