import 'package:flutter/material.dart';
import 'package:new_proj/pages/bottomnavbar.dart';
import 'package:new_proj/pages/seller/my_car_listings_screen.dart';

/// Seller Dashboard with Profile and KYC Management
class SellerDashboardProfileKYC extends StatefulWidget {
  final bool showBottomNav;
  
  const SellerDashboardProfileKYC({
    super.key,
    this.showBottomNav = false, // Don't show bottom nav when used in main scaffold
  });

  @override
  State<SellerDashboardProfileKYC> createState() => _SellerDashboardProfileKYCState();
}

class _SellerDashboardProfileKYCState extends State<SellerDashboardProfileKYC> {
  // Tab navigation titles
  final List<String> tabTitles = [
    "My Listings",
    "Add New Car",
    "Visit Requests",
    "Payment Status",
    "Profile / KYC",
  ];
  int tabIndex = 0; // default to "My Listings"

  final nameController = TextEditingController(text: 'Rajesh Kumar');
  final phoneController = TextEditingController(text: '+91 98765-43210');
  final emailController = TextEditingController(text: 'rajeshkumar@email.com');
  final locationController = TextEditingController(text: 'Mumbai, Maharashtra');

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _onTabClicked(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          // Top Dashboard Header
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Seller Dashboard",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.person_outline, size: 16, color: Colors.black54),
                          SizedBox(width: 4),
                          Text("John Seller", style: TextStyle(fontSize: 13, color: Colors.black87)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  "Manage your car listings and track performance",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 14),
                // Stats boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _statBox(label: "Active Listings", value: "3", icon: Icons.directions_car_outlined),
                    _statBox(label: "Total Views", value: "468", icon: Icons.visibility_outlined),
                    _statBox(label: "Visit Requests", value: "2", icon: Icons.how_to_reg_outlined),
                    _statBox(label: "Cars Sold", value: "1", icon: Icons.sell_outlined),
                  ],
                ),
                const SizedBox(height: 16),
                // Tabs bar
                _dashboardTabs(tabIndex: tabIndex, onTap: _onTabClicked),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Content based on selected tab
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
      bottomNavigationBar: widget.showBottomNav
          ? BottomNav(
              currentIndex: 2,
              onTap: (index) {
                // Navigation is handled by parent BuyerDashboardScaffold
                // This bottom nav is just for visual consistency
              },
            )
          : null,
    );
  }

  Widget _buildTabContent() {
    switch (tabIndex) {
      case 0: // My Listings
        return const MyCarListingsScreen();
      case 1: // Add New Car
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_circle_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Add New Car',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Add New Car functionality coming soon')),
                  );
                },
                child: const Text('Add Car'),
              ),
            ],
          ),
        );
      case 2: // Visit Requests
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Visit Requests',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
            ],
          ),
        );
      case 3: // Payment Status
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.payment, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Payment Status',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
            ],
          ),
        );
      case 4: // Profile / KYC
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile & KYC Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5),
              ),
              const SizedBox(height: 7),
              _profileSection(),
              const SizedBox(height: 14),
              _kycSection(),
              const SizedBox(height: 80),
            ],
          ),
        );
      default:
        return const Center(child: Text('Unknown tab'));
    }
  }

  Widget _statBox({required String label, required String value, required IconData icon}) {
    return Container(
      width: 82,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE3E6ED)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Icon(icon, size: 19, color: Colors.pinkAccent),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          const SizedBox(height: 3),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _dashboardTabs({required int tabIndex, required Function(int) onTap}) {
    final tabs = tabTitles;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          tabs.length,
          (i) {
            final bool isSelected = tabIndex == i;
            return GestureDetector(
              onTap: () => onTap(i),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Colors.grey[200], borderRadius: BorderRadius.circular(31))
                    : null,
                child: Text(
                  tabs[i],
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.black : Colors.grey[600],
                    fontSize: isSelected ? 14 : 13,
                    decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _profileSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Personal Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5)),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _profileTextField(label: "Full Name", controller: nameController),
                    const SizedBox(height: 8),
                    _profileTextField(label: "Email Address", controller: emailController),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _profileTextField(label: "Phone Number", controller: phoneController),
                    const SizedBox(height: 8),
                    _profileTextField(label: "Location", controller: locationController),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          SizedBox(
            height: 36,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF1771D1),
                side: const BorderSide(color: Color(0xFF1771D1)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
              onPressed: () {
                // implement save/profile routing logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Profile functionality coming soon')),
                );
              },
              child: const Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileTextField({required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 11.5, color: Colors.grey[700])),
        const SizedBox(height: 4),
        SizedBox(
          height: 33,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 13.5),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              filled: true,
              fillColor: const Color(0xFFFAF9F9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _kycSection() {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "KYC Status",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
          ),
          const SizedBox(height: 11),
          _kycRow("Aadhaar Verification", true),
          const SizedBox(height: 5),
          _kycRow("Driving License", true),
          const SizedBox(height: 5),
          _kycRow("Selfie Verification", true),
        ],
      ),
    );
  }

  Widget _kycRow(String label, bool isVerified) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13.5)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            isVerified ? "Verified" : "Not Verified",
            style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
