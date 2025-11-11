class Payment {
  final String id;
  final String bookingRef;
  final String date;
  final double amount;
  final PaymentStatus status;

  Payment({
    required this.id,
    required this.bookingRef,
    required this.date,
    required this.amount,
    required this.status,
  });
}

enum PaymentStatus {
  pending,
  completed,
  failed,
  refunded,
}

extension PaymentStatusExtension on PaymentStatus {
  String get label {
    switch (this) {
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.completed:
        return 'Completed';
      case PaymentStatus.failed:
        return 'Failed';
      case PaymentStatus.refunded:
        return 'Refunded';
    }
  }
}

