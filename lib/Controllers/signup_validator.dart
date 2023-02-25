
class SignupValidator {
  static String? validateConfirmPassword(String? value, String? value2) {
    if (value == null || value.isEmpty  || value2 == null || value2.isEmpty) {
      return 'Enter your Confirm Password';
    } else if (value.length != value2.length || value != value2) {
      return 'Password doe not match';
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Phone number';
    } else if (value.length < 10) {
      return 'Phone number cannot be more less 10 digits';
    }
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter value';
    } else if (value.length > 30) {
      return 'Entry must be less than 30 characters';
    }
  }


  static String? validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter value';
    } else if (value.length > 30) {
      return 'Entry must be less than 30 characters';
    }
  }


  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter value';
    } else if (value.length > 90) {
      return 'Entry must be less than 90 characters';
    }
  }

  static String? validateDropDownButtonValues(String? value) {
    if (value == null || value.isEmpty) {
      return 'Select an entry';
    }
  }

  static String? validateEmail(String? email) {

    if (email == null || email.isEmpty ) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? address) {
    if (address == null || address.isEmpty) {
      return 'Enter your Password';
    } else if (address.length < 8) {
      return 'Password must be greater than 8 characters';
    }
  }
}
