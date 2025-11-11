import 'package:flutter/material.dart';
import 'package:new_proj/pages/buyerdashboard/profile_documents_screen.dart';
import 'package:new_proj/pages/screen1.dart';
import 'package:new_proj/pages/bottomnavbar.dart';
import 'package:new_proj/pages/sellerprofile.dart';
import 'my_bookings_screen.dart';
import 'saved_cars_screens.dart';
import 'payments_screen.dart';
import 'support_center_screen.dart';



/// Main scaffold that handles bottom nav and switching between sections
class BuyerDashboardScaffold extends StatefulWidget {
  final int initialIndex;
  const BuyerDashboardScaffold({super.key, this.initialIndex = 1});

  @override
  State<BuyerDashboardScaffold> createState() => _BuyerDashboardScaffoldState();
}

class _BuyerDashboardScaffoldState extends State<BuyerDashboardScaffold> {
  late int _currentIndex;
  final List<Widget> _mainSections = [
    const Screen1(), // VIP car screen (Home tab - index 0)
    const BuyerDashboardScreen(), // BUY tab (index 1)
    const SellerDashboardProfileKYC(), // SELL tab (index 2)
    const Placeholder(child: Center(child: Text('Chat'))), // Chat tab (index 3)
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabSelected(int idx) {
    setState(() => _currentIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainSections[_currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}


/// BUYER DASHBOARD WITH TAB BAR (My Bookings, Saved Cars, Payments, Support Chat)
class BuyerDashboardScreen extends StatefulWidget {
  const BuyerDashboardScreen({super.key});

  @override
  State<BuyerDashboardScreen> createState() => _BuyerDashboardScreenState();
}

class _BuyerDashboardScreenState extends State<BuyerDashboardScreen> {
  int selectedTabIndex = 0;

  static const List<String> tabTitles = [
    "My Bookings",
    "Saved Cars",
    "Payments",
    "Support Chat",
    "Profile & Documents"
  ];

  static const List<Widget> tabs = [
    MyBookingsScreen(),
    SavedCarsScreen(),
    PaymentsScreen(),
    SupportCenterScreen(),
    ProfileDocumentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(54),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Buyer Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.notifications_none, color: Colors.black),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                )
              ],
            ),
            const SizedBox(width: 18),
            const Row(
              children: [
                Icon(Icons.chat_bubble_outline, color: Colors.black, size: 22),
                Text(' Support Chat', style: TextStyle(fontSize: 14, color: Colors.black)),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Horizontally scrolling tab bar
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabTitles.length, (index) {
                  bool isSelected = selectedTabIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedTabIndex = index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected ? Colors.pink : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        color: isSelected ? Colors.white : const Color(0xFFF7F7FA),
                      ),
                      child: Text(
                        tabTitles[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.pink : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: tabs[selectedTabIndex],
          ),
        ],
      ),
    );
  }
}
