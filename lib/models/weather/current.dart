
class Current {
	final double tempC;
	final String condition;
	double? windKph;
	int? humidity;
	int? cloud;
	double? feelslikeC;



	Current({
		required this.tempC, 

		required this.condition, 
		this.windKph, 
		this.humidity, 
		this.cloud, 
		this.feelslikeC, 
	});

	factory Current.fromJson(Map<String, dynamic> json) => Current(
				tempC: (json['temp_c'] as num).toDouble(),
				condition: json['condition']['text'],
				windKph: (json['wind_kph'] as num?)?.toDouble(),
				humidity: json['humidity'] as int?,
				cloud: json['cloud'] as int?,
				feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
			);

}
