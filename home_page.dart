import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'UniBook',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('EN | AR', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              '📚 Welcome to UniBook',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your trusted place to buy university books easily.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              child: const Text('Explore Books',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 30),

            // About Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About UniBook',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'UniBook is a digital platform made for university students to buy and access academic books easily and affordably.',
            ),
            const SizedBox(height: 20),

            // Mission Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Mission',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'To make learning resources more accessible and affordable for every university student.',
            ),
            const SizedBox(height: 20),

            // Vision Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Vision',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'To become the #1 trusted bookstore for students across the Arab world.',
            ),
            const SizedBox(height: 20),

            // Services Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.menu_book, color: Colors.blue),
                  title: Text('Wide Range of Books'),
                ),
                ListTile(
                  leading: Icon(Icons.attach_money, color: Colors.blue),
                  title: Text('Affordable Prices'),
                ),
                ListTile(
                  leading: Icon(Icons.local_shipping, color: Colors.blue),
                  title: Text('Fast & Secure Delivery'),
                ),
                ListTile(
                  leading: Icon(Icons.support_agent, color: Colors.blue),
                  title: Text('24/7 Support'),
                ),
              ],
            ),

            const Divider(thickness: 1, height: 40),

            // Quick Links
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Quick Links',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('- Login'),
                Text('- Sign Up'),
                Text('- About'),
                Text('- Help Center'),
              ],
            ),

            const SizedBox(height: 20),

            // Contact Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text('📧 support@unibook.com'),
            const Text('📞 +962 7 9999 9999'),

            const SizedBox(height: 30),
            const Divider(),
            const Text(
              '© 2025 UniBook - All Rights Reserved',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}