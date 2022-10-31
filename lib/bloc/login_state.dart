part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  final String emailadd;

  const LoginInitialState(this.emailadd);
  @override
  List<Object> get props => [emailadd];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessfulState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  final dynamic errormessage;

  const LoginErrorState(this.errormessage);
  @override
  List<Object> get props => [errormessage];
}
