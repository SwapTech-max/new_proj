import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Card(
          margin: EdgeInsets.all(40),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.support_agent, size: 48, color: Colors.pink),
                SizedBox(height: 18),
                Text(
                  "Support Center",
                  style: Appwidget.headlineTextFeildStyle()
                ),
                SizedBox(height: 10),
                Text(
                  "Need help? Our support team is here to assist you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 18),
                ElevatedButton(onPressed: () {}, child: Text("Start Chat"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
