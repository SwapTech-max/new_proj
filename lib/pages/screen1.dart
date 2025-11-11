import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/pages/bottomnavbar.dart';
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
  String selectedFilter = 'Filters';
  String selectedFilterValue = '';
  List<Car> carList = CarService.getVipCars();

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
                  const SizedBox(height: 10.0),
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
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: carList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  carImages: [
                                    'assets/images/car_1.jpg',
                                    'assets/images/car_2.jpg',
                                    'assets/images/car_3.png',
                                  ],
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
                  const SizedBox(height: 10),

                  // MARCH OFFERS
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 6, right: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "MARCH OFFERS",
                            style: Appwidget.boldTextFeildStyle(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        FloatingActionButton.small(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Screen2()),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Color.fromARGB(255, 11, 11, 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 6, color: Colors.grey.shade300),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/images/march.png',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 150,
                                width: double.infinity,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image, size: 40),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
