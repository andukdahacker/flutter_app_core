class ValidationUtils {
  static const Pattern rgxEmailPattern = r'^[a-zA-Z0-9_.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  static const Pattern rgxPasswordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static String? validateEmail(String email) {
    final RegExp regex = RegExp(rgxEmailPattern as String);
    if (email.isEmpty) {
      return 'Please enter your email address.';
    } else if (!regex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String password) {
    final RegExp regex = RegExp(rgxPasswordPattern as String);

    if(password.isEmpty) {
      return 'Please enter your password';
    } else if(!regex.hasMatch(password)) {
      return 'Password must contain at least 8 characters, 1 upper case letter, 1 lower case letter, 1 digit, 1 special character';
    } else {
      return null;
    }
  }
}
