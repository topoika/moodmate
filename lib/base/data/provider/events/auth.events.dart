part of "../provider.dart";

class AuthEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserEvent extends AuthEvents {}

class LoginEvent extends AuthEvents {
  final User user;

  LoginEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class LogoutEvent extends AuthEvents {}

class RegisterEvent extends AuthEvents {
  final User user;

  RegisterEvent({required this.user});
  @override
  List<Object?> get props => [user];
}
