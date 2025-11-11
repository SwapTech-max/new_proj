import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';

class ProfileDocumentsScreen extends StatelessWidget {
  const ProfileDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buyer Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Personal Information", style: Appwidget.headingTextFeildStyle()),
            SizedBox(height: 18),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(decoration: InputDecoration(labelText: "Full Name")),
                    TextField(decoration: InputDecoration(labelText: "Phone Number")),
                    TextField(decoration: InputDecoration(labelText: "Email Address")),
                    TextField(decoration: InputDecoration(labelText: "Location")),
                    SizedBox(height: 6),
                    ElevatedButton(onPressed: () {}, child: Text("Edit Profile"))
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),
            Text("KYC Status", style: Appwidget.headingTextFeildStyle()),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  children: [
                    StatusRow("Aadhaar Verification", true),
                    StatusRow("Driving License", false),
                    StatusRow("Selfie Verification", false),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatusRow extends StatelessWidget {
  final String label;
  final bool verified;
  StatusRow(this.label, this.verified);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          decoration: BoxDecoration(
            color: verified ? Colors.green[50] : Colors.pink[50],
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            verified ? "Verified" : "Verify",
            style: TextStyle(
              color: verified ? Colors.green : Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
