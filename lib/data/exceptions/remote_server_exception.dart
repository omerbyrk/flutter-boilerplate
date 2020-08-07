abstract class RemoteServerException {
  factory RemoteServerException([var message]) =>
      _RemoteServerException(message);
}

class _RemoteServerException implements RemoteServerException {
  final message;

  _RemoteServerException([this.message]);

  String toString() {
    if (message == null) return "RemoteServerException";
    return message.toString();
  }
}
