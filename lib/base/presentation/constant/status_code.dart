enum StatusCode {
  unknown(-1),
  success(200),
  ;

  const StatusCode(this.value);

  final int value;

  static StatusCode of(int? value) {
    return StatusCode.values.firstWhere(
      (element) => element.value == value,
      orElse: () => StatusCode.unknown,
    );
  }
}
