import 'package:flutter/material.dart';
import 'package:new_proj/models/booking_model.dart';

/// My Bookings Screen - Shows user's car visit bookings
class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FC),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Bookings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    '2 Active',
                    style: TextStyle(
                        color: Color(0xFF1771D1),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _BookingCard(
                    image: 'assets/images/normal1.jpg',
                    model: '2020 Maruti Swift VDI',
                    price: '₹5,85,000',
                    location: 'Mumbai, Maharashtra',
                    visit: 'Visit: Dec 18, 2024 at 11:00 AM',
                    status: 'Confirmed',
                    statusColor: Color(0xFFE83C5E),
                    showContact: true,
                    showCancel: false,
                    isPending: false,
                  ),
                  SizedBox(height: 10),
                  _BookingCard(
                    image: 'assets/images/normal2.jpg',
                    model: '2018 MINI SD HATCH',
                    price: '₹36,990',
                    location: 'Mumbai, Maharashtra',
                    visit: 'Visit: Dec 18, 2024 at 11:00 AM',
                    status: 'Pending',
                    statusColor: Color(0xFFFFAA00),
                    showContact: false,
                    showCancel: true,
                    isPending: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String label, {bool selected = false}) {
    return Expanded(
      child: Container(
        decoration: selected
            ? BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(0xFF1771D1), width: 2.5)))
            : null,
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Color(0xFF1771D1) : Colors.black54,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final String image, model, price, location, visit, status;
  final Color statusColor;
  final bool showContact, showCancel, isPending;

  const _BookingCard({
    required this.image,
    required this.model,
    required this.price,
    required this.location,
    required this.visit,
    required this.status,
    required this.statusColor,
    required this.showContact,
    required this.showCancel,
    required this.isPending,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1.5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, width: 80, height: 55, fit: BoxFit.cover),
            ),
            SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 2),
                  Text(price, style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFE83C5E), fontSize: 14)),
                  SizedBox(height: 3),
                  Text(location, style: TextStyle(fontSize: 12)),
                  Text(visit, style: TextStyle(fontSize: 12, color: Colors.black54)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      if (showContact)
                        TextButton(
                          onPressed: () {},
                          child: Text("Contact Seller", style: TextStyle(color: Color(0xFF1771D1), fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                      if (showCancel)
                        TextButton(
                          onPressed: () {},
                          child: Text("Cancel", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                      SizedBox(width: 2),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE83C5E),
                          foregroundColor: Colors.white,
                          minimumSize: Size(80, 33),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        child: Text("View Details"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
