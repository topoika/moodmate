part of "../provider.dart";

ValueNotifier<User> currentUser = ValueNotifier<User>(User());

class AuthRepo extends NetworkRequest {
  // login
  Future<User> login(User user) async {
    try {
      final response = await post("login", body: user.toMap());
      if (response['success'] == true) {
        currentUser.value = User.fromMap(response['user']);
        Storage.saveData("authToken", response['token']);
        return currentUser.value;
      } else {
        throw CustomError(response['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  // register
  Future<User> register(User user) async {
    try {
      final response = await post("register", body: user.toMap());
      if (response['success'] == true) {
        currentUser.value = User.fromMap(response['user']);
        Storage.saveData("authToken", response['token']);
        return currentUser.value;
      } else {
        throw CustomError(response['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  // get user
  Future<User> getUser() async {
    try {
      final response = await get("get-user");
      if (response['success'] == true) {
        currentUser.value = User.fromMap(response['data']);
        return currentUser.value;
      } else {
        throw CustomError(response['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  // logout
  Future<void> logout() async {
    try {
      currentUser.value = User();
      Storage.deleteData("authToken");
    } catch (e) {
      rethrow;
    }
  }
}
