class Booking {
  final String id;
  final String carId;
  final String carImage;
  final String carModel;
  final String price;
  final String location;
  final String visitDate;
  final BookingStatus status;

  Booking({
    required this.id,
    required this.carId,
    required this.carImage,
    required this.carModel,
    required this.price,
    required this.location,
    required this.visitDate,
    required this.status,
  });
}

enum BookingStatus {
  confirmed,
  pending,
  cancelled,
  completed,
}

extension BookingStatusExtension on BookingStatus {
  String get label {
    switch (this) {
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.completed:
        return 'Completed';
    }
  }
}

