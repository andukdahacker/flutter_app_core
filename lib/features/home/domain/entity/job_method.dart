enum JobMethod {
  unknown('UNKNOWN'),
  online('ONLINE'),
  offline('OFFLINE'),
  both('BOTH');

  final String value;

  const JobMethod(this.value);

  static JobMethod of(String value) {
    return JobMethod.values.firstWhere((element) => element.value == value, orElse: () => JobMethod.unknown);
  }
}