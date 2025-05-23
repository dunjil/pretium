bool validateEmail(String email) {
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

final List<String> countries = [
  'Kenya',
  'Uganda',
  'Nigeria',
  'Ghana',
  'Malawi',
  'Zambia',
  'Rwanda',
  'Global Users',
];
