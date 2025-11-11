class Car {
  final String id;
  final String image;
  final String name;
  final String type;
  final String price;
  final String? distanceType;
  final String? location;
  final String? fuelType;
  final String? transmission;
  final bool isVip;

  Car({
    required this.id,
    required this.image,
    required this.name,
    required this.type,
    required this.price,
    this.distanceType,
    this.location,
    this.fuelType,
    this.transmission,
    this.isVip = false,
  });

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? map['Type'] ?? '',
      price: map['price'] ?? '',
      distanceType: map['distntype'],
      location: map['location'],
      fuelType: map['fuelType'],
      transmission: map['transmission'],
      isVip: map['isVip'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'type': type,
      'price': price,
      'distntype': distanceType,
      'location': location,
      'fuelType': fuelType,
      'transmission': transmission,
      'isVip': isVip,
    };
  }
}

