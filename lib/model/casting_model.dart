class Casting {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  Casting({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory Casting.fromJson(Map<String, dynamic> json) {
    return Casting(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Name not found',
      character: json['character'] ?? 'Character not found',
      profilePath: json['profile_path'] ?? '',
    );
  }
}