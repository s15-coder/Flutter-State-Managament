class User {
  final String name;
  final int age;
  List<String> profesions = [];
  User({required this.name, required this.age, this.profesions = const []});
  User copyWith({String? name, int? age, List<String>? profesions}) {
    return User(
        name: name ?? this.name,
        age: age ?? this.age,
        profesions: profesions ?? this.profesions);
  }
}
