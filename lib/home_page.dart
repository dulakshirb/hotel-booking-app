import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/providers/hotel_provider.dart';
import 'package:hotel_booking_app/screens/main/booking_screen.dart';
import 'package:hotel_booking_app/screens/main/discover_screen.dart';
import 'package:hotel_booking_app/screens/main/favourite_screen.dart';
import 'package:hotel_booking_app/screens/main/message_screen.dart';
import 'package:hotel_booking_app/services/firebase_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenNo = 0;
  List<Widget> screenList = const [
    DiscoverScreen(),
    FavouriteScreen(),
    BookingScreen(),
    MessageScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseServices.getHotels().then((hotelsData) {
      context.read<HotelProvider>().addHotels(hotels: hotelsData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenList[screenNo], // Main content

          // Positioned floating bottom navigation bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(202, 0, 0, 0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  height: 60,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bottomNavigationIcon(
                            icon: Icons.navigation,
                            iconText: 'Discover',
                            index: 0),
                        bottomNavigationIcon(
                            icon: Icons.favorite_outline,
                            iconText: 'Favorites',
                            index: 1),
                        bottomNavigationIcon(
                            icon: Icons.book, iconText: 'Booking', index: 2),
                        bottomNavigationIcon(
                            icon: Icons.message_rounded,
                            iconText: 'Messages',
                            index: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationIcon(
      {required IconData icon, required String iconText, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          screenNo = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: screenNo == index ? Colors.white : Colors.grey,
            size: screenNo == index ? 23 : 18,
          ),
          Text(
            iconText,
            style: TextStyle(
              color: screenNo == index ? Colors.white : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
