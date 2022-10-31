part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginInitialEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginReqEvent extends LoginEvent {
  final dynamic loginRequest;

  const LoginReqEvent(this.loginRequest);
  @override
  List<Object> get props => [loginRequest];
}
