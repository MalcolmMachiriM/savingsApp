enum Frequency {
  Monthly,
  FortNight,
}

final List<Frequency> frequencyCycles = [
  Frequency.Monthly,
  Frequency.FortNight,
];

// helper extensions
extension FrequencyToString on Frequency {
  String get stringValue => toString().split('.').last;
}

extension StringToFrequency on String {
  Frequency get frequency {
    switch (toLowerCase()) {
      case 'fortnight':
        return Frequency.FortNight;

      case 'monthly':
        return Frequency.Monthly;

      default:
        return Frequency.Monthly;
    }
  }
}
