// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'employer_stats.dart';

class EmployerStatsMapper extends ClassMapperBase<EmployerStats> {
  EmployerStatsMapper._();

  static EmployerStatsMapper? _instance;
  static EmployerStatsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EmployerStatsMapper._());
      WeeklyStatsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EmployerStats';

  static int _$activeVacanciesCount(EmployerStats v) => v.activeVacanciesCount;
  static const Field<EmployerStats, int> _f$activeVacanciesCount = Field(
    'activeVacanciesCount',
    _$activeVacanciesCount,
    key: r'active_vacancies_count',
    opt: true,
    def: 0,
  );
  static int _$newApplicantsCount(EmployerStats v) => v.newApplicantsCount;
  static const Field<EmployerStats, int> _f$newApplicantsCount = Field(
    'newApplicantsCount',
    _$newApplicantsCount,
    key: r'new_applicants_count',
    opt: true,
    def: 0,
  );
  static int _$interviewsTodayCount(EmployerStats v) => v.interviewsTodayCount;
  static const Field<EmployerStats, int> _f$interviewsTodayCount = Field(
    'interviewsTodayCount',
    _$interviewsTodayCount,
    key: r'interviews_today_count',
    opt: true,
    def: 0,
  );
  static WeeklyStats? _$weeklyStats(EmployerStats v) => v.weeklyStats;
  static const Field<EmployerStats, WeeklyStats> _f$weeklyStats = Field(
    'weeklyStats',
    _$weeklyStats,
    key: r'weekly_stats',
    opt: true,
  );

  @override
  final MappableFields<EmployerStats> fields = const {
    #activeVacanciesCount: _f$activeVacanciesCount,
    #newApplicantsCount: _f$newApplicantsCount,
    #interviewsTodayCount: _f$interviewsTodayCount,
    #weeklyStats: _f$weeklyStats,
  };

  static EmployerStats _instantiate(DecodingData data) {
    return EmployerStats(
      activeVacanciesCount: data.dec(_f$activeVacanciesCount),
      newApplicantsCount: data.dec(_f$newApplicantsCount),
      interviewsTodayCount: data.dec(_f$interviewsTodayCount),
      weeklyStats: data.dec(_f$weeklyStats),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static EmployerStats fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EmployerStats>(map);
  }

  static EmployerStats fromJson(String json) {
    return ensureInitialized().decodeJson<EmployerStats>(json);
  }
}

mixin EmployerStatsMappable {
  String toJson() {
    return EmployerStatsMapper.ensureInitialized().encodeJson<EmployerStats>(
      this as EmployerStats,
    );
  }

  Map<String, dynamic> toMap() {
    return EmployerStatsMapper.ensureInitialized().encodeMap<EmployerStats>(
      this as EmployerStats,
    );
  }

  EmployerStatsCopyWith<EmployerStats, EmployerStats, EmployerStats>
  get copyWith => _EmployerStatsCopyWithImpl<EmployerStats, EmployerStats>(
    this as EmployerStats,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return EmployerStatsMapper.ensureInitialized().stringifyValue(
      this as EmployerStats,
    );
  }

  @override
  bool operator ==(Object other) {
    return EmployerStatsMapper.ensureInitialized().equalsValue(
      this as EmployerStats,
      other,
    );
  }

  @override
  int get hashCode {
    return EmployerStatsMapper.ensureInitialized().hashValue(
      this as EmployerStats,
    );
  }
}

extension EmployerStatsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EmployerStats, $Out> {
  EmployerStatsCopyWith<$R, EmployerStats, $Out> get $asEmployerStats =>
      $base.as((v, t, t2) => _EmployerStatsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EmployerStatsCopyWith<$R, $In extends EmployerStats, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  WeeklyStatsCopyWith<$R, WeeklyStats, WeeklyStats>? get weeklyStats;
  $R call({
    int? activeVacanciesCount,
    int? newApplicantsCount,
    int? interviewsTodayCount,
    WeeklyStats? weeklyStats,
  });
  EmployerStatsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EmployerStatsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EmployerStats, $Out>
    implements EmployerStatsCopyWith<$R, EmployerStats, $Out> {
  _EmployerStatsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EmployerStats> $mapper =
      EmployerStatsMapper.ensureInitialized();
  @override
  WeeklyStatsCopyWith<$R, WeeklyStats, WeeklyStats>? get weeklyStats =>
      $value.weeklyStats?.copyWith.$chain((v) => call(weeklyStats: v));
  @override
  $R call({
    int? activeVacanciesCount,
    int? newApplicantsCount,
    int? interviewsTodayCount,
    Object? weeklyStats = $none,
  }) => $apply(
    FieldCopyWithData({
      if (activeVacanciesCount != null)
        #activeVacanciesCount: activeVacanciesCount,
      if (newApplicantsCount != null) #newApplicantsCount: newApplicantsCount,
      if (interviewsTodayCount != null)
        #interviewsTodayCount: interviewsTodayCount,
      if (weeklyStats != $none) #weeklyStats: weeklyStats,
    }),
  );
  @override
  EmployerStats $make(CopyWithData data) => EmployerStats(
    activeVacanciesCount: data.get(
      #activeVacanciesCount,
      or: $value.activeVacanciesCount,
    ),
    newApplicantsCount: data.get(
      #newApplicantsCount,
      or: $value.newApplicantsCount,
    ),
    interviewsTodayCount: data.get(
      #interviewsTodayCount,
      or: $value.interviewsTodayCount,
    ),
    weeklyStats: data.get(#weeklyStats, or: $value.weeklyStats),
  );

  @override
  EmployerStatsCopyWith<$R2, EmployerStats, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _EmployerStatsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WeeklyStatsMapper extends ClassMapperBase<WeeklyStats> {
  WeeklyStatsMapper._();

  static WeeklyStatsMapper? _instance;
  static WeeklyStatsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeeklyStatsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WeeklyStats';

  static int _$totalApplications(WeeklyStats v) => v.totalApplications;
  static const Field<WeeklyStats, int> _f$totalApplications = Field(
    'totalApplications',
    _$totalApplications,
    key: r'total_applications',
    opt: true,
    def: 0,
  );
  static int _$interviewsScheduled(WeeklyStats v) => v.interviewsScheduled;
  static const Field<WeeklyStats, int> _f$interviewsScheduled = Field(
    'interviewsScheduled',
    _$interviewsScheduled,
    key: r'interviews_scheduled',
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<WeeklyStats> fields = const {
    #totalApplications: _f$totalApplications,
    #interviewsScheduled: _f$interviewsScheduled,
  };

  static WeeklyStats _instantiate(DecodingData data) {
    return WeeklyStats(
      totalApplications: data.dec(_f$totalApplications),
      interviewsScheduled: data.dec(_f$interviewsScheduled),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WeeklyStats fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WeeklyStats>(map);
  }

  static WeeklyStats fromJson(String json) {
    return ensureInitialized().decodeJson<WeeklyStats>(json);
  }
}

mixin WeeklyStatsMappable {
  String toJson() {
    return WeeklyStatsMapper.ensureInitialized().encodeJson<WeeklyStats>(
      this as WeeklyStats,
    );
  }

  Map<String, dynamic> toMap() {
    return WeeklyStatsMapper.ensureInitialized().encodeMap<WeeklyStats>(
      this as WeeklyStats,
    );
  }

  WeeklyStatsCopyWith<WeeklyStats, WeeklyStats, WeeklyStats> get copyWith =>
      _WeeklyStatsCopyWithImpl<WeeklyStats, WeeklyStats>(
        this as WeeklyStats,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WeeklyStatsMapper.ensureInitialized().stringifyValue(
      this as WeeklyStats,
    );
  }

  @override
  bool operator ==(Object other) {
    return WeeklyStatsMapper.ensureInitialized().equalsValue(
      this as WeeklyStats,
      other,
    );
  }

  @override
  int get hashCode {
    return WeeklyStatsMapper.ensureInitialized().hashValue(this as WeeklyStats);
  }
}

extension WeeklyStatsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WeeklyStats, $Out> {
  WeeklyStatsCopyWith<$R, WeeklyStats, $Out> get $asWeeklyStats =>
      $base.as((v, t, t2) => _WeeklyStatsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WeeklyStatsCopyWith<$R, $In extends WeeklyStats, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? totalApplications, int? interviewsScheduled});
  WeeklyStatsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WeeklyStatsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WeeklyStats, $Out>
    implements WeeklyStatsCopyWith<$R, WeeklyStats, $Out> {
  _WeeklyStatsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WeeklyStats> $mapper =
      WeeklyStatsMapper.ensureInitialized();
  @override
  $R call({int? totalApplications, int? interviewsScheduled}) => $apply(
    FieldCopyWithData({
      if (totalApplications != null) #totalApplications: totalApplications,
      if (interviewsScheduled != null)
        #interviewsScheduled: interviewsScheduled,
    }),
  );
  @override
  WeeklyStats $make(CopyWithData data) => WeeklyStats(
    totalApplications: data.get(
      #totalApplications,
      or: $value.totalApplications,
    ),
    interviewsScheduled: data.get(
      #interviewsScheduled,
      or: $value.interviewsScheduled,
    ),
  );

  @override
  WeeklyStatsCopyWith<$R2, WeeklyStats, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WeeklyStatsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

