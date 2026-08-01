import 'package:easy_localization/easy_localization.dart';

// ─── Application / Applicant Status ─────────────────────────────────────────

enum AppStatus {
  // General
  active,
  inactive,
  blocked,
  deleted,
  archived,

  // Draft & publish cycle
  draft,
  published,
  confirmed,
  closed,

  // Application / Applicant
  pending,
  invited,
  rejected,
  hired,
  shortlisted,

  // Payment
  pastDue,
  paid,
  failed;

  static AppStatus? fromServer(String? value) => switch (value) {
    'active' => AppStatus.active,
    'inactive' => AppStatus.inactive,
    'blocked' => AppStatus.blocked,
    'deleted' => AppStatus.deleted,
    'archived' => AppStatus.archived,
    'draft' => AppStatus.draft,
    'published' => AppStatus.published,
    'confirmed' => AppStatus.confirmed,
    'closed' => AppStatus.closed,
    'pending' => AppStatus.pending,
    'invited' => AppStatus.invited,
    'rejected' => AppStatus.rejected,
    'hired' => AppStatus.hired,
    'shortlisted' => AppStatus.shortlisted,
    'past_due' => AppStatus.pastDue,
    'paid' => AppStatus.paid,
    'failed' => AppStatus.failed,
    _ => null,
  };

  String get serverValue => switch (this) {
    AppStatus.active => 'active',
    AppStatus.inactive => 'inactive',
    AppStatus.blocked => 'blocked',
    AppStatus.deleted => 'deleted',
    AppStatus.archived => 'archived',
    AppStatus.draft => 'draft',
    AppStatus.published => 'published',
    AppStatus.confirmed => 'confirmed',
    AppStatus.closed => 'closed',
    AppStatus.pending => 'pending',
    AppStatus.invited => 'invited',
    AppStatus.rejected => 'rejected',
    AppStatus.hired => 'hired',
    AppStatus.shortlisted => 'shortlisted',
    AppStatus.pastDue => 'past_due',
    AppStatus.paid => 'paid',
    AppStatus.failed => 'failed',
  };

  String get label => switch (this) {
    AppStatus.active => 'enums.status.active',
    AppStatus.inactive => 'enums.status.inactive',
    AppStatus.blocked => 'enums.status.blocked',
    AppStatus.deleted => 'enums.status.deleted',
    AppStatus.archived => 'enums.status.archived',
    AppStatus.draft => 'enums.status.draft',
    AppStatus.published => 'enums.status.published',
    AppStatus.confirmed => 'enums.status.confirmed',
    AppStatus.closed => 'enums.status.closed',
    AppStatus.pending => 'enums.status.pending',
    AppStatus.invited => 'enums.status.invited',
    AppStatus.rejected => 'enums.status.rejected',
    AppStatus.hired => 'enums.status.hired',
    AppStatus.shortlisted => 'enums.status.shortlisted',
    AppStatus.pastDue => 'enums.status.past_due',
    AppStatus.paid => 'enums.status.paid',
    AppStatus.failed => 'enums.status.failed',
  };

  String get localizedLabel => label.tr();
}

// ─── Vacancy Status (subset of Status with vacancy-specific meanings) ─────────

enum VacancyStatus {
  draft,
  published,
  archived,
  rejected,
  confirmed,
  closed;

  static VacancyStatus? fromServer(String? value) => switch (value) {
    'draft' => VacancyStatus.draft,
    'published' => VacancyStatus.published,
    'archived' => VacancyStatus.archived,
    'rejected' => VacancyStatus.rejected,
    'confirmed' => VacancyStatus.confirmed,
    'closed' => VacancyStatus.closed,
    _ => null,
  };

  String get serverValue => switch (this) {
    VacancyStatus.draft => 'draft',
    VacancyStatus.published => 'published',
    VacancyStatus.archived => 'archived',
    VacancyStatus.rejected => 'rejected',
    VacancyStatus.confirmed => 'confirmed',
    VacancyStatus.closed => 'closed',
  };

  String get label => switch (this) {
    VacancyStatus.draft => 'enums.vacancy_status.draft',
    VacancyStatus.published => 'enums.vacancy_status.published',
    VacancyStatus.archived => 'enums.vacancy_status.archived',
    VacancyStatus.rejected => 'enums.vacancy_status.rejected',
    VacancyStatus.confirmed => 'enums.vacancy_status.confirmed',
    VacancyStatus.closed => 'enums.vacancy_status.closed',
  };

  String get localizedLabel => label.tr();
}

// ─── Employment Type ──────────────────────────────────────────────────────────

enum EmploymentType {
  fullTime,
  partTime,
  freelance,
  contract,
  internship;

  static EmploymentType? fromServer(String? value) => switch (value) {
    'full_time' => EmploymentType.fullTime,
    'part_time' => EmploymentType.partTime,
    'freelance' => EmploymentType.freelance,
    'contract' => EmploymentType.contract,
    'internship' => EmploymentType.internship,
    _ => null,
  };

  String get serverValue => switch (this) {
    EmploymentType.fullTime => 'full_time',
    EmploymentType.partTime => 'part_time',
    EmploymentType.freelance => 'freelance',
    EmploymentType.contract => 'contract',
    EmploymentType.internship => 'internship',
  };

  String get label => switch (this) {
    EmploymentType.fullTime => 'enums.employment_type.full_time',
    EmploymentType.partTime => 'enums.employment_type.part_time',
    EmploymentType.freelance => 'enums.employment_type.freelance',
    EmploymentType.contract => 'enums.employment_type.contract',
    EmploymentType.internship => 'enums.employment_type.internship',
  };

  String get localizedLabel => label.tr();
}

// ─── Experience Level ─────────────────────────────────────────────────────────

enum AppExperienceLevel {
  noExperience,
  oneToThree,
  threeToSix,
  overSix;

  static AppExperienceLevel? fromServer(String? value) => switch (value) {
    'no_experience' => AppExperienceLevel.noExperience,
    'inexperienced' => AppExperienceLevel.noExperience,
    'one_to_three' => AppExperienceLevel.oneToThree,
    'three_to_six' => AppExperienceLevel.threeToSix,
    'over_six' => AppExperienceLevel.overSix,
    'more_than_six' => AppExperienceLevel.overSix,
    _ => null,
  };

  String get serverValue => switch (this) {
    AppExperienceLevel.noExperience => 'no_experience',
    AppExperienceLevel.oneToThree => 'one_to_three',
    AppExperienceLevel.threeToSix => 'three_to_six',
    AppExperienceLevel.overSix => 'over_six',
  };

  String get label => switch (this) {
    AppExperienceLevel.noExperience => 'enums.experience_level.no_experience',
    AppExperienceLevel.oneToThree => 'enums.experience_level.one_to_three',
    AppExperienceLevel.threeToSix => 'enums.experience_level.three_to_six',
    AppExperienceLevel.overSix => 'enums.experience_level.over_six',
  };

  String get localizedLabel => label.tr();
}

// ─── Currency ─────────────────────────────────────────────────────────────────

enum AppCurrency {
  uzs,
  usd,
  eur;

  static AppCurrency? fromServer(String? value) =>
      switch (value?.toLowerCase()) {
        'uzs' => AppCurrency.uzs,
        'usd' => AppCurrency.usd,
        'eur' => AppCurrency.eur,
        _ => null,
      };

  String get serverValue => switch (this) {
    AppCurrency.uzs => 'uzs',
    AppCurrency.usd => 'usd',
    AppCurrency.eur => 'eur',
  };

  String get label => switch (this) {
    AppCurrency.uzs => 'enums.currency.uzs',
    AppCurrency.usd => 'enums.currency.usd',
    AppCurrency.eur => 'enums.currency.eur',
  };

  /// Displayable symbol/code — does not require localization
  String get displayCode => switch (this) {
    AppCurrency.uzs => 'UZS',
    AppCurrency.usd => 'USD',
    AppCurrency.eur => 'EUR',
  };

  String get localizedLabel => label.tr();
}

// ─── Work Format ─────────────────────────────────────────────────────────────

enum WorkFormat {
  onSite,
  remote,
  hybrid,
  travel;

  static WorkFormat? fromServer(String? value) => switch (value) {
    'on_site' => WorkFormat.onSite,
    'remote' => WorkFormat.remote,
    'hybrid' => WorkFormat.hybrid,
    'travel' => WorkFormat.travel,
    _ => null,
  };

  String get serverValue => switch (this) {
    WorkFormat.onSite => 'on_site',
    WorkFormat.remote => 'remote',
    WorkFormat.hybrid => 'hybrid',
    WorkFormat.travel => 'travel',
  };

  String get label => switch (this) {
    WorkFormat.onSite => 'enums.work_format.on_site',
    WorkFormat.remote => 'enums.work_format.remote',
    WorkFormat.hybrid => 'enums.work_format.hybrid',
    WorkFormat.travel => 'enums.work_format.travel',
  };

  String get localizedLabel => label.tr();
}

// ─── Resume Visibility ────────────────────────────────────────────────────────

enum ResumeVisibility {
  public,
  private;

  static ResumeVisibility? fromServer(String? value) => switch (value) {
    'public' => ResumeVisibility.public,
    'private' => ResumeVisibility.private,
    _ => null,
  };

  String get serverValue => switch (this) {
    ResumeVisibility.public => 'public',
    ResumeVisibility.private => 'private',
  };

  String get label => switch (this) {
    ResumeVisibility.public => 'enums.visibility.public',
    ResumeVisibility.private => 'enums.visibility.private',
  };

  String get localizedLabel => label.tr();
}

// ─── Network Status ───────────────────────────────────────────────────────────

enum NetworkStatus {
  online,
  offline;

  static NetworkStatus? fromServer(String? value) => switch (value) {
    'online' => NetworkStatus.online,
    'offline' => NetworkStatus.offline,
    _ => null,
  };

  String get serverValue => switch (this) {
    NetworkStatus.online => 'online',
    NetworkStatus.offline => 'offline',
  };

  String get label => switch (this) {
    NetworkStatus.online => 'enums.network_status.online',
    NetworkStatus.offline => 'enums.network_status.offline',
  };

  String get localizedLabel => label.tr();
}

// ─── Gender ───────────────────────────────────────────────────────────────────

enum AppGender {
  male,
  female;

  static AppGender? fromServer(String? value) => switch (value) {
    'male' => AppGender.male,
    'female' => AppGender.female,
    _ => null,
  };

  String get serverValue => switch (this) {
    AppGender.male => 'male',
    AppGender.female => 'female',
  };

  String get label => switch (this) {
    AppGender.male => 'enums.gender.male',
    AppGender.female => 'enums.gender.female',
  };

  String get localizedLabel => label.tr();
}

// ─── Role ─────────────────────────────────────────────────────────────────────

enum AppRole {
  candidate,
  employer,
  admin;

  static AppRole? fromServer(String? value) => switch (value) {
    'candidate' => AppRole.candidate,
    'employer' => AppRole.employer,
    'admin' => AppRole.admin,
    _ => null,
  };

  String get serverValue => switch (this) {
    AppRole.candidate => 'candidate',
    AppRole.employer => 'employer',
    AppRole.admin => 'admin',
  };

  String get label => switch (this) {
    AppRole.candidate => 'enums.role.candidate',
    AppRole.employer => 'enums.role.employer',
    AppRole.admin => 'enums.role.admin',
  };

  String get localizedLabel => label.tr();
}
