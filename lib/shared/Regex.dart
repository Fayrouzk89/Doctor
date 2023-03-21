class Regex {
  static bool isEmail(String email) {
    RegExp regExp = new RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*');
    return regExp.hasMatch(email);
  }
  static bool isPhone(String email) {
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }
  static bool getphone(String? phone) {
    var string = '05';
    return phone!.startsWith(string);
  }

  static bool isPassword(String value) {
    const pattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

}