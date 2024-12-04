
import 'package:cinepolis/mainhalaman/booking.dart';
import 'package:cinepolis/mainhalaman/cinema.dart';
import 'package:cinepolis/mainhalaman/home.dart';
import 'package:cinepolis/mainhalaman/movie.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void changeSelectedNavBar(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Home()),
              );
            },
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(
              Icons.local_movies,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
          ),
          label: 'My Booking',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(
              Icons.movie_creation_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MoviesPage()),
              );
            },
          ),
          label: 'Movie',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(
              Icons.view_sidebar_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CinemaPage()),
              );
            },
          ),
          label: 'Cinema',
        ),
      ],
    );
  }
}