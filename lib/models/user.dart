class User {
  String name;
  int age;
  List<String> professions;
  User({
    required this.name,
    required this.age,
    this.professions = const [],
  });
  User copyWith({
    String? name,
    int? age,
    List<String>? professions,
  }) =>
      User(
        professions: professions ?? this.professions,
        age: age ?? this.age,
        name: name ?? this.name,
      );
}
