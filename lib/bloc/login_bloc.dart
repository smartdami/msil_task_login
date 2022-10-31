import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:msil_task_login/repositories/login/login_repo.dart';

import 'package:msil_task_login/repositories/login/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginRepo;
  LoginBloc(this._loginRepo) : super(const LoginInitialState("")) {
    on<LoginInitialEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String emailadd = prefs.getString("email") ?? "";
      emit(LoginInitialState(emailadd));
    });
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLoadingState());

      LoginResponse response = await _loginRepo.loginrepo(event.loginRequest);
      if (response.token != null) {
        final prefs = await SharedPreferences.getInstance();

        prefs.setString('email', event.loginRequest["email"].toString());

        emit(LoginSuccessfulState());
      } else {
        emit(LoginErrorState(response.errormessage));
      }
    });
  }
}
