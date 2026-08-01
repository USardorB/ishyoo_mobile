import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/resume/domain/entities/resume_pdf_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ResumePdfGenerator {
  static const _bgColor = PdfColor.fromInt(0xFF161616);
  static const _brandColor = PdfColor.fromInt(0xFFCFED0C);
  static const _mutedColor = PdfColor.fromInt(0xFFA0A0A0);
  static const _textColor = PdfColor.fromInt(0xFFFFFFFF);

  static Future<Uint8List> generate(ResumePdfModel data) async {
    await initializeDateFormatting('uz', null);
    final doc = pw.Document();

    final onestRegular = await PdfGoogleFonts.onestRegular();
    final onestMedium = await PdfGoogleFonts.onestMedium();
    final onestBold = await PdfGoogleFonts.onestBold();

    final logoSvgStr = await rootBundle.loadString('assets/vectors/ishyoo.svg');

    pw.ImageProvider? avatarImage;
    if (data.avatarUrl != null && data.avatarUrl!.isNotEmpty) {
      try {
        avatarImage = await networkImage(data.avatarUrl!);
      } catch (e) {
        // Fallback or ignore if network fails
      }
    }

    final pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Container(color: _bgColor),
      ),
      theme: pw.ThemeData.withFont(
        base: onestRegular,
        bold: onestBold,
        italic: onestMedium, // Using medium for some variations if needed
      ),
    );

    doc.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          _buildHeader(logoSvgStr),
          pw.SizedBox(height: 32),
          _buildProfileInfo(data, avatarImage, onestBold, onestRegular),
          pw.SizedBox(height: 40),
          if (data.specialization != null) ...[
            _buildTargetPosition(data, onestBold, onestRegular),
            pw.SizedBox(height: 40),
          ],
          if (data.experiences != null && data.experiences!.isNotEmpty) ...[
            _buildExperience(data.experiences!, onestBold, onestRegular),
            pw.SizedBox(height: 40),
          ],
          if (data.educations != null && data.educations!.isNotEmpty) ...[
            _buildEducation(data.educations!, onestBold, onestRegular),
            pw.SizedBox(height: 40),
          ],
          if ((data.languages != null && data.languages!.isNotEmpty) ||
              (data.skills != null && data.skills!.isNotEmpty)) ...[
            _buildSkills(data, onestBold, onestRegular),
            pw.SizedBox(height: 40),
          ],
          pw.Spacer(),
          if (data.updatedAt != null)
            _buildFooter(data.updatedAt!, onestRegular),
        ],
      ),
    );

    return doc.save();
  }

  static pw.Widget _buildHeader(String logoSvg) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.SvgImage(svg: logoSvg, height: 24),
        pw.Text(
          'Rezyume',
          style: const pw.TextStyle(
            color: _mutedColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildProfileInfo(
    ResumePdfModel data,
    pw.ImageProvider? avatarImage,
    pw.Font onestBold,
    pw.Font onestRegular,
  ) {
    final fullNameParts = <String>[];
    if (data.lastName != null) fullNameParts.add(data.lastName!);
    if (data.firstName != null) fullNameParts.add(data.firstName!);
    final fullName = fullNameParts.isNotEmpty
        ? fullNameParts.join(' ')
        : 'Ismi kiritilmagan';

    final personalDetails = <String>[];
    if (data.gender != null) personalDetails.add(data.gender!);
    if (data.age != null) personalDetails.add('${data.age} yosh');
    if (data.birthDate != null) {
      final formattedDate = DateFormat(
        'dd-MMMM yyyy',
        'uz',
      ).format(data.birthDate!).replaceAll('-', ' ');
      personalDetails.add("$formattedDate-yil tug'ilgan");
    }

    final locationDetails = <String>[];
    if (data.location != null) locationDetails.add(data.location!);
    if (data.citizenship != null) {
      locationDetails.add('${data.citizenship} fuqarosi');
    }
    if (data.hasWorkPermit == true) {
      locationDetails.add('Ishlashga ruxsati bor');
    }

    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        if (avatarImage != null)
          pw.Container(
            width: 80,
            height: 80,
            decoration: pw.BoxDecoration(
              shape: pw.BoxShape.circle,
              image: pw.DecorationImage(
                image: avatarImage,
                fit: pw.BoxFit.cover,
              ),
            ),
          )
        else
          pw.Container(
            width: 80,
            height: 80,
            decoration: const pw.BoxDecoration(
              shape: pw.BoxShape.circle,
              color: PdfColor.fromInt(0xFF2A2A2A),
            ),
          ),
        pw.SizedBox(width: 24),
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                fullName,
                style: pw.TextStyle(
                  font: onestBold,
                  fontSize: 24,
                  color: _textColor,
                  lineSpacing: 2,
                ),
              ),
              if (personalDetails.isNotEmpty) ...[
                pw.SizedBox(height: 8),
                pw.Text(
                  personalDetails.join(' • '),
                  style: pw.TextStyle(
                    font: onestRegular,
                    fontSize: 12,
                    color: _mutedColor,
                  ),
                ),
              ],
              pw.SizedBox(height: 12),
              if (data.phone != null)
                pw.Text(
                  data.phone!,
                  style: pw.TextStyle(
                    font: onestBold,
                    fontSize: 14,
                    color: _brandColor,
                  ),
                ),
              if (data.email != null) ...[
                pw.SizedBox(height: 4),
                pw.Text(
                  data.email!,
                  style: pw.TextStyle(
                    font: onestRegular,
                    fontSize: 14,
                    color: _textColor,
                  ),
                ),
              ],
              if (locationDetails.isNotEmpty) ...[
                pw.SizedBox(height: 8),
                pw.Text(
                  locationDetails.join(' • '),
                  style: pw.TextStyle(
                    font: onestRegular,
                    fontSize: 12,
                    color: _mutedColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildSectionHeader(String title, pw.Font onestBold) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Container(width: 4, height: 16, color: _brandColor),
        pw.SizedBox(width: 12),
        pw.Text(
          title.toUpperCase(),
          style: pw.TextStyle(
            font: onestBold,
            fontSize: 12,
            color: _mutedColor,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildTargetPosition(
    ResumePdfModel data,
    pw.Font onestBold,
    pw.Font onestRegular,
  ) {
    final tags = <String>[];
    if (data.employmentType != null) tags.addAll(data.employmentType!);
    if (data.workFormat != null) tags.addAll(data.workFormat!);

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Maqsadli lavozim va maosh', onestBold),
        pw.SizedBox(height: 16),
        pw.Text(
          data.specialization!,
          style: pw.TextStyle(
            font: onestBold,
            fontSize: 20,
            color: _textColor,
          ),
        ),
        if (tags.isNotEmpty) ...[
          pw.SizedBox(height: 12),
          pw.Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((t) => _buildChip(t, onestRegular)).toList(),
          ),
        ],
      ],
    );
  }

  static pw.Widget _buildChip(String text, pw.Font onestRegular) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: pw.BoxDecoration(
        color: const PdfColor.fromInt(0xFF232323),
        borderRadius: pw.BorderRadius.circular(6),
        border: pw.Border.all(color: const PdfColor.fromInt(0xFF333333)),
      ),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          font: onestRegular,
          fontSize: 12,
          color: _mutedColor,
        ),
      ),
    );
  }

  static pw.Widget _buildExperience(
    List<ResumePdfExperience> experiences,
    pw.Font onestBold,
    pw.Font onestRegular,
  ) {
    // Calculate total duration roughly if needed, or just hardcode for layout.
    // In actual implementation, we might compute it. Let's omit the exact duration in header unless provided.
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Ish tajribasi', onestBold),
        pw.SizedBox(height: 24),
        ...experiences.map((exp) {
          final startStr = exp.startDate != null
              ? DateFormat('MMMM yyyy', 'uz').format(exp.startDate!)
              : 'Noma\'lum';
          final endStr = exp.endDate != null
              ? DateFormat('MMMM yyyy', 'uz').format(exp.endDate!)
              : 'hozir';

          return pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 24),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(
                  width: 120,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        '$startStr — $endStr',
                        style: pw.TextStyle(
                          font: onestBold,
                          fontSize: 12,
                          color: _textColor,
                        ),
                      ),
                      // Duration could be added here
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        exp.companyName ?? 'Noma\'lum',
                        style: pw.TextStyle(
                          font: onestBold,
                          fontSize: 16,
                          color: _textColor,
                        ),
                      ),
                      if (exp.location != null) ...[
                        pw.SizedBox(height: 4),
                        pw.Text(
                          exp.location!,
                          style: pw.TextStyle(
                            font: onestRegular,
                            fontSize: 12,
                            color: _mutedColor,
                          ),
                        ),
                      ],
                      if (exp.position != null) ...[
                        pw.SizedBox(height: 4),
                        pw.Text(
                          exp.position!,
                          style: pw.TextStyle(
                            font: onestBold,
                            fontSize: 14,
                            color: _brandColor,
                          ),
                        ),
                      ],
                      if (exp.description != null) ...[
                        pw.SizedBox(height: 8),
                        pw.Text(
                          exp.description!,
                          style: pw.TextStyle(
                            font: onestRegular,
                            fontSize: 12,
                            color: _mutedColor,
                            lineSpacing: 1.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  static pw.Widget _buildEducation(
    List<ResumePdfEducation> educations,
    pw.Font onestBold,
    pw.Font onestRegular,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Ta\'lim', onestBold),
        pw.SizedBox(height: 24),
        ...educations.map((edu) {
          final startStr = edu.startDate != null
              ? DateFormat('yyyy', 'uz').format(edu.startDate!)
              : '';
          final endStr = edu.endDate != null
              ? DateFormat('yyyy', 'uz').format(edu.endDate!)
              : '';
          final dateStr = (startStr.isNotEmpty || endStr.isNotEmpty)
              ? (endStr.isNotEmpty ? endStr : startStr)
              : 'Noma\'lum';

          return pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 24),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(
                  width: 120,
                  child: pw.Text(
                    dateStr,
                    style: pw.TextStyle(
                      font: onestBold,
                      fontSize: 12,
                      color: _textColor,
                    ),
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        edu.school ?? 'Noma\'lum',
                        style: pw.TextStyle(
                          font: onestBold,
                          fontSize: 16,
                          color: _textColor,
                        ),
                      ),
                      if (edu.fieldOfStudy != null || edu.degree != null) ...[
                        pw.SizedBox(height: 4),
                        pw.Text(
                          [
                            edu.fieldOfStudy,
                            edu.degree,
                          ].where((e) => e != null).join(', '),
                          style: pw.TextStyle(
                            font: onestRegular,
                            fontSize: 14,
                            color: _mutedColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  static pw.Widget _buildSkills(
    ResumePdfModel data,
    pw.Font onestBold,
    pw.Font onestRegular,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Ko\'nikmalar', onestBold),
        pw.SizedBox(height: 16),
        if (data.languages != null && data.languages!.isNotEmpty) ...[
          pw.Text(
            'Tillar: ${data.languages!.join(' • ')}',
            style: pw.TextStyle(
              font: onestRegular,
              fontSize: 14,
              color: _textColor,
            ),
          ),
          pw.SizedBox(height: 16),
        ],
        if (data.skills != null && data.skills!.isNotEmpty) ...[
          pw.Wrap(
            spacing: 8,
            runSpacing: 8,
            children: data.skills!
                .map((s) => _buildSkillChip(s, onestRegular))
                .toList(),
          ),
        ],
      ],
    );
  }

  static pw.Widget _buildSkillChip(String text, pw.Font onestRegular) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: pw.BoxDecoration(
        color: const PdfColor.fromInt(0xFF232323),
        borderRadius: pw.BorderRadius.circular(6),
        border: pw.Border.all(color: const PdfColor.fromInt(0xFF333333)),
      ),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          font: onestRegular,
          fontSize: 12,
          color: _brandColor,
        ),
      ),
    );
  }

  static pw.Widget _buildFooter(DateTime updatedAt, pw.Font onestRegular) {
    final dateStr = DateFormat(
      'dd-MMMM yyyy',
      'uz',
    ).format(updatedAt).replaceAll('-', ' ');
    return pw.Text(
      'Rezyume Ishyoo orqali yangilandi • $dateStr',
      style: pw.TextStyle(
        font: onestRegular,
        fontSize: 10,
        color: _mutedColor,
      ),
    );
  }
}
