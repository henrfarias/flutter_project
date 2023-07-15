extension Expressions on String {
  bool get hasUppercaseChar {
    final expression = RegExp(r'[A-Z]+');
    return expression.hasMatch(this);
  }

  bool get hasLowercaseChar {
    final expression = RegExp(r'[a-z]+');
    return expression.hasMatch(this);
  }

  bool get hasSpecialChar {
    final expression = RegExp(r'[\p{P}\p{S}]+', unicode: true);
    return expression.hasMatch(this);
  }

  bool get hasDigit {
    final expression = RegExp(r'\d+', unicode: true);
    return expression.hasMatch(this);
  }

  bool get isValidPasswordLength {
    int chars = length;
    return (chars >= 6 && chars <= 12);
  }
}
