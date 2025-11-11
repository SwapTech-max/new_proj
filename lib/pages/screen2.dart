import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/pages/bottomnavbar.dart';
import 'package:new_proj/pages/car_detail_screen.dart';
import 'package:new_proj/services/car_service.dart';
import 'package:new_proj/widgets/car_card.dart';
import 'package:new_proj/widgets/filter_dropdown.dart';
import 'package:new_proj/models/car_model.dart';

/// Normal Car Listings Screen
class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String selectedFilter = 'Filters';
  String selectedFilterValue = '';
  List<Car> carList = CarService.getNormalCars();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              // Navigate to car detail if needed
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Our Cars", style: Appwidget.semiboldTextFeildStyle()),
                    const SizedBox(height: 6),
                    Text(
                      "Our cars Listings",
                      style: Appwidget.headlineTextFeildStyle(),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Find your perfect Car from verified sellers",
                      style: Appwidget.semiboldTextFeildStyle(),
                    ),
                    const SizedBox(height: 8.0),
                    FilterDropdown(
                      selectedFilter: selectedFilter,
                      filterOptions: CarService.getFilterOptions(),
                      onFilterSelected: (filter) {
                        setState(() {
                          selectedFilter = filter;
                          // TODO: Implement actual filtering logic
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Car listing grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final car = carList[index];
                    return CarCard(
                      car: car,
                      onViewDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailScreen(
                              car: car,
                              carImages: [
                                'assets/images/car_1.jpg',
                                'assets/images/car_2.jpg',
                                'assets/images/car_3.png',
                              ],
                              mainImage: 'assets/images/minicooper.png',
                            ),
                          ),
                        );
                      },
                      onBookVisit: () {
                        // TODO: Implement book visit
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Book visit for ${car.name}')),
                        );
                      },
                      onBuyNow: () {
                        // TODO: Implement buy now
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Buy now: ${car.name}')),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              // Start with Car Brand
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Start with Car Brand",
                  style: Appwidget.boldTextFeildStyle(),
                ),
              ),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: CarService.getCarBrands().length,
                  separatorBuilder: (context, index) => const SizedBox(width: 20),
                  itemBuilder: (context, index) {
                    final brand = CarService.getCarBrands()[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          alignment: Alignment.center,
                          child: ClipOval(
                            child: Image.asset(
                              brand['image']!,
                              fit: BoxFit.contain,
                              width: 48,
                              height: 48,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: 48,
                                height: 48,
                                color: Colors.grey[300],
                                child: const Icon(Icons.branding_watermark, size: 24),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          brand['name']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Top Listed Cars
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Top Listed Cars',
                  style: Appwidget.boldTextFeildStyle(),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/audir8.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // EXPLORE EV CLUB
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "EXPLORE EV CLUB",
                  style: Appwidget.boldTextFeildStyle(),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: CarService.getEvClubImages().length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      CarService.getEvClubImages()[index],
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 100,
                        width: 150,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 40),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
