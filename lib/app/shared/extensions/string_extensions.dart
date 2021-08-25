extension NullOrEmptyString on String {
  bool isNullOrEmpty() => this == '' || this == null;
}