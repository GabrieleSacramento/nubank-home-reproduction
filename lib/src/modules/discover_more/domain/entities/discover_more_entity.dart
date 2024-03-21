class DiscoverMoreEntity {
  final String discoverTitle;
  final String discoverDescription;
  final String discoverImage;

  DiscoverMoreEntity({
    required this.discoverTitle,
    required this.discoverDescription,
    required this.discoverImage,
  });

  @override
  bool operator ==(covariant DiscoverMoreEntity other) {
    if (identical(this, other)) return true;

    return other.discoverTitle == discoverTitle &&
        other.discoverDescription == discoverDescription &&
        other.discoverImage == discoverImage;
  }

  @override
  int get hashCode =>
      discoverTitle.hashCode ^
      discoverDescription.hashCode ^
      discoverImage.hashCode;
}
