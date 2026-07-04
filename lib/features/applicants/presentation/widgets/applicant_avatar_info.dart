import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ApplicantAvatarInfo extends StatelessWidget {
  const ApplicantAvatarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage('https://i.pravatar.cc/150?img=66'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Shoira Ravshanova',
          style: context.textThemes.s1,
        ),
        SizedBox(height: 6),
        Text(
          "Doimiy ish joyi • Ish joyida ish beruvchi,\nGibrid • Tayyor xizmat safarlariga",
          style: context.textThemes.b3.copyWith(
            color: context.colors.textSecondary,
          ),
          textAlign: .center,
        ),
      ],
    );
  }
}
