import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_detail_bloc.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';

class ResumeStatsSection extends StatelessWidget {
  final Resume resume;

  const ResumeStatsSection({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResumeFormBloc, ResumeFormState>(
      listener: (context, state) {
        if (state.isBoosted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Rezyume muvaffaqiyatli ko'tarildi!")),
          );
          context.read<ResumeDetailBloc>().add(LoadResumeDetail(resume.id));
        } else if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        }
      },
      builder: (context, state) {
        final canBoost = resume.availableForBoost == true;
        final isSubmitting = state.isSubmitting;
        
        String infoText = "Rezyume kamdan-kam hollarda qidiruv natijalariga kiritiladi. Ko'proq ko'rishlar va taklifnomalar olish uchun uni ko'taring.";
        if (!canBoost && resume.nextFreeBoostAt != null) {
          final formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(resume.nextFreeBoostAt!.toLocal());
          infoText = "Sizning rezyumeingiz yaqinda ko'tarilgan. Keyingi bepul ko'tarish: $formattedDate";
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.bgSecondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat(context, "Reyting", "${resume.boostScore ?? 0}", true),
                  Container(width: 1, height: 32, color: context.colors.bgTertiary),
                  _buildStat(context, "Status", resume.status == 'active' ? 'Faol' : 'Nofaol', false),
                  Container(width: 1, height: 32, color: context.colors.bgTertiary),
                  _buildStat(context, "Ko'rinish", resume.visibility == 'public' ? 'Ommaviy' : 'Yopiq', false),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                infoText,
                style: context.textThemes.b2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              AppButton(
                onTap: (canBoost && !isSubmitting)
                    ? () {
                        context.read<ResumeFormBloc>().add(BoostResume(resume.id));
                      }
                    : () {},
                label: isSubmitting ? "Kuting..." : "Qidiruv natijalariga ko'tarish",
                color: canBoost
                    ? context.colors.brandProgress.withValues(alpha: 0.15)
                    : context.colors.bgTertiary,
                foregroundColor: canBoost
                    ? context.colors.brandProgress
                    : context.colors.textSecondary,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStat(BuildContext context, String label, String value, bool isHighlighted) {
    return Column(
      children: [
        Text(
          label,
          style: context.textThemes.c2.copyWith(
            color: isHighlighted ? context.colors.info : context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.textThemes.s1.copyWith(
            color: isHighlighted ? context.colors.info : context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
