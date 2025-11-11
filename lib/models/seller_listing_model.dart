import 'package:flutter/material.dart';

/// Model for seller's car listings with status and metrics
class SellerListing {
  final String id;
  final String image;
  final String name;
  final String price;
  final int views;
  final int inquiries;
  final ListingStatus status;

  SellerListing({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.views,
    required this.inquiries,
    required this.status,
  });
}

enum ListingStatus {
  active,
  pending,
  sold,
}

extension ListingStatusExtension on ListingStatus {
  String get label {
    switch (this) {
      case ListingStatus.active:
        return 'Active';
      case ListingStatus.pending:
        return 'Pending';
      case ListingStatus.sold:
        return 'Sold';
    }
  }

  Color get color {
    switch (this) {
      case ListingStatus.active:
        return Colors.green;
      case ListingStatus.pending:
        return Colors.orange;
      case ListingStatus.sold:
        return Colors.grey;
    }
  }
}

