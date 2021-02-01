import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gif_app_example/blocs/giphy_bloc.dart';
import 'package:gif_app_example/screens/home_screen.dart';

void main() {
  runApp(BlocProvider(
    blocs: [
      Bloc((i) => GiphyBloc()),
    ],
    child: GetMaterialApp(
      title: "Giphy App",
      theme: ThemeData(fontFamily: "roboto"),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: HomeScreen(),
    ),
  ));
}


