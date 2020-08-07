abstract class SharedPrefException {
  factory SharedPrefException([var message]) => _SharedPrefException(message);
}

class _SharedPrefException implements SharedPrefException {
  final message;

  _SharedPrefException([this.message]);

  String toString() {
    if (message == null) return "SharedPrefException";
    return message.toString();
  }
}
