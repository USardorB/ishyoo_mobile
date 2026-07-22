# UI Implementation Map

This document serves as a comprehensive map of all screens in the application, highlighting what functionalities need to be implemented, connected to the backend, or adjusted.

## 1. Employer / HR Flow

### 1.1 HR Dashboard (`hr_dashboard_page.dart` & `hr_dashboard_app_bar.dart`)
- [x] Layout and Recent Vacancies list implemented.
- [x] Navigation to "Create Vacancy", "My Vacancies", and "Details" works.
- [x] **Analytics Data**: Connected to `interviewsTodayCount`, `newApplicantsCount`, and `activeVacanciesCount` from `employer/stats`.
- [x] **Trending Status**: Mocked with static placeholders since history data is missing, but layout is set up.
- [ ] **Support Agent Button**: Headset icon in `hr_dashboard_app_bar.dart` has an empty `onPressed`.
- [x] **Organization Info**: Wrapped in `EmployerOrganizationBloc` to display real name and logo from `/employer/organization`.

### 1.2 My Vacancies (`my_vacancies_page.dart`)
- [x] Basic list UI implemented.
- [x] **Pagination**: Added infinite scroll logic fetching chunks of 10 items.
- [ ] **Filtering**: Skipped for now per user instructions.

### 1.3 Create Vacancy (`create_vacancy_page.dart` & `no_vacancies_placeholder.dart`)
- [x] Multi-step form UI and state management in place.
- [x] Placeholder CTA is correctly wired to push `CreateVacancyRoute`.
- [x] **API Integration**: Linked `createVacancy` endpoint perfectly with mapped fields, dynamically fetching `/employer/vacancy/specialization`.
- [ ] **Empty State Action**: `no_vacancies_placeholder.dart` has an empty `onTap` for the create button.

### 1.4 Applicants Management (`applicants_page.dart`, `applicant_details_page.dart`, `application_card.dart`)
- [x] Base scaffolding for lists and detail view.
- [ ] **Dynamic Tabs**: The tabs ("Ko'rilmaganlar (89)", "Taklif etilganlar (5)") are static text. They need to show dynamic counts and actually filter the list.
- [ ] **Applicant Actions**: `new_applicant_action_buttons.dart` and `RespondApplicationSheet` have empty callbacks. Need full API integration to update applicant statuses (invite to interview, reject, etc.).
- [ ] **Contact Action**: `application_card.dart` has an empty `onTap` for contacting candidates.
- [ ] **Share Functionality**: Implement `share_plus` to share applicant profiles.

### 1.5 HR Profile (`hr_profile_page.dart` & inner widgets)
- [x] Profile view and fields layout.
- [x] **Company Logo**: Implement image picker to upload/update the company logo (`PUT /employer/organization/logo`).
- [x] **Edit Buttons**: Multiple empty `onTap` callbacks found in `about_the_company.dart`, `field_of_activity.dart`, and `hr_profile_company_info.dart`.
- [x] **Manage Vacancies Action**: `my_vacancies.dart` widget in profile has an empty `onTap`.
- [x] **Edit Info Submission**: Ensure all fields in the edit page sync properly with `PUT /employer/organization`.

---

## 2. Candidate Flow

### 2.1 Candidate Dashboard (`candidate_home_page.dart`, `candidate_home_banner.dart`, `candidate_quick_access_cards.dart`)
- [x] UI layout and bottom navigation bar integration.
- [x] **Search Implementation**: The top search bar needs to navigate to a real search screen. (VacancySearchPage added)
- [x] **Dynamic Banner**: The top banner has an empty `onPressed` button. Hook it up to a marketing endpoint or navigation. (Made swappable via PageView)
- [ ] **Quick Access Actions**: Circular buttons ("Nearby Jobs", "Remote") in `candidate_quick_access_cards.dart` have empty `onTap` callbacks. (Left as is per request)
- [ ] **Support Agent Button**: Headset icon has an empty `onPressed`. (Left as is per request)

### 2.2 Vacancy Listing (`saved_vacancies_page.dart`, `nearby_jobs_page.dart`, `vacancy_listing_item.dart`)
- [x] Base listing pages.
- [ ] **Filter/Action Buttons**: The app bar action buttons have empty `onPressed` handlers.
- [ ] **Favorite/Save**: The heart icon inside `vacancy_listing_item.dart` has an empty `onPressed` and needs to toggle saved status.

### 2.3 Vacancy Details (`vacancy_details_page.dart`, `apply_to_vacancy_sheet.dart`)
- [x] Detailed UI layout, apply bottom sheet, save/favorite logic.
- [ ] **Share Vacancy**: The share button has an empty `onPressed`. Hook up `share_plus`.
- [ ] **Map View**: `vacancy_map_placeholder.dart` has empty `onTap` callbacks. Needs to open real map integrations (e.g., Maps app).
- [ ] **Upload Custom Resume**: The `apply_to_vacancy_sheet.dart` has an empty `onTap` for custom resume upload.

### 2.4 Candidate Profile & Resume (`candidate_profile_page.dart`, `resume_details_page.dart`)
- [x] Resume listing and profile UI.
- [x] Edit resume forms (education, experience, skills).
- [ ] **Share Resume**: The share button in `resume_details_page.dart` has an empty `onPressed`.
- [ ] **Resume Stats**: `resume_stats_section.dart` has an empty `onTap`. Needs to show search appearances/views.

---

## 3. Shared & Core Flow

### 3.1 Authentication (`login_page.dart`, `register_page.dart`, `confirm_password_page.dart`)
- [x] Base layout and API integration.
- [ ] **Password Visibility**: The eye icon in `confirm_password_page.dart` has an empty `onTap`.
- [ ] **OTP Handling**: Ensure the timer and resend logic are robust.
- [ ] **Social Auth**: If planned, Google/Apple login buttons need actual OAuth implementations.

### 3.2 Messaging (`chats_page.dart`, `chat_actions_sheet.dart`)
- [x] List and chat window layouts.
- [ ] **Disabled Chat List Button**: `chats_page.dart` has an `onPressed: null` (likely for new chat).
- [ ] **Chat Actions**: `chat_actions_sheet.dart` has empty `onTap` callbacks.
- [ ] **Real-time Engine**: Connect to WebSockets or implement polling for real-time message delivery.

### 3.3 Notifications (`notifications_page.dart`)
- [x] Basic list layout.
- [ ] **FCM Integration**: Set up Firebase Cloud Messaging to receive background push notifications.

### 3.4 Candidate Articles (Missing Feature)
- [ ] **Entire Flow Missing**: The Candidate Articles feature (6 endpoints) needs to be built from scratch, taking inspiration from the notifications pages.

---

*This file will be continuously updated as functionalities are implemented.*
