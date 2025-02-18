enum Signup {
  signup,
  userName,
  enterUserName,
  firstName,
  enterFirstName,
  lastName,
  enterLastName,
  email,
  enterEmail,
  password,
  enterPassword,
  confirmPassword,
  enterConfirmPassword,
  phoneNumber,
  enterPhoneNumber,
  haveAnAccount,
}

enum Validation {
  emailReq,
  enterValidEmail,
  passReq,
  pass8Char,
  passUpperCase,
  pass1Num,
  pass1SpecialChar,
  fieldReq,
  field2Char,
  fieldOnlyLetters,
  userNameReq,
  username3Char,
  usernameOnlyLettersNums,
  phoneReq,
  enterValidPhoneNum,
  confirmPassReq,
  passNotMatched,
}

enum ForgetPassword {
  password,
  forgetPassword,
  pleaseEnterUrEmail,
  coontinue,
}

abstract class StringManager {
  static const String noInternet = "No Internet Connection";
  static const Map<dynamic, String> signup = {
    Signup.signup: "Sign up",
    Signup.userName: "User name",
    Signup.enterUserName: "Enter your user name",
    Signup.firstName: "First name",
    Signup.enterFirstName: "Enter first name",
    Signup.lastName: "Last name",
    Signup.enterLastName: "Enter Last name",
    Signup.email: "Email",
    Signup.enterEmail: "Enter your Email",
    Signup.password: "Password",
    Signup.enterPassword: "Enter password",
    Signup.confirmPassword: "Confirm password",
    Signup.phoneNumber: "Phone number",
    Signup.enterPhoneNumber: "Enter phone number",
    Signup.haveAnAccount: "Already have an account? ",
  };
  static const Map<dynamic, String> validation = {
    Validation.emailReq: "Email is required",
    Validation.enterValidEmail: "Enter a valid email",
    Validation.passReq: "Password is required",
    Validation.pass8Char: "Password must be at least 8 characters long",
    Validation.passUpperCase:
        "Password must contain at least one uppercase letter",
    Validation.pass1Num: "Password must contain at least one number",
    Validation.pass1SpecialChar:
        "Password must contain at least one special character",
    Validation.fieldReq: "Field is required",
    Validation.field2Char: "Field must be at least 2 characters long",
    Validation.fieldOnlyLetters: "Field can only contain letters",
    Validation.userNameReq: "Username is required",
    Validation.username3Char: "Username must be at least 3 characters long",
    Validation.usernameOnlyLettersNums:
        "Username can only contain letters, numbers, and underscores",
    Validation.phoneReq: "Phone number is required",
    Validation.enterValidPhoneNum: "Enter a valid phone number",
    Validation.confirmPassReq: "Confirm Password is required",
    Validation.passNotMatched: "Passwords not matched",
  };
  static const Map<dynamic, String> forgetPassword = {
    ForgetPassword.password: "Password",
    ForgetPassword.forgetPassword: "Forget password",
    ForgetPassword.pleaseEnterUrEmail:
        "Please enter your email associated to your account",
    ForgetPassword.coontinue: "Continue",
  };
}
