class DayTime {
  final String sunRise;
  final String sunSet;

  DayTime({required this.sunRise, required this.sunSet});
  factory DayTime.fromJson(Map<String, dynamic> json) {
    return DayTime(
      sunRise: json['forecastday'][0]['astro']['sunrise'],
      sunSet: json['forecastday'][0]['astro']['sunset'],
    );
  }
}
