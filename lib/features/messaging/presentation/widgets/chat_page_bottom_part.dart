import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/messaging/presentation/widgets/attatchment_options_sheet.dart';

// TODO(Sardor) Rename for better readability
class ChatPageBottomPart extends StatelessWidget {
  const ChatPageBottomPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          IconButton.filled(
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => AttatchmentOptionsSheet(),
            ),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgPrimary,
              foregroundColor: context.colors.brightImmutable,
            ),
            icon: Icon(Icons.add),
            color: context.colors.brandDefault,
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Xabar yozing...",
                fillColor: context.colors.bgPrimary,
                filled: true,
                contentPadding: .symmetric(horizontal: 16, vertical: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgPrimary,
              foregroundColor: context.colors.textSecondary,
            ),
            onPressed: () {},
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
