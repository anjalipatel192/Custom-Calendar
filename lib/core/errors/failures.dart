/// Base failure class for representing domain and infrastructure errors.
abstract class Failure {
  final String message;
  final Object? cause;

  const Failure(this.message, [this.cause]);

  @override
  String toString() =>
      '$runtimeType: $message${cause != null ? ' (Cause: $cause)' : ''}';
}

/// Thrown when local asset bundle fails to load.
class AssetLoadFailure extends Failure {
  const AssetLoadFailure(super.message, [super.cause]);
}

/// Thrown when decoding or parsing calendar JSON fails.
class DataParsingFailure extends Failure {
  const DataParsingFailure(super.message, [super.cause]);
}
