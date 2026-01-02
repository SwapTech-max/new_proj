import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/screens/profile/profile_screen.dart';
import 'package:new_proj/pages/benifits/Peer_to_Peer.dart';
import 'package:new_proj/pages/benifits/Escrow_Secured_payments.dart';

/// Home Screen - Main landing page with hero section, search, and car listings
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  late Timer brandTimer;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      brandTimer = Timer.periodic(const Duration(milliseconds: 3000), (timer) {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final current = scrollController.offset;

        if (current >= maxScroll) {
          scrollController.jumpTo(0);
        } else {
          scrollController.jumpTo(current + 1);
        }
      });
    });
  }

  @override
  void dispose() {
    brandTimer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Search
            Container(
              height: 404,
              width: 430,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/home/Container.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 40),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                  left: 24,
                                  right: 24,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // LOGO
                                    Image.asset(
                                      'assets/images/home/Preownedly.png',
                                      height: 22,
                                      width: 94.29,
                                      errorBuilder: (context, error, stackTrace) => const Text(
                                        'PreOwnedly',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                    ),

                                    // RIGHT ICONS
                                    Row(
                                      children: [
                                        // 🔔 Notification
                                        GestureDetector(
                                          onTap: () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Notifications coming soon'),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 36,
                                            width: 36,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.3),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.notifications_none,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 12),

                                        // 👤 Profile
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => const ProfileScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 36,
                                            width: 36,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.3),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.person_outline,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 108,
                                  left: 24,
                                ),
                                child: Container(
                                  height: 240,
                                  width: 287,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Buy and Sell Used Cars Directly - Safely and Seamlessly',
                                        style: oswald(
                                          size: 30,
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      TextField(
                                        onChanged: (value) {
                                          print(value);
                                        },
                                        onSubmitted: (value) {
                                          print("Final search: $value");
                                        },
                                        decoration: InputDecoration(
                                          hintText: ' Search City, Brand, Price Range...',
                                          hintStyle: oswald(
                                            size: 12,
                                            weight: FontWeight.w500,
                                            color: const Color(0xFF757575),
                                          ),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 11.28,
                                              right: 19.34,
                                              left: 19.34,
                                              bottom: 11.28,
                                            ),
                                            child: const Icon(
                                              Icons.search,
                                              size: 18,
                                              color: Color(0xFF374151),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          isDense: true,
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 10,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 18),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              minimumSize: const Size(126, 38),
                                              backgroundColor: const Color(0xFFEF4444),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(4.57),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 9.68,
                                                right: 28,
                                                bottom: 9.68,
                                                left: 28,
                                              ),
                                              child: Text(
                                                'Sell Your Car',
                                                style: oswald(
                                                  size: 14,
                                                  weight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 3),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              minimumSize: const Size(128, 38),
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(4.57),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 9.68,
                                                right: 10,
                                                bottom: 9.68,
                                                left: 10,
                                              ),
                                              child: Text(
                                                'Find Your Car',
                                                style: oswald(
                                                  size: 14,
                                                  weight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // How It Works Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'How It Works',
                    style: oswald(size: 16, weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  decoration: const BoxDecoration(color: Color(0x80FFE4FB)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 9,
                      bottom: 9,
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/home/search_cars.png',
                              height: 22,
                              width: 22,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.search, size: 22),
                            ),
                            Text(
                              'Search Cars',
                              style: poppins(size: 12, weight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/home/book_visit.png',
                              height: 22,
                              width: 22,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.calendar_today, size: 22),
                            ),
                            Text(
                              'Book Visit / Buy Now ',
                              style: poppins(size: 12, weight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/home/pay.png',
                              height: 22,
                              width: 22,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.payment, size: 22),
                            ),
                            Text(
                              'Pay via Escrow',
                              style: poppins(size: 12, weight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Brand Scrolling Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Image.asset(
                      'assets/images/home/brands/honda.png',
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 72,
                        height: 72,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image),
                      ),
                    ),
                    Image.asset(
                      'assets/images/home/brands/jaguar.png',
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 72,
                        height: 72,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image),
                      ),
                    ),
                    Image.asset(
                      'assets/images/home/brands/nissan.png',
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 72,
                        height: 72,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Benefits Section
            Container(
              height: 124,
              width: 430,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Benifits', style: oswald(size: 16, weight: FontWeight.w500)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PeerToPeer(),
                              ),
                            );
                          },
                          child: Container(
                            height: 64,
                            width: 86,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.18),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFFFFF5DD),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x40F9BE33),
                                  offset: Offset(0, 0.46),
                                  blurRadius: 1.84,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Color(0x0AF9BE33),
                                  offset: Offset(0, 0.46),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.07,
                                right: 10.73,
                                bottom: 3.07,
                                left: 10.73,
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/home/benifits/peer.png',
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.people, size: 24),
                                  ),
                                  const SizedBox(height: 9.2),
                                  Text(
                                    'Peer to Peer',
                                    style: oswald(size: 8, weight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 9),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EscrowSecuredPayments(),
                              ),
                            );
                          },
                          child: Container(
                            height: 64,
                            width: 86,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.18),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFFFFF5DD),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x40F9BE33),
                                  offset: Offset(0, 0.46),
                                  blurRadius: 1.84,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Color(0x0AF9BE33),
                                  offset: Offset(0, 0.46),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.07,
                                right: 10.73,
                                bottom: 3.07,
                                left: 10.73,
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/home/benifits/escrow.png',
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.security, size: 24),
                                  ),
                                  const SizedBox(height: 9.2),
                                  Text(
                                    'Escrow Secured Payments',
                                    style: oswald(size: 8, weight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 9),
                        Container(
                          height: 64,
                          width: 86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.18),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFFFFF5DD),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x40F9BE33),
                                offset: Offset(0, 0.46),
                                blurRadius: 1.84,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x0AF9BE33),
                                offset: Offset(0, 0.46),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 3.07,
                              right: 10.73,
                              bottom: 3.07,
                              left: 10.73,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/home/benifits/ai.png',
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.smart_toy, size: 24),
                                ),
                                const SizedBox(height: 9.2),
                                Text(
                                  'AI Trust Score',
                                  style: oswald(size: 8, weight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 9),
                        Container(
                          height: 64,
                          width: 86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.18),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFFFFF5DD),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x40F9BE33),
                                offset: Offset(0, 0.46),
                                blurRadius: 1.84,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x0AF9BE33),
                                offset: Offset(0, 0.46),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 3.07,
                              right: 10.73,
                              bottom: 3.07,
                              left: 10.73,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/home/benifits/verified.png',
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.verified, size: 24),
                                ),
                                const SizedBox(height: 9.2),
                                Text(
                                  'Verified Seller Profiles',
                                  style: oswald(size: 8, weight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Popular Brands Section (simplified - full implementation would include all brands)
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Explore Car By Popular Brands',
                      style: oswald(size: 16, weight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 24,
                      bottom: 20,
                      left: 24,
                    ),
                    child: Column(
                      children: [
                        // Brand rows would go here - simplified for now
                        Text(
                          'Brand listings coming soon',
                          style: poppins(size: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              child: Image.asset(
                'assets/images/home/bar.png',
                errorBuilder: (context, error, stackTrace) => const SizedBox(height: 20),
              ),
            ),
            const SizedBox(height: 20),

            // Explore All Vehicles Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore All Vehicles',
                    style: oswald(size: 16, weight: FontWeight.w600),
                  ),
                  Text(
                    'View all',
                    style: oswald(
                      size: 12,
                      weight: FontWeight.w500,
                      color: const Color(0xFF6F66B0),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Vehicle Cards (simplified - full implementation would show actual car cards)
            SizedBox(
              height: 204,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildVehicleCard('Tesla Model S', '₹55,00,000', 'Electric performance sedan', 'assets/images/Rectangle 25.png'),
                  _buildVehicleCard('Sporty Convertible', '₹85,00,000', 'Sport premium convertible', 'assets/images/Rectangle 24.png'),
                  _buildVehicleCard('Audi e-tron', '₹70,00,000', 'Luxury electric SUV', 'assets/images/Rectangle 25.png'),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Popular Car Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Car', style: oswald(size: 16, weight: FontWeight.w600)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'View all',
                          style: oswald(size: 12, weight: FontWeight.w500),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.chevron_right, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Popular Car Cards (simplified)
            SizedBox(
              height: 290,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildPopularCarCard('2018 LEXUS RX350L', 'LUXURY', '45,600 km  •  Automatic', '₹61,990', 'assets/images/f2.png'),
                  _buildPopularCarCard('2019 TOYOTA RAV4', 'GX (2WD) HYBRID NAV', '54,950 km  •  Automatic', '₹42,990', 'assets/images/f.png'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // CTA Sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F2FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Are You Looking For a Car ?',
                            style: oswald(size: 16, weight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'We are committed to providing our customers with exceptional service.',
                            style: poppins(size: 12, weight: FontWeight.w400, color: Colors.black54),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEF4444),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Get Started', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE9F3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Do You Want to Sell a Car ?',
                            style: oswald(size: 16, weight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'We are committed to providing our customers with exceptional service.',
                            style: poppins(size: 12, weight: FontWeight.w400, color: Colors.black54),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEF4444),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Get Started', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Post Cars Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/Post Cars Section.png',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                      child: const Icon(Icons.image, size: 40),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleCard(String title, String price, String description, String imagePath) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 110,
                color: Colors.grey[300],
                child: const Icon(Icons.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: oswald(size: 12, weight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: oswald(size: 12, weight: FontWeight.w600, color: const Color(0xFF6F66B0)),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: poppins(size: 10, weight: FontWeight.w400, color: const Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularCarCard(String title, String subtitle, String details, String price, String imagePath) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 140,
                color: Colors.grey[300],
                child: const Icon(Icons.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: oswald(size: 13, weight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: poppins(size: 10, weight: FontWeight.w500, color: const Color(0xFF6B7280)),
                ),
                const SizedBox(height: 6),
                Text(
                  details,
                  style: poppins(size: 10, weight: FontWeight.w400, color: const Color(0xFF9CA3AF)),
                ),
                const SizedBox(height: 8),
                Text(price, style: oswald(size: 14, weight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(
                  'est. ₹304/wk based on',
                  style: poppins(size: 9, weight: FontWeight.w400, color: const Color(0xFF9CA3AF)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
