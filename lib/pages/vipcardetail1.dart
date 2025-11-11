import 'package:flutter/material.dart';
import 'package:new_proj/pages/car_detail_screen.dart' as unified;
import 'package:new_proj/services/car_service.dart';

/// Legacy VIP Car Detail Screen - Redirects to unified CarDetailScreen
/// This is kept for backward compatibility
class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Get first VIP car as default
    final car = CarService.getVipCars().first;
    
    return unified.CarDetailScreen(
      car: car,
      carImages: [
        'assets/images/car_1.jpg',
        'assets/images/car_2.jpg',
        'assets/images/car_3.png',
      ],
    );
  }
}
