import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
     print('Splash screen started');
    // Menjalankan fungsi setelah 4 detik
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/login'); // Mengarahkan ke halaman berikutnya
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 55, 100), // Latar belakang biru
      body: Center(
        child: Image.asset('assets/logo_keduwa.png', width: 300),
    )); 
  }
}
