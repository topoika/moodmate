part of "helper.dart";

// make

class CustomError implements Exception {
  final String message;
  final int? errorCode;

  CustomError(this.message, {this.errorCode});

  @override
  String toString() {
    if (_isNetworkError(message)) {
      return "Please check your internet connection and try again.";
    } else {
      // check if error has Unauthenticated
      if (message.contains("Unauthenticated")) {
        return "Session expired. Please log in again.";
      }

      // check if error is html document
      if (message.contains("<html>")) {
        return "Server errror. Please try again.";
      }
      if (errorCode != null) {
        return '$message (Error Code: $errorCode)';
      }
      return message;
    }
  }

  // Method to check if the message contains network-related errors
  bool _isNetworkError(String message) {
    return [
      "HandshakeException",
      "SocketException",
      "ClientException",
      "NetworkException",
      "ConnectionException",
      "TimeoutException",
      "SSLException",
      "UnknownHostException",
      "ConnectTimeoutException",
      "SocketTimeoutException",
      "NoRouteToHostException",
      "BindException",
      "ConnectionResetByPeerException",
      "InterruptedIOException",
      "MalformedURLException",
      "ProxyException",
      "ServerException",
    ].any((error) => message.contains(error));
  }
}
