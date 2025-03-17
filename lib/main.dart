import 'package:cook_project/Presentation/home.dart';
import 'package:cook_project/Presentation/privite.dart';
import 'package:cook_project/Presentation/welcome.dart';
import 'package:cook_project/bloc_button/button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ButtonBloc()),
      ], 
      child:  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/ChaoMung',
    routes: {
      '/ChaoMung': (context) => const Welcome(),
      '/Home': (context) => const Home(),
      '/Privite': (context) => const Privite()
    },

  )),
   );
}
