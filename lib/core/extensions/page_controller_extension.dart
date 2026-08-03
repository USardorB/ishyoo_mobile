import 'package:flutter/material.dart';

extension PageControllerExtension on PageController {
  /// get's the current page and round it up, if the
  /// controller doesn't have clients, it returns 0
  int get currentPage => (hasClients ? page ?? 0 : 0).round();
}
