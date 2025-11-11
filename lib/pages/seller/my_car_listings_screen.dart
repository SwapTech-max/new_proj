import 'package:flutter/material.dart';
import '../../services/seller_service.dart';
import '../../widgets/seller_listing_card.dart';

/// My Car Listings Screen - Shows seller's car listings
class MyCarListingsScreen extends StatelessWidget {
  const MyCarListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listings = SellerService.getSellerListings();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Car Listings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to add new listing screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add New Listing')),
                    );
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text("Add New Listing"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE31E24),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Listings List
            Expanded(
              child: listings.isEmpty
                  ? const Center(
                      child: Text(
                        'No listings yet. Add your first car!',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: listings.length,
                      itemBuilder: (context, index) {
                        final listing = listings[index];
                        return SellerListingCard(
                          listing: listing,
                          onEdit: () {
                            // TODO: Navigate to edit listing screen
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Edit ${listing.name}')),
                            );
                          },
                          onDelete: () {
                            // TODO: Show delete confirmation dialog
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Listing'),
                                content: Text('Are you sure you want to delete ${listing.name}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Deleted ${listing.name}')),
                                      );
                                    },
                                    child: const Text('Delete', style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
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

