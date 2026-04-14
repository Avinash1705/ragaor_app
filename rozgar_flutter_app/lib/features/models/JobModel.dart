class JobModel {
  final int id;
  final String name;
  final String location;
  final String profession;
  final double income;
  final int days;
  final String workNeeded;
  final String intensive;
  final int experience;

  JobModel({
    required this.id,
    required this.name,
    required this.location,
    required this.profession,
    required this.income,
    required this.days,
    required this.workNeeded,
    required this.intensive,
    required this.experience,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    int toInt(dynamic v) => int.tryParse(v.toString()) ?? 0;
    double toDouble(dynamic v) =>
        double.tryParse(v.toString()) ?? 0.0;

    return JobModel(
      id: toInt(json['id']),
      name: json['name']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      profession: json['profession']?.toString() ?? '',
      income: toDouble(json['income']),
      days: toInt(json['days']),
      workNeeded: json['work_needed']?.toString() ?? '',
      intensive: json['intensive']?.toString() ?? '',
      experience: toInt(json['experience']),
    );
  }
}