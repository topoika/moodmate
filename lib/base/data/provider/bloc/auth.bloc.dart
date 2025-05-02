part of "../provider.dart";

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthRepo repo;
  AuthBloc({required this.repo}) : super(AuthStates()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
    on<GetUserEvent>(getUser);
    on<LogoutEvent>(logout);
  }

  void login(LoginEvent event, emit) async {
    emit(AuthLoading());
    try {
      final user = await repo.login(event.user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void register(RegisterEvent event, emit) async {
    emit(AuthLoading());
    try {
      final user = await repo.register(event.user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void getUser(GetUserEvent event, emit) async {
    emit(AuthLoading());
    try {
      final user = await repo.getUser();
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void logout(LogoutEvent event, emit) async {
    emit(AuthLoading());
    try {
      await repo.logout();
      emit(AuthSuccess(user: User()));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
