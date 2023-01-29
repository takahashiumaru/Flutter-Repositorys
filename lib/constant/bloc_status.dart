enum BlocStatus {
  initial(0),
  inProgress(1),
  success(2),
  failure(-1);

  const BlocStatus(this.value);
  final int value;

  bool get isInProgress => value == 1;
  bool get isSuccess => value == 2;
  bool get isFailure => value == -1;
}
