class Urls {
  //base urls
  static String ip = "mkacademyapp.com";
  static String baseUrl = "http://$ip/api/";

  //auth endpoint
  static String login = "auth/login";
  static String logout = "auth/logout";
  static String register = "auth/register";
  static String verifiPhoneNum = "auth/verify-account";
  static String getCities = "cities";
  static String getProfile = "auth/me";
  static String forgetPassword = "auth/forget-password";
  static String verfiResetPassword = "auth/verify-reset-password";
  static String resendCode = "/auth/resend-code";
  static String updateProfile = "auth/me";

  //leaderbord
  static String getHome = "home";

  //version
  static String getVersion = "versions";
}
