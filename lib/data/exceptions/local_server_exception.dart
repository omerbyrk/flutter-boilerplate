abstract class LocalServerException {
  factory LocalServerException([var message]) => _LocalServerException(message);
}

class _LocalServerException implements LocalServerException {
  final message;

  _LocalServerException([this.message]);

  String toString() {
    if (message == null) return "LocalServerException";
    return message.toString();
  }
}
