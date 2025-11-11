import '../models/car_model.dart';

class CarService {
  // VIP Cars Data
  static List<Car> getVipCars() {
    return [
      Car(
        id: 'vip1',
        image: 'assets/images/vip1.jpg',
        name: 'Aston Martin DB11',
        type: 'Grand Tourer',
        price: '₹3.29 Crore',
        distanceType: '16,000 km.Automatic',
        isVip: true,
      ),
      Car(
        id: 'vip2',
        image: 'assets/images/vip2.jpg',
        name: 'Lexus ES 300h',
        type: 'Hybrid Sedan',
        price: '₹64.90 Lakh',
        isVip: true,
      ),
      Car(
        id: 'vip3',
        image: 'assets/images/vip3.jpg',
        name: 'Bentely Continental GT',
        type: 'Luxury Coupe',
        price: '₹5.23 Crore',
        isVip: true,
      ),
      Car(
        id: 'vip4',
        image: 'assets/images/vip4.jpg',
        name: 'Ford Mustang GT',
        type: 'MUSCLE CAR',
        price: '₹74 Lakh',
        isVip: true,
      ),
      Car(
        id: 'vip5',
        image: 'assets/images/porshe.jpg',
        name: 'Porshe 911',
        type: 'Grand Tourer',
        price: '₹3.29 Crore',
        isVip: true,
      ),
      Car(
        id: 'vip6',
        image: 'assets/images/rangerover.jpg',
        name: 'Range Rover Vogue',
        type: 'Luxury SUV',
        price: '₹2.39 Crore',
        isVip: true,
      ),
    ];
  }

  // Normal Cars Data
  static List<Car> getNormalCars() {
    return [
      Car(
        id: 'normal1',
        image: 'assets/images/normal1.jpg',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        distanceType: '16,000 km.Automatic',
        isVip: false,
      ),
      Car(
        id: 'normal2',
        image: 'assets/images/normal2.jpg',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        isVip: false,
      ),
      Car(
        id: 'normal3',
        image: 'assets/images/normal3.jpg',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        isVip: false,
      ),
      Car(
        id: 'normal4',
        image: 'assets/images/normal4.jpg',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        isVip: false,
      ),
      Car(
        id: 'normal5',
        image: 'assets/images/normal5.png',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        isVip: false,
      ),
      Car(
        id: 'normal6',
        image: 'assets/images/normal6.png',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        isVip: false,
      ),
      Car(
        id: 'normal7',
        image: 'assets/images/normal7.png',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        isVip: false,
      ),
      Car(
        id: 'normal8',
        image: 'assets/images/normal8.png',
        name: '2018 MINI 5D HATCH',
        type: 'COOPER',
        price: '₹36,990',
        isVip: false,
      ),
    ];
  }

  // Filter Options
  static List<Map<String, String>> getFilterOptions() {
    return [
      {'value': 'all', 'label': 'All Cars'},
      {'value': 'recent', 'label': 'Recently Added'},
      {'value': 'popular', 'label': 'Most Popular'},
      {'value': 'price-low', 'label': 'Price: Low to High'},
      {'value': 'price-high', 'label': 'Price: High to Low'},
      {'value': 'rating', 'label': 'Highest Rated'},
    ];
  }

  // Brand Options
  static List<Map<String, String>> getCarBrands() {
    return [
      {'image': 'assets/images/brand_vw.png', 'name': 'VW'},
      {'image': 'assets/images/brand_bmw.png', 'name': 'BMW'},
      {'image': 'assets/images/brand_benz.png', 'name': 'Mercedes'},
      {'image': 'assets/images/brand_audi.png', 'name': 'Audi'},
      {'image': 'assets/images/brand_toyota.png', 'name': 'Toyota'},
    ];
  }

  // EV Club Images
  static List<String> getEvClubImages() {
    return [
      'assets/images/evclub1.png',
      'assets/images/evclub2.png',
      'assets/images/evclub3.png',
      'assets/images/evclub4.png',
    ];
  }
}

