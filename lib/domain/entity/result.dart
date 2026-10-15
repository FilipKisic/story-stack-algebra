sealed class Result<T> {
  const Result();

  factory Result.ok(T value) => Ok<T>(value);

  factory Result.error(Exception e) => Error(e);
}

final class Ok<T> extends Result<T> {
  final T value;

  Ok(this.value);
}

final class Error<T> extends Result<T> {
  final Exception error;

  Error(this.error);
}
