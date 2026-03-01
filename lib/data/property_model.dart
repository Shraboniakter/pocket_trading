class PropertyModel {
  final String actionType;
  final String assetType;
  final String country;
  final String state;
  final String city;

  final String? propertyType;
  final String? roomCount;
  final String? squareFootage;
  final String? seatCount;

  final String priceRange;
  final String note;

  PropertyModel({
    required this.actionType,
    required this.assetType,
    required this.country,
    required this.state,
    required this.city,
    this.propertyType,
    this.roomCount,
    this.squareFootage,
    this.seatCount,
    required this.priceRange,
    required this.note,
  });
}