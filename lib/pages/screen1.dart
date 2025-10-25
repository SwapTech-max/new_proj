import 'package:flutter/material.dart';
import 'package:new_proj/widgets/widgets_support.dart';
import 'package:new_proj/pages/bottomnavbar.dart';
import 'package:new_proj/pages/screen2.dart';

//VIP CAR LISTING SCREEN
final List<Map<String, String>> carList = [
  {
    'image': 'assets/images/vip1.jpg',
    'name': 'Aston Martin DB11',
    'Type': 'Grand Tourer',
    'price': '₹3.29 Crore',
    'distntype': '16,000 km.Automatic',
  },
  {
    'image': 'assets/images/vip2.jpg',
    'name': 'Lexus ES 300h',
    'Type': 'Hybrid Sedan',
    'price': '₹64.90 Lakh',
  },
  {
    'image': 'assets/images/vip3.jpg',
    'name': 'Bentely Continental GT',
    'Type': 'Luxury Coupe',
    'price': '₹5.23 Crore',
  },
  {
    'image': 'assets/images/vip4.jpg',
    'name': 'Ford Mustang GT',
    'Type': 'MUSCLE CAR',
    'price': '₹74 Lakh',
  },
  {
    'image': 'assets/images/porshe.jpg',
    'name': 'Porshe 911',
    'Type': 'Grand Tourer',
    'price': '₹3.29 Crore',
  },
  {
    'image': 'assets/images/rangerover.jpg',
    'name': 'Range Rover Vogue',
    'Type': 'Luxury SUV',
    'price': '₹2.39 Crore',
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
final List<String> exploreEvImages = [
  'assets/images/evclub1.png',
  'assets/images/evclub2.png',
  'assets/images/evclub3.png',
  'assets/images/evclub4.png',
];
// March Offers image
const marchOffersImage = 'assets/images/march.png';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int _selectedIndex = 0;
  Map<int, Map<String, bool>> buttonStates = {};
  @override
  void initState() {
    super.initState();

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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    SizedBox(height: 10.0),
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
                                                              ? const Color(
                                                                  0xFF32B8C6,
                                                                ).withOpacity(
                                                                  0.15,
                                                                )
                                                              : const Color(
                                                                  0xFF21808D,
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: carList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
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
                              height: 120,
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
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Favorite icon
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              car['Type']!,
                              style: Appwidget.semiboldTextFeildStyle(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              car['price']!,
                              style: Appwidget.semiboldTextFeildStyle(),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // View Details Button
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
              SizedBox(height: 10),
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
              SizedBox(height: 10),
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
                          MaterialPageRoute(builder: (context) => Screen2()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: const Color.fromARGB(255, 11, 11, 11),
                      ),
                    ),
                  ],
                ),
              ),
              /////MARCH OFFERS TEXT
              SizedBox(height: 1),
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
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          marchOffersImage,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
