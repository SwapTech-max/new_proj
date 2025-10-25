import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/pages/bottomnavbar.dart';

//NORMAL CAR LISTING SCREEN
String selectedBrand = 'All';
String selectedPrice = 'All';

final List<String> brandOptions = [
  'All',
  'VW',
  'BMW',
  'Mercedes',
  'Audi',
  'Toyota',
];

final List<String> priceOptions = [
  'All',
  'Under 5L',
  '5L-10L',
  '10L-20L',
  'Above 20L',
];

final List<Map<String, String>> carList = [
  {
    'image': 'assets/images/normal1.jpg',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
    'distntype': '16,000 km.Automatic',
  },
  {
    'image': 'assets/images/normal2.jpg',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
  },
  {
    'image': 'assets/images/normal3.jpg',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
  },
  {
    'image': 'assets/images/normal4.jpg',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
  },
  {
    'image': 'assets/images/normal5.png',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
  },
  {
    'image': 'assets/images/normal6.png',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
  },
  {
    'image': 'assets/images/normal7.png',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
  },
  {
    'image': 'assets/images/normal8.png',
    'name': '2018 MINI 5D HATCH',
    'type': 'COOPER',
    'price': '₹36,990',
  },
];
bool isFilterOpen = false;
String selectedFilter = 'Filters';
String selectedFilterValue = '';

final List<Map<String, String>> filterOptions = [
  {'value': 'all', 'label': 'All Cars'},
  {'value': 'recent', 'label': 'Recently Added'},
  {'value': 'popular', 'label': 'Most Popular'},
  {'value': 'price-low', 'label': 'Price: Low to High'},
  {'value': 'price-high', 'label': 'Price: High to Low'},
  {'value': 'rating', 'label': 'Highest Rated'},
];

final List<Map<String, String>> carBrands = [
  {'image': 'assets/images/brand_vw.png', 'name': 'VW'},
  {'image': 'assets/images/brand_bmw.png', 'name': 'BMW'},
  {'image': 'assets/images/brand_benz.png', 'name': 'Mercedes'},
  {'image': 'assets/images/brand_audi.png', 'name': 'Audi'},
  {'image': 'assets/images/brand_toyota.png', 'name': 'Toyota'},
];

// Top Listed Car Example
const topListedCarImage = 'assets/images/audir8.png';
const topListedCarTitle = 'Top Listed Cars';

// Explore EV Club images
final List<String> exploreEvImages = [
  'assets/images/evclub1.png',
  'assets/images/evclub2.png',
  'assets/images/evclub3.png',
  'assets/images/evclub4.png',
];

// March Offers image
const marchOffersImage = 'assets/images/march.png';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int _selectedIndex = 0;

  Map<int, Map<String, bool>> buttonStates = {};

  @override
  void initState() {
    super.initState();
    // Initialize button states for all cars
    for (int i = 0; i < carList.length; i++) {
      buttonStates[i] = {
        'viewDetails': false,
        'bookVisit': false,
        'buyNow': false,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: 28),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text("Our Cars", style: Appwidget.semiboldTextFeildStyle()),
                    SizedBox(height: 6),
                    Text(
                      "Our cars Listings",
                      style: Appwidget.headlineTextFeildStyle(),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Find your perfect Car from verified sellers",
                      style: Appwidget.semiboldTextFeildStyle(),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFilterOpen = !isFilterOpen;
                          });
                        },
                        child: Column(
                          children: [
                            // Filter Button
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF262828)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF777C7C).withOpacity(0.3)
                                      : const Color(
                                          0xFF5E5240,
                                        ).withOpacity(0.12),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.tune,
                                        size: 20,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFF5F5F5)
                                            : const Color(0xFF13343B),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        selectedFilter,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFFF5F5F5)
                                              : const Color(0xFF13343B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AnimatedRotation(
                                    turns: isFilterOpen ? 0.5 : 0,
                                    duration: const Duration(milliseconds: 150),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(
                                              0xFFA7A9A9,
                                            ).withOpacity(0.7)
                                          : const Color(0xFF626C71),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Dropdown Menu
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                              height: isFilterOpen ? null : 0,
                              child: isFilterOpen
                                  ? Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFF262828)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(
                                                  0xFF777C7C,
                                                ).withOpacity(0.2)
                                              : const Color(
                                                  0xFF5E5240,
                                                ).withOpacity(0.12),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.04,
                                            ),
                                            blurRadius: 6,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Column(
                                          children: filterOptions.asMap().entries.map((
                                            entry,
                                          ) {
                                            final index = entry.key;
                                            final option = entry.value;
                                            final value = option['value']!;
                                            final label = option['label']!;
                                            final isSelected =
                                                selectedFilterValue == value;
                                            final isLast =
                                                index ==
                                                filterOptions.length - 1;

                                            return Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedFilterValue = value;
                                                    selectedFilter = label;
                                                    isFilterOpen = false;
                                                    // Add your filter logic here
                                                  });
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 12,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? (Theme.of(
                                                                    context,
                                                                  ).brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? const Color.fromARGB(
                                                                  255,
                                                                  0,
                                                                  0,
                                                                  0,
                                                                ).withOpacity(
                                                                  0.15,
                                                                )
                                                              : const Color.fromARGB(
                                                                  255,
                                                                  0,
                                                                  0,
                                                                  0,
                                                                ).withOpacity(
                                                                  0.12,
                                                                ))
                                                        : Colors.transparent,
                                                    border: !isLast
                                                        ? Border(
                                                            bottom: BorderSide(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      ).brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? const Color(
                                                                      0xFF777C7C,
                                                                    ).withOpacity(
                                                                      0.15,
                                                                    )
                                                                  : const Color(
                                                                      0xFF5E5240,
                                                                    ).withOpacity(
                                                                      0.12,
                                                                    ),
                                                              width: 1,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  child: Text(
                                                    label,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: isSelected
                                                          ? FontWeight.w500
                                                          : FontWeight.normal,
                                                      color: isSelected
                                                          ? (Theme.of(
                                                                      context,
                                                                    ).brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? const Color(
                                                                    0xFF32B8C6,
                                                                  )
                                                                : const Color(
                                                                    0xFF21808D,
                                                                  ))
                                                          : (Theme.of(
                                                                      context,
                                                                    ).brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? const Color(
                                                                    0xFFF5F5F5,
                                                                  )
                                                                : const Color(
                                                                    0xFF13343B,
                                                                  )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              // Car listing grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: carList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final car = carList[index];
                    final isViewDetailsPressed =
                        buttonStates[index]!['viewDetails']!;
                    final isBookVisitPressed =
                        buttonStates[index]!['bookVisit']!;
                    final isBuyNowPressed = buttonStates[index]!['buyNow']!;

                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              car['image']!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 6,
                              right: 8,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    car['name']!,
                                    style: Appwidget.boldTextFeildStyle(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),

                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 2),
                            child: Text(
                              car['type']!,
                              style: Appwidget.boldTextFeildStyle(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 4),
                            child: Text(
                              car['price']!,
                              style: Appwidget.semiboldTextFeildStyle(),
                            ),
                          ),
                          Spacer(),
                          // Three Buttons Row
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: isViewDetailsPressed
                                      ? ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              buttonStates[index]!['viewDetails'] =
                                                  false;
                                            });
                                            print(
                                              'View Details clicked for ${car['name']}',
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(
                                              0xFFE31E24,
                                            ),
                                            foregroundColor: Colors.white,
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            minimumSize: Size(0, 32),
                                          ),
                                          child: const Text(
                                            'View Details',
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      : OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              buttonStates[index]!['viewDetails'] =
                                                  true;
                                            });
                                            print(
                                              'View Details clicked for ${car['name']}',
                                            );
                                          },
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: const Color(
                                              0xFFE31E24,
                                            ),
                                            side: const BorderSide(
                                              color: Color(0xFFE31E24),
                                              width: 1,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            minimumSize: Size(0, 32),
                                          ),
                                          child: const Text(
                                            'View Details',
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                ),
                                const SizedBox(width: 4),

                                // Book Visit Button
                                Expanded(
                                  child: isBookVisitPressed
                                      ? ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              buttonStates[index]!['bookVisit'] =
                                                  false;
                                            });
                                            print(
                                              'Book Visit clicked for ${car['name']}',
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(
                                              0xFFE31E24,
                                            ),
                                            foregroundColor: Colors.white,
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            minimumSize: Size(0, 32),
                                          ),
                                          child: const Text(
                                            'Book Visit',
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      : OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              buttonStates[index]!['bookVisit'] =
                                                  true;
                                            });
                                            print(
                                              'Book Visit clicked for ${car['name']}',
                                            );
                                          },
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: const Color(
                                              0xFFE31E24,
                                            ),
                                            side: const BorderSide(
                                              color: Color(0xFFE31E24),
                                              width: 1,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            minimumSize: Size(0, 32),
                                          ),
                                          child: const Text(
                                            'Book Visit',
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                ),
                                const SizedBox(width: 4),

                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        buttonStates[index]!['buyNow'] =
                                            !isBuyNowPressed;
                                      });
                                      print(
                                        'Buy Now clicked for ${car['name']}',
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE31E24),
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      minimumSize: Size(0, 32),
                                    ),
                                    child: const Text(
                                      'Buy Now',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 12),
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
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: carBrands.length,
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                  itemBuilder: (context, index) {
                    final brand = carBrands[index];
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
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          brand['name']!,
                          style: TextStyle(
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
                  topListedCarTitle,
                  style: Appwidget.boldTextFeildStyle(),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    topListedCarImage,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 8),
              // EXPLORE EV CLUB
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "EXPLORE EV CLUB",
                  style: Appwidget.boldTextFeildStyle(),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: exploreEvImages.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      exploreEvImages[index],
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
