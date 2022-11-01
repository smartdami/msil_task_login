import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msil_task_login/bloc/login_bloc.dart';
import 'package:msil_task_login/repositories/login/login_repo.dart';

import 'package:msil_task_login/ui/screens/contact/contact_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginBloc(RepositoryProvider.of<LoginRepo>(context))
        ..add(LoginInitialEvent()),
      child: Scaffold(
        key: scaffoldKey,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errormessage!)));
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => ContactPageList()));
            }
            if (state is LoginSuccessfulState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login successful')));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ContactPageList()));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is LoginInitialState || state is LoginErrorState) {
                if (state is LoginInitialState) {
                  nameController.text = state.emailadd;
                }
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: ListView(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Sample Task',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              )),
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: ((value) {
                                if ((value != null || value != "") &&
                                    !value!.contains("@")) {
                                  return "Please Enter Email Address";
                                }
                                return null;
                              }),
                              controller: nameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User Name',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                              validator: ((value) {
                                if (value == null || value == "") {
                                  return "Please Enter Password";
                                } else {
                                  return null;
                                }
                              }),
                            ),
                          ),
                          Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                child: const Text('Login'),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        LoginReqEvent({
                                      "email": nameController.text,
                                      "password": passwordController.text
                                    }));
                                  }
                                },
                              )),
                        ],
                      ),
                    ));
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
