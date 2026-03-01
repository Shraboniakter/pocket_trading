import 'package:flutter_riverpod/legacy.dart';
import '../../../../data/property_model.dart';

class PropertyNotifier extends StateNotifier<List<PropertyModel>> {
  PropertyNotifier() : super([]);

  void addProperty(PropertyModel property) {
    state = [...state, property];
  }

  void deleteProperty(int index) {
    final list = [...state];
    list.removeAt(index);
    state = list;
  }
}

final propertyProvider =
    StateNotifierProvider<PropertyNotifier, List<PropertyModel>>(
      (ref) => PropertyNotifier(),
    );
