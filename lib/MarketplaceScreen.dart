import 'package:flutter/material.dart';

void main() {
  runApp(const RentDirectApp());
}

class RentDirectApp extends StatelessWidget {
  const RentDirectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RentDirect',
      theme: ThemeData(
        primaryColor: const Color(0xFF0052CC),
        scaffoldBackgroundColor: Colors.lightGreenAccent[100],
        fontFamily: 'Radley',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF0052CC),
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MarketplaceScreen(),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'RentDirect',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Radiocanada',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Search apartment, area...', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Radley')),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryItem(Icons.add_home_work, 'Flat'),
                    categoryItem(Icons.apartment_outlined, 'Apartment'),
                    categoryItem(Icons.meeting_room, 'Studio'),
                    categoryItem(Icons.house_outlined, 'Duplex'),
                    categoryItem(Icons.king_bed, 'Self-Contain'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Featured Property', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('See All', style: TextStyle(color: Colors.green)),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    featuredPropertyCard('https://via.placeholder.com/300', '400 sqm', '5 Rooms, 5 Bath', '3 Cars'),
                    featuredPropertyCard('https://via.placeholder.com/300', '300 sqm', '4 Rooms, 3 Bath', '2 Cars'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text('Recent Listings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              propertyCard('3 Bedroom Flat', 'Surulere', 'NGN 1.8M/yr', true),
              propertyCard('Mini Flat', 'Ikeja', 'NGN 600k/yr', false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.saved_search_outlined), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

Widget categoryItem(IconData icon, String label) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blueGrey.shade100,
          child: Icon(icon, color: Colors.green, size: 20),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    ),
  );
}

Widget featuredPropertyCard(String imageUrl, String area, String rooms, String parking) {
  return Container(
    width: 250,
    margin: const EdgeInsets.only(right: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(imageUrl, height: 150, width: 250, fit: BoxFit.cover),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('🔥 Hot Sales', style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: const Icon(Icons.favorite_border, color: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              infoBadge('Area', area),
              infoBadge('Rooms', rooms),
              infoBadge('Parking', parking),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget infoBadge(String label, String value) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(value, style: const TextStyle(fontSize: 10, color: Colors.black)),
      ),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
    ],
  );
}

Widget propertyCard(String title, String location, String price, bool hasMonthlyRent) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: const Icon(Icons.photo, size: 40, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text(location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                if (hasMonthlyRent)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Monthly Rent Available', style: TextStyle(color: Colors.green, fontSize: 11)),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
