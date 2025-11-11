import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/models/payment_model.dart';

/// Payments Screen - Shows payment history
class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payment History", style: Appwidget.headingTextFeildStyle()),
            SizedBox(height: 18),
            Card(
              child: ListTile(
                title: Text("Booking Ref: Maruti Swift"),
                subtitle: Text("Date: Dec 15, 2024"),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("₹36,990", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Pending", style: TextStyle(color: Colors.orange, fontSize: 12)),
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
