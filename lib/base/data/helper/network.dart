part of "helper.dart";

final Connectivity _connectivity = Connectivity();

class NetworkRequest {
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    await _checkConnectivity();
    final response = await http
        .get(
          Uri.parse('$API_URL$endpoint'),
          headers: headers ?? getJsonHeaders(),
        )
        .onError((error, stackTrace) => throw CustomError(error.toString()));
    return _parseResponse(response);
  }

  Future<dynamic> post(String endpoint, {dynamic body, dynamic headers}) async {
    await _checkConnectivity();
    final response = await http
        .post(
          Uri.parse('$API_URL$endpoint'),
          headers: headers ?? getJsonHeaders(),
          body: json.encode(body),
        )
        .onError((error, stackTrace) => throw CustomError(error.toString()));
    return _parseResponse(response);
  }

  dynamic _parseResponse(http.Response response) {
    final body = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else if (body['status'] == false) {
      if (body['message'].toString().contains("Unauthenticated")) {
        Navigator.of(
          Get.context!,
        ).pushNamedAndRemoveUntil(AppRoutes.login, (val) => false);
        makeToast("Session expired. Please log in again.");
      }
      throw CustomError(body['error']);
    } else {
      String message = body['error'] ?? "An error occurred";
      throw CustomError(message);
    }
  }

  Future<void> _checkConnectivity() async {
    bool noConnection = await hasNoConnection();
    if (noConnection) {
      throw CustomError('No internet connection');
    }
  }
}

Future<http.MultipartFile> geQueryFile({
  required File image,
  required String name,
}) async {
  var stream = http.ByteStream(image.openRead());
  var length = await image.length();
  return http.MultipartFile(name, stream, length);
}

Future<bool> hasNoConnection() async {
  final connectivityResult = await _connectivity.checkConnectivity().then((
    value,
  ) {
    return value.contains(ConnectivityResult.none);
  });

  return connectivityResult;
}

Map<String, String> getJsonHeaders() {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    "x-route-token": ROUTE_TOKEN,
    'Authorization': 'Bearer ${Storage.getData("authToken")}',
  };
}
