import 'package:crud_flutter/extensions/string.dart';

String? passwordValidator(String? value) {
  String? answer;
  if (value == null || value.isEmpty) {
    return 'Por favor, digite uma senha';
  }
  if (!value.hasUppercaseChar) {
    answer = 'Sua senha precisa ter pelo menos uma letra maiúscula';
  }
  if (!value.hasLowercaseChar) {
    answer = 'Sua senha precisa ter pelo menos uma letra minúscula';
  }
  if (!value.hasDigit) {
    answer = 'Sua senha precisa ter pelo menos um número';
  }
  if (!value.hasSpecialChar) {
    answer = 'Sua senha precisa ter pelo menos um caracter especial';
  }
  if (!value.isValidPasswordLength) {
    answer = 'Sua senha precisa ter entre 6 e 12 digitos';
  }
  return answer;
}
