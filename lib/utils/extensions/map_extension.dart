extension MapExtension on Map {
  void changeKeyName(String oldKey, String key) {
    this[key] = this[oldKey];
    remove(oldKey);
  }
}