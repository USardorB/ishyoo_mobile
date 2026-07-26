import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/profile/domain/repositories/profile_repository.dart';
import 'package:mobile/features/resume/domain/usecases/get_resume_detail_usecase.dart';
import 'package:mobile/features/resume/utils/resume_pdf_generator.dart';
import 'package:mobile/features/resume/domain/entities/resume_pdf_model.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/profile/data/models/profile.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ResumePdfPreviewPage extends StatefulWidget {
  final String resumeId;

  const ResumePdfPreviewPage({super.key, required this.resumeId});

  @override
  State<ResumePdfPreviewPage> createState() => _ResumePdfPreviewPageState();
}

class _ResumePdfPreviewPageState extends State<ResumePdfPreviewPage> {
  bool _isLoading = true;
  String? _error;
  ResumePdfModel? _pdfModel;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final resumeResult = await sl<GetResumeDetailUseCase>()(
        GetResumeDetailParams(widget.resumeId),
      );
      final profileResult = await sl<ProfileRepository>().getCandidateProfile();

      resumeResult.fold(
        (l) => setState(() {
          _error = l.message;
          _isLoading = false;
        }),
        (resume) {
          profileResult.fold(
            (l) => setState(() {
              _error = l.message;
              _isLoading = false;
            }),
            (profile) {
              setState(() {
                _pdfModel = _buildModel(resume, profile);
                _isLoading = false;
              });
            },
          );
        },
      );
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  ResumePdfModel _buildModel(Resume resume, Profile profile) {
    DateTime? birthDate;
    if (profile.birthDate != null) {
      try {
        birthDate = DateTime.parse(profile.birthDate!);
      } catch (_) {}
    }

    return ResumePdfModel(
      firstName: profile.firstName,
      lastName: profile.lastName,
      avatarUrl: profile.avatarUrl,
      // For now we don't have gender, citizenship, hasWorkPermit in profile.
      // So they will be null and the PDF generator will skip them.
      gender: null,
      age: birthDate != null
          ? (DateTime.now().difference(birthDate).inDays ~/ 365)
          : null,
      birthDate: birthDate,
      phone: profile.phoneNumber,
      email: profile.email,
      location: profile.city,
      citizenship: null,
      hasWorkPermit: null,
      specialization: resume.specialization,
      employmentType: resume.employmentType,
      workFormat: resume.workFormat,
      experiences: resume.experiences
          ?.map(
            (e) => ResumePdfExperience(
              companyName: e.companyName,
              position: e.position,
              description: e.description,
              startDate: e.startDate,
              endDate: e.endDate,
            ),
          )
          .toList(),
      educations: resume.educations
          ?.map(
            (e) => ResumePdfEducation(
              degree: e.degree,
              school: e.school,
              startDate: e.startDate,
              endDate: e.endDate,
            ),
          )
          .toList(),
      languages: null, // If resume has languages we can map here.
      skills: resume.skills,
      updatedAt: resume.updatedAt ?? DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rezyumeni PDF sifatida ko'rish"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : PdfPreview(
              build: (format) => ResumePdfGenerator.generate(_pdfModel!),
              canChangeOrientation: false,
              canChangePageFormat: false,
              canDebug: false,
              pdfFileName: "resume_${_pdfModel!.firstName ?? 'ishchi'}.pdf",
            ),
    );
  }
}
