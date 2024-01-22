import 'dart:math';
import '../model/user_info.dart';

class WebService {

  static MeanStdDev currentSmokerStats = MeanStdDev(0.49022, 0.49997);
  static MeanStdDev hypertensionStats = MeanStdDev(0.30929, 0.46226);
  static MeanStdDev diabetesStats = MeanStdDev(0.02571, 0.15744);
  static MeanStdDev sexStats = MeanStdDev(0.43472, 0.49578 );
  static MeanStdDev heartRateStats = MeanStdDev(75.83619, 12.0634);
  static MeanStdDev bmiStats = MeanStdDev(25.7976, 4.0776);
  static MeanStdDev totalCholStats = MeanStdDev(236.66, 44.4678);
  static MeanStdDev bpMedsStats = MeanStdDev(0.02934, 0.16878);
  static MeanStdDev diaBpStats = MeanStdDev(82.8927, 11.8395);
  static MeanStdDev glucoseStats = MeanStdDev(81.887, 22.871);
  static MeanStdDev sysBpStats = MeanStdDev(132.2265, 21.9015);
  static MeanStdDev ageStats = MeanStdDev(49.4995, 8.5422);
  static MeanStdDev numCigsStats = MeanStdDev(8.99535, 11.9134);
  
  static double predict(UserInfo userInfo) {
    /*double z = 0.01566 -0.429*userInfo.currentSmoker - 0.357*userInfo.hypertension
        - 0.182*userInfo.diabetes - 0.165*userInfo.sex - 0.085*userInfo.heartRate
        + 0.013*userInfo.bmi + 0.069*userInfo.totalCholesterol + 0.086*userInfo.bpMeds
        + 0.18*userInfo.diaBp + 0.341*userInfo.glucose + 0.425*userInfo.sysBp
        + 0.6*userInfo.age + 0.746*userInfo.numCigarettes;*/
    double z = 0.01566 -0.429*currentSmokerStats.zScore(userInfo.currentSmoker.toDouble())
        - 0.357*hypertensionStats.zScore(userInfo.hypertension.toDouble())
        - 0.182*diabetesStats.zScore(userInfo.diabetes.toDouble())
        - 0.165*sexStats.zScore(userInfo.sex.toDouble())
        - 0.085*heartRateStats.zScore(userInfo.heartRate.toDouble())
        + 0.013*bmiStats.zScore(userInfo.bmi)
        + 0.069*totalCholStats.zScore(userInfo.totalCholesterol.toDouble())
        + 0.086*bpMedsStats.zScore(userInfo.bpMeds.toDouble())
        + 0.18*diaBpStats.zScore(userInfo.diaBp)
        + 0.341*glucoseStats.zScore(userInfo.glucose.toDouble())
        + 0.425*sysBpStats.zScore(userInfo.sysBp)
        + 0.6*ageStats.zScore(userInfo.age.toDouble())
        + 0.746*numCigsStats.zScore(userInfo.numCigarettes.toDouble());

    double probability = 1 / (1 + exp(-1 * z)) * 100;
    probability = double.parse(probability.toStringAsFixed(2));
    return probability;
    //z = diabetesStats.zScore(input)
    //print('Probability: $probability');
    //return (probability > 0.5) ? true : false;
  }
}

class MeanStdDev {
  double mean = 0.0;
  double stdDev = 0.0;

  MeanStdDev(this.mean, this.stdDev);

  double zScore(double input) {
    return (input - mean)/stdDev;
  }
}