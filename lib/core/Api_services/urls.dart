class Urls {
  //base urls
  static String ip = "www.mbrawards.ae";
  static String baseUrl = "https://$ip/CSA/webServices/SelectionService.asmx/";

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

  static String getToken = "getToken";
  static String selectionGroup = "SelectionGroup";
  static String selectionPersons = "SelectionPersons";
  static String selectionSubmit = "SelectionSubmit";

  //version
  static String getVersion = "versions";
}
