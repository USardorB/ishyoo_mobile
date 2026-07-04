import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

class DarkGlassSearchField extends StatelessWidget {
  const DarkGlassSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1.5,
              ),
            ),
            child: SearchBarTheme(
              data: SearchBarThemeData(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.transparent,
                ),
                elevation: WidgetStatePropertyAll(
                  0,
                ),
              ),
              child: SearchBar(
                onTap: () {
                  if (context.routeData.name != TalentsSearchResultRoute.name) {
                    context.pushRoute(TalentsSearchResultRoute());
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
