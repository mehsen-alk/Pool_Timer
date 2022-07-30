extension NonNullString on String? {
  bool nullOrEmpty() {
    if (this == null || this!.isEmpty || this == '') return true;
    return false;
  }
}
