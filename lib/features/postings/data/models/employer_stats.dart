import 'package:dart_mappable/dart_mappable.dart';

part 'employer_stats.mapper.dart';

@MappableClass()
class EmployerStats with EmployerStatsMappable {
  @MappableField(key: 'active_vacancies_count')
  final int activeVacanciesCount;
  @MappableField(key: 'new_applicants_count')
  final int newApplicantsCount;
  @MappableField(key: 'interviews_today_count')
  final int interviewsTodayCount;
  @MappableField(key: 'weekly_stats')
  final WeeklyStats? weeklyStats;

  const EmployerStats({
    this.activeVacanciesCount = 0,
    this.newApplicantsCount = 0,
    this.interviewsTodayCount = 0,
    this.weeklyStats,
  });

  factory EmployerStats.fromJson(Map<String, dynamic> json) => EmployerStatsMapper.fromMap(json);
}

@MappableClass()
class WeeklyStats with WeeklyStatsMappable {
  @MappableField(key: 'total_applications')
  final int totalApplications;
  @MappableField(key: 'interviews_scheduled')
  final int interviewsScheduled;

  const WeeklyStats({
    this.totalApplications = 0,
    this.interviewsScheduled = 0,
  });

  factory WeeklyStats.fromJson(Map<String, dynamic> json) => WeeklyStatsMapper.fromMap(json);
}
