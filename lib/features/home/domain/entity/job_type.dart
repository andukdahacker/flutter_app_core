enum JobType {
  unknown('unknown'),
  qa('QA'),
  tutor('Tutor');

  final String value;

  const JobType(this.value);

  static JobType of(String value) {
    return JobType.values.firstWhere((element) => element.value == value,
        orElse: () => JobType.unknown);
  }
}
