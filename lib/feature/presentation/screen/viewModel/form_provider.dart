import 'package:flutter_riverpod/legacy.dart';

class PropertyFormState {
  String actionType = "";
  String assetType = "";
  String country = "";
  String state = "";
  String city = "";
  String? assetProfile ;
  String? hotelFeature ;
  String? marketSegment ;
  String? lotSize ;
  String? urgency ;
  String? propertyType;
  String? roomCount;
  String? squareFootage;
  String? seatCount;
  String? priceRange;
  String note = "";
}

final propertyFormProvider = StateProvider<PropertyFormState>(
  (ref) => PropertyFormState(),
);
