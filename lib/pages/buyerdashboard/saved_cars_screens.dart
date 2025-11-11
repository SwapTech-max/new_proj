import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/models/car_model.dart';
import 'package:new_proj/services/car_service.dart';

/// Saved Cars Screen - Shows user's saved/favorited cars
class SavedCarsScreen extends StatelessWidget {
  const SavedCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Saved Cars", style: Appwidget.headlineTextFeildStyle()),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                ),
                itemCount: CarService.getNormalCars().take(4).length,
                itemBuilder: (context, index) {
                  final car = CarService.getNormalCars()[index];
                  return CarCard(
                    car.image,
                    car.name,
                    car.price,
                    onRemove: () {
                      // TODO: Implement remove from saved
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper widget for each car card in saved cars
class CarCard extends StatelessWidget {
  final String image, name, price;
  final VoidCallback? onRemove;
  
  CarCard(this.image, this.name, this.price, {this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: Image.asset(image, fit: BoxFit.cover)),
          ListTile(
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text(price, style: TextStyle(color: Colors.pink, fontSize: 13)),
            trailing: Icon(Icons.favorite_border, color: Colors.pink),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Book Visit")),
              TextButton(onPressed: () {}, child: Text("Remove"))
            ],
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
