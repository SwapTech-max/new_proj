import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/pages/screen2.dart';
import 'package:new_proj/pages/car_detail_screen.dart';
import 'package:new_proj/services/car_service.dart';
import 'package:new_proj/widgets/car_card.dart';
import 'package:new_proj/widgets/filter_dropdown.dart';
import 'package:new_proj/models/car_model.dart';

/// VIP/Luxury Car Listings Screen
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  /// MUST be non-null (your FilterDropdown requires it)
  String selectedFilter = 'All';

  /// Car list
  List<Car> carList = CarService.getVipCars();

  /// Filter options must be List<Map<String, String>>
  final List<Map<String, String>> filterOptions = CarService.getFilterOptions();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  const SizedBox(height: 10),

                  /// FILTER DROPDOWN (MATCHES YOUR WIDGET EXACTLY)
                  FilterDropdown(
                    selectedFilter: selectedFilter,
                    filterOptions: filterOptions,
                    onFilterSelected: (filter) {
                      setState(() {
                        selectedFilter = filter;
                        // filtering logic can be added later
                      });
                    },
                  ),

                  const SizedBox(height: 8),

                  /// CAR GRID
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: carList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
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
                                  carImages: const [
                                    'assets/images/car_1.jpg',
                                    'assets/images/car_2.jpg',
                                    'assets/images/car_3.png',
                                  ],
                                ),
                              ),
                            );
                          },
                          onBookVisit: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Book visit for ${car.name}'),
                              ),
                            );
                          },
                          onBuyNow: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Buy now: ${car.name}')),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// MARCH OFFERS
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 6, right: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "MARCH OFFERS",
                            style: Appwidget.boldTextFeildStyle(),
                          ),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Screen2(),
                              ),
                            );
                          },
                          child: const Icon(Icons.arrow_forward, size: 20),
                        ),
                      ],
                    ),
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
