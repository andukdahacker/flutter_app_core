import 'dart:async';

abstract class UseCase<Input, Output> {
  FutureOr<Output> execute(
    Input input,
  );
}

abstract class NoInputUseCase<Output> {
  FutureOr<Output> execute();
}
