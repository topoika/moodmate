part of "../provider.dart";

class AuthStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthError extends AuthStates {
  final String message;

  AuthError({required this.message});
  @override
  List<Object?> get props => [message];
}

class AuthSuccess extends AuthStates {
  final User user;

  AuthSuccess({required this.user});
  @override
  List<Object?> get props => [user];
}
