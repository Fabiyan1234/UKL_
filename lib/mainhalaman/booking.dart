import 'package:cinepolis/navbar.dart';
import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Booking",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.timer_outlined,
                    color: Color.fromARGB(255, 188, 184, 184),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Subtitle
            const Text(
              "There's no active booking!",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 48, 47, 47),
              ),
            ),
            const SizedBox(height: 16),
            // kar
            _movieCard(
              imagePath: 'assets/kar.png', // Perbaiki path gambar
              title: 'kar',
              rating: '9.5',
              genre: 'Action, Adventure',
              ageRating: 'D 17+',
            ),
            const SizedBox(height: 16),
            // balap
            _movieCard(
              imagePath: 'assets/balap.jpg', // Perbaiki path gambar
              title: 'balap',
              rating: '9.3',
              genre: 'Action, Adventure',
              ageRating: 'R 13+',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  Widget _movieCard({
    required String imagePath,
    required String title,
    required String rating,
    required String genre,
    required String ageRating,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Movie Poster
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Movie Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Movie Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                // Movie Genre
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.red.shade100,
                      ),
                      child: Text(
                        ageRating,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      genre,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Rating
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}