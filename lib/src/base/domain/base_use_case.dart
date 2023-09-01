abstract class UseCase<Input, Output> {
  Future<Output> execute(
      Input input,
      );
}

abstract class NoInputUseCase<Output> {
  Future<Output> execute();
}
