class SkillResponse {
  final bool status;
  final List<Skill> data;

  SkillResponse({
    required this.status,
    required this.data,
  });

  factory SkillResponse.fromJson(Map<String, dynamic> json) {
    return SkillResponse(
      status: json['status'],
      data: List<Skill>.from(
        json['data'].map((x) => Skill.fromJson(x)),
      ),
    );
  }
}

class Skill {
  final String id;
  final String name;

  Skill({
    required this.id,
    required this.name,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      name: json['name'],
    );
  }
}