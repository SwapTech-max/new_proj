import 'package:flutter/material.dart';
import '../models/car_model.dart';
import '../widgets/widgets_support.dart';

/// Unified Car Detail Screen - Works for both VIP and Normal cars
class CarDetailScreen extends StatelessWidget {
  final Car car;
  final List<String> carImages;
  final String mainImage;

  const CarDetailScreen({
    super.key,
    required this.car,
    this.carImages = const [],
    this.mainImage = 'assets/images/car_main.jpg',
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final images = carImages.isNotEmpty
        ? carImages
        : ['assets/images/car_1.jpg', 'assets/images/car_2.jpg', 'assets/images/car_3.png'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left thumbnails
                  Column(
                    children: images.map((img) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _thumbnailImage(img),
                    )).toList(),
                  ),
                  const SizedBox(width: 15),
                  // Main image
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        car.isVip ? mainImage : 'assets/images/minicooper.png',
                        height: height * 0.19,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: height * 0.19,
                          color: Colors.grey[300],
                          child: const Icon(Icons.directions_car, size: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Title, price, and deal tag
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    car.name,
                    style: Appwidget.headingTextFeildStyle(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        car.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: const Text(
                          'APlus: Good Deal',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Info Row
              Row(
                children: [
                  _metaIcon(Icons.speed, car.distanceType ?? 'N/A'),
                  _divider(),
                  _metaIcon(Icons.settings, car.transmission ?? 'Automatic'),
                  _divider(),
                  _metaIcon(Icons.local_gas_station, car.fuelType ?? 'Petrol'),
                  _divider(),
                  _metaIcon(Icons.location_on, car.location ?? 'Mumbai'),
                ],
              ),
              const SizedBox(height: 18),

              // Description
              _sectionTitle('Description'),
              const SizedBox(height: 4),
              ..._descriptionBullets(car),
              const SizedBox(height: 14),

              // Car Condition Overview
              const SizedBox(height: 4),
              carConditionCardSection(),

              // Uploaded Documents
              const SizedBox(height: 16),
              _uploadedDocumentsSection(),

              // Service History & Seller Info
              Row(
                children: [
                  Expanded(child: _serviceHistoryBox()),
                  const SizedBox(width: 5),
                  Expanded(child: _sellerInfoBox()),
                ],
              ),
              const SizedBox(height: 18),

              // Action buttons at bottom
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement book visit
                      },
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: const Text(
                        'Book Visit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Implement buy now
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 20,
                      ),
                      label: const Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _thumbnailImage(String path, {bool isSelected = false}) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.pink : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            path,
            width: 55,
            height: 55,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 55,
              height: 55,
              color: Colors.grey[300],
              child: const Icon(Icons.directions_car, color: Colors.grey),
            ),
          ),
        ),
      );

  Widget _metaIcon(IconData icon, String label) => Row(
        children: [
          Icon(icon, size: 17, color: Colors.black54),
          const SizedBox(width: 3),
          Text(label, style: const TextStyle(color: Colors.black87, fontSize: 13)),
        ],
      );

  Widget _divider() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Container(width: 2, height: 14, color: Colors.grey[300]),
      );

  Widget _sectionTitle(String text) =>
      Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16));

  List<Widget> _descriptionBullets(Car car) {
    final desc = car.isVip
        ? [
            "Exquisite ${car.name} featuring a 4.0 L twin-turbo V8 engine paired with an 8-speed automatic transmission.",
            "Single owner, driven only 16,000 km, finished in pristine condition inside and out.",
            "2 + 2 grand tourer design offering a perfect balance of comfort and performance.",
            "0-100 km/h in around 4.0 seconds with a top speed of up to 300 km/h.",
            "Rear-wheel drive, adaptive suspension, and drive mode selector for dynamic control.",
            "Luxurious handcrafted interior with premium leather, brushed aluminium trim, and advanced infotainment system.",
            "Recently serviced, with new tyres and full authorized service record.",
            "No accident history; meticulously maintained and regularly detailed.",
            "A true British luxury GT, ideal for high-speed touring and city cruising alike.",
          ]
        : [
            "Well-maintained ${car.name} in excellent condition.",
            "Single owner vehicle with complete service history.",
            "All original parts, no modifications.",
            "Perfect for city driving and long trips.",
            "Recently serviced and ready to drive.",
          ];

    return desc
        .map(
          (d) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Expanded(child: Text(d, style: const TextStyle(fontSize: 14))),
              ],
            ),
          ),
        )
        .toList();
  }

  Widget carConditionCardSection() {
    final List<Map<String, dynamic>> chips = [
      {
        'label': 'Core structure is intact',
        'icon': Icons.check_circle,
        'color': const Color(0xFF212121),
      },
      {
        'label': 'Verified odometer',
        'icon': Icons.check_circle,
        'color': const Color(0xFF212121),
      },
      {
        'label': 'No flood damage',
        'icon': Icons.check_circle,
        'color': const Color(0xFF212121),
      },
      {
        'label': 'Drivetrain',
        'icon': Icons.check_circle,
        'color': const Color(0xFF212121),
      },
      {
        'label': 'Engine in good condition',
        'icon': Icons.check_circle,
        'color': const Color(0xFF212121),
      },
      {
        'label': 'Interior is in good shape',
        'icon': Icons.check_circle,
        'color': const Color(0xFF212121),
      },
      {
        'label': 'Minor scratches present',
        'icon': Icons.warning_amber,
        'color': const Color(0xFFF3A857),
      },
      {
        'label': 'Solid body structure',
        'icon': Icons.check_circle,
        'color': const Color(0xFF212121),
      },
      {'label': 'Mechanical', 'icon': Icons.build, 'color': const Color(0xFF212121)},
      {
        'label': 'Minor dents present',
        'icon': Icons.warning_amber,
        'color': const Color(0xFFF3A857),
      },
    ];

    return Container(
      margin: const EdgeInsets.only(top: 14, bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Car Condition Overview',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 2),
          const Text(
            'Based on a 200-point inspection',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: chips
                .map(
                  (c) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: (c['color'] == const Color(0xFFF3A857))
                          ? const Color(0xFFFFF5E5)
                          : const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: (c['color'] == const Color(0xFFF3A857))
                            ? const Color(0xFFF3A857)
                            : Colors.black12,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          c['icon'] as IconData,
                          color: c['color'] as Color,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          c['label'] as String,
                          style: TextStyle(
                            color: c['color'] as Color,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _uploadedDocumentsSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Uploaded Documents",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: "SF Pro",
              color: Color(0xFF24244B),
            ),
          ),
          const SizedBox(height: 16),
          _documentRow("RC (Registration Certificate)", "Available", Colors.pink),
          _documentRow("Insurance", "Valid till Dec 2024", Colors.pink),
          _documentRow("PUC Certificate", "Valid till Jan 2025", Colors.pink),
        ],
      ),
    );
  }

  static Widget _documentRow(String label, String status, Color color) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            const Icon(Icons.description_outlined, color: Colors.black54, size: 18),
            const SizedBox(width: 9),
            Text(label, style: const TextStyle(fontSize: 12)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );

  Widget _serviceHistoryBox() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service History',
            style: Appwidget.headingTextFeildStyle(),
          ),
          const Text(
            'Service history will be available once you book a visit or make a purchase.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sellerInfoBox() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seller Info',
            style: Appwidget.headingTextFeildStyle(),
          ),
          const Text(
            'Rajesh Kumar: Individual',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          const Row(
            children: [
              Icon(Icons.verified, size: 12, color: Colors.green),
              SizedBox(width: 5),
              Text(
                'Verified Seller',
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(width: 5),
              Icon(Icons.star, size: 12, color: Colors.orange),
              SizedBox(width: 1),
              Text(
                'Trust Score: 4.5/5',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

