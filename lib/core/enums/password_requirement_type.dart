enum PasswordRequirementType {
  minLength,
  hasCapitalLetter,
  hasNumber,
  ;

  String get text {
    switch (this) {
      case PasswordRequirementType.minLength:
        return 'Kamida 8 ta belgi';
      case PasswordRequirementType.hasCapitalLetter:
        return 'Kamida 1 ta katta harf';
      case PasswordRequirementType.hasNumber:
        return 'Kamida 1 ta son';
    }
  }
}
