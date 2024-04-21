import '../../domain/entities/discover_more_entity.dart';

abstract class DiscoverMoreMapper {
  static DiscoverMoreEntity discoverMoreFromJson(Map<String, dynamic> json) {
    return DiscoverMoreEntity(
      discoverTitle: json['discoverTitle'] ?? '',
      discoverDescription: json['discoverDescription'] ?? '',
      discoverImage: json['discoverImage'] ?? '',
    );
  }
}
