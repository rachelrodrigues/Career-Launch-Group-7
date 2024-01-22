enum Sex {
  notDisclosed,
  male,
  female;
}
extension SexExt on Sex {
  String get text {
    switch( this) {
      case Sex.notDisclosed :
        return "Select";
      case Sex.male:
        return "male";
      case Sex.female:
        return "female";
    }
  }
}