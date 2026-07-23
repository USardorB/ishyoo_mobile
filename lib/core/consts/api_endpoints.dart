abstract class ApiEndpoints {
  static const baseUrl = "https://dev.api.ishyoo.uz/api/v1";

  // Auth Endpoints
  static const String smsRequest = "/auth/{role}/sms-request";
  static const String register = "/auth/{role}/register";
  static const String verify = "/auth/{role}/verify";
  static const String login = "/auth/{role}/login";
  static const String getMe = "/auth/{role}/me";
  static const String refreshToken = "/auth/{role}/refresh-token";
  static const String logout = "/auth/{role}/logout";
  
  static const String forgotPasswordSmsRequest = "/auth/{role}/forgot-password/sms-request";
  static const String forgotPasswordVerify = "/auth/{role}/forgot-password/verify";
  static const String forgotPasswordReset = "/auth/{role}/forgot-password/reset";
}
