import 'package:flutter/material.dart';
import '../models/car_model.dart';
import 'widgets_support.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback? onViewDetails;
  final VoidCallback? onBookVisit;
  final VoidCallback? onBuyNow;
  final VoidCallback? onFavorite;

  const CarCard({
    super.key,
    required this.car,
    this.onViewDetails,
    this.onBookVisit,
    this.onBuyNow,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              car.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(Icons.directions_car, size: 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6, right: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    car.name,
                    style: Appwidget.boldTextFeildStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: onFavorite,
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.pinkAccent,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              car.type,
              style: Appwidget.semiboldTextFeildStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              car.price,
              style: Appwidget.semiboldTextFeildStyle(),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onViewDetails,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFE31E24),
                      side: const BorderSide(color: Color(0xFFE31E24), width: 1),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: const Size(0, 32),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onBookVisit,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFE31E24),
                      side: const BorderSide(color: Color(0xFFE31E24), width: 1),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: const Size(0, 32),
                    ),
                    child: const Text(
                      'Book Visit',
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onBuyNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE31E24),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: const Size(0, 32),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

