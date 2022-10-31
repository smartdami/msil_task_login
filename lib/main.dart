import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msil_task_login/repositories/contacts/contacts_repo.dart';
import 'package:msil_task_login/repositories/login/login_repo.dart';

import 'package:msil_task_login/ui/screens/login/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ContactsRepo(),
        ),
         RepositoryProvider(
          create: (context) => LoginRepo(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(body: LoginScreen()),
      ),
    );
  }
}
