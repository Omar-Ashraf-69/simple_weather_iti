class Location {
  final String name;
  final String localtime;

  Location({
    required this.name,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] ,
        localtime: json['localtime'] ,
      );


}
