class Product {
  final String name;
  final String description;
  final String imageBefore;
  final String imageAfter;

  Product({
    required this.name,
    required this.description,
    required this.imageBefore,
    required this.imageAfter,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          imageBefore == other.imageBefore &&
          imageAfter == other.imageAfter;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      imageBefore.hashCode ^
      imageAfter.hashCode;
}