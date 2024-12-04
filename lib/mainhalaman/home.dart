import 'dart:async';
import 'package:cinepolis/navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Home> {
  final List<String> bannerImages = [
    'assets/tanah jawa.jpg',
    'assets/puisi cinta.jpg',
    'assets/rumah dinas.jpg',
  ];

  final List<String> nowShowingImages = [
    'assets/bor.jpeg',
    'assets/uwang.jpg',
    'assets/kaka.jpeg',
    'assets/kar.png',
    'assets/lass.jpeg',
  ];

  final List<String> upcomingImages = [
    'assets/venom.png',
    'assets/air.png',
    'assets/balap.jpg',
    'assets/bett.jpeg',
    'assets/sekawan.jpeg',
  ];

  final List<String> promotionImages = [
    'assets/magrip.jpg',
    'assets/gundul.jpeg',
    'assets/kartun.jpg',
  ];

  late final PageController _bannerController;
  late final PageController _nowShowingController;
  late final PageController _upcomingController;

  int _currentPage = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _bannerController = PageController(initialPage: 2);
    _nowShowingController = PageController(viewportFraction: 0.3);
    _upcomingController = PageController(viewportFraction: 0.3);

    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _bannerController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _bannerController.dispose();
    _nowShowingController.dispose();
    _upcomingController.dispose();
    super.dispose();
  }

  Widget buildZoomablePageView({
    required List<String> images,
    required PageController controller,
  }) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double value = 1.0;
              if (controller.position.haveDimensions) {
                value = controller.page! - index;
                value = (1 - value.abs() * 0.2).clamp(0.8, 1.0);
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 229, 229),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                SizedBox(width: 5),
                Text(
                  "Malang",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
            SizedBox(height: 4),
          ],
        ),
        actions: [
          Icon(Icons.favorite_border, color: Color.fromARGB(255, 0, 0, 0)),
          Icon(Icons.notifications, color: Color.fromARGB(255, 0, 0, 0)),
          Icon(Icons.account_circle, color: Color.fromARGB(255, 0, 0, 0))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 188, 184, 184),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hai Guest',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Mau nonton apa hari ini?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            buildZoomablePageView(
              images: bannerImages,
              controller: _bannerController,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Now Showing',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to a "See All" page or perform any action
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildZoomablePageView(
              images: nowShowingImages,
              controller: _nowShowingController,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to a "See All" page or perform any action
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildZoomablePageView(
              images: upcomingImages,
              controller: _upcomingController,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Promotion',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: promotionImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        promotionImages[index],
                        fit: BoxFit.cover,
                        width: 300,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}