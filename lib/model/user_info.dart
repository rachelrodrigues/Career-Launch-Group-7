class UserInfo {
  late int age = 0;
  late int totalCholesterol = 0;
  late int numCigarettes = 0;
  late double sysBp = 0;
  late double diaBp = 0;
  late double bmi = 0;
  late int heartRate = 0;
  late int glucose = 0;
  late int sex = 0;
  late int currentSmoker = 0;
  late int hypertension = 0;
  late int diabetes = 0;
  late int bpMeds = 0;

  @override
  String toString() {
    return 'UserInfo{age: $age, totalCholesterol: $totalCholesterol, numCigarettes: $numCigarettes, sysBp: $sysBp, diaBp: $diaBp, bmi: $bmi, heartRate: $heartRate, glucose: $glucose, sex: $sex, currentSmoker: $currentSmoker, hypertension: $hypertension, diabetes: $diabetes, bpMeds: $bpMeds}';
  }
}