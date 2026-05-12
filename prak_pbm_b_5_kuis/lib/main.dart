import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/profil.jpeg"),
                  fit: BoxFit.cover,
                ),
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 22,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 220, 166, 210),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Diva Cahya Hakim - 4523210037',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Diva Cahya Hakim - 4523210037',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.4,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          color: Colors.white70,
                          size: 26,
                        ),

                        const SizedBox(width: 6),

                        const Text(
                          '100M',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),

                        const SizedBox(width: 30),

                        const Icon(
                          Icons.favorite_border,
                          color: Colors.white70,
                          size: 26,
                        ),

                        const SizedBox(width: 6),

                        const Text(
                          '1M',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 193, 103, 185),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}