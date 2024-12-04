import 'package:cinepolis/Login_Screen.dart';
import 'package:cinepolis/mainhalaman/booking.dart';
import 'package:cinepolis/mainhalaman/cinema.dart';
import 'package:cinepolis/mainhalaman/home.dart';
import 'package:cinepolis/mainhalaman/movie.dart';
import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // Menghilangkan banner "Debug"
        title: 'BarterApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => StaticLoginScreen(),
          '/home': (context) => Home(),
          '/movie': (context) =>  MoviesPage(),
          '/cinema': (context) => CinemaPage(),
          '/booking': (context) => Booking(),
        });
  }
}
