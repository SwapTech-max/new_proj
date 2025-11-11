import '../models/seller_listing_model.dart';

/// Service for seller-related data
class SellerService {
  /// Get seller's car listings
  static List<SellerListing> getSellerListings() {
    return [
      SellerListing(
        id: 'seller1',
        image: 'assets/images/normal1.jpg',
        name: '2020 Maruti Swift VDI',
        price: '₹5,85,000',
        views: 145,
        inquiries: 8,
        status: ListingStatus.active,
      ),
      SellerListing(
        id: 'seller2',
        image: 'assets/images/normal2.jpg',
        name: '2018 MINI 5D HATCH',
        price: '₹36,990',
        views: 230,
        inquiries: 12,
        status: ListingStatus.pending,
      ),
      SellerListing(
        id: 'seller3',
        image: 'assets/images/normal3.jpg',
        name: '2018 MINI 5D HATCH',
        price: '₹36,990',
        views: 89,
        inquiries: 3,
        status: ListingStatus.sold,
      ),
    ];
  }
}

