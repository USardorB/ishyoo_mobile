import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';

enum AttatchmentOptionsSheetType {
  file(icon: Icons.file_present_outlined, label: 'Fayl'),
  gallery(icon: Icons.photo_outlined, label: 'Galereya'),
  camera(icon: Icons.camera_alt_outlined, label: 'Kamera');

  final IconData icon;
  final String label;

  const AttatchmentOptionsSheetType({required this.icon, required this.label});
}

class AttatchmentOptionsSheet extends StatelessWidget {
  final String chatId;

  const AttatchmentOptionsSheet({
    super.key,
    required this.chatId,
  });

  Future<void> _pickAndUpload(
    BuildContext context,
    AttatchmentOptionsSheetType type,
    bool isEmployer,
  ) async {
    File? selectedFile;

    try {
      switch (type) {
        case AttatchmentOptionsSheetType.file:
          final result = await FilePicker.pickFiles();
          if (result != null && result.files.single.path != null) {
            selectedFile = File(result.files.single.path!);
          }
          break;
        case AttatchmentOptionsSheetType.gallery:
          final result = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );
          if (result != null) {
            selectedFile = File(result.path);
          }
          break;
        case AttatchmentOptionsSheetType.camera:
          final result = await ImagePicker().pickImage(
            source: ImageSource.camera,
          );
          if (result != null) {
            selectedFile = File(result.path);
          }
          break;
      }

      if (selectedFile != null && context.mounted) {
        context.read<MessagingBloc>().add(
          UploadChatFile(
            chatId: chatId,
            file: selectedFile,
            isEmployer: isEmployer,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Xatolik yuz berdi: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEmployer =
        context.read<AuthBloc>().state.userRole == UserRole.employer;

    return DividerTheme(
      data: _buildDividerThemeData(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              child: Container(
                height: 6,
                width: 60,
                decoration: BoxDecoration(
                  color: context.colors.bgTertiary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...ListTile.divideTiles(
              context: context,
              tiles: AttatchmentOptionsSheetType.values.map(
                (e) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(4),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colors.bgSecondary,
                    ),
                    child: Icon(e.icon, color: context.colors.textSecondary),
                  ),
                  title: Text(e.label),
                  titleTextStyle: context.textThemes.buttonLarge,
                  onTap: () {
                    Navigator.pop(context);
                    _pickAndUpload(context, e, isEmployer);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DividerThemeData _buildDividerThemeData(BuildContext context) {
    return DividerThemeData(
      thickness: .5,
      color: context.colors.lineSecondary,
    );
  }
}
