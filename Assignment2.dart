
class Person {
  final String _name;
  final int _age;
  Person(this._name, this._age);
  String get name => _name;
  int get age => _age;
}
class Driver extends Person {
  final String vehicle;
  Driver(String name, int age, this.vehicle) : super(name, age);
  String getInfo() {
    return 'Name: $name, Age: $age, Vehicle: $vehicle';
  }
}
abstract class Ride {
  double calculateFare(double distance);
}

class BikeRide implements Ride {
  static const double baseFare = 20.0;
  static const double perKmRate = 15.0;

  @override
  double calculateFare(double distance) {
    return baseFare + (distance * perKmRate);
  }
}

class CarRide implements Ride {
  static const double baseFare = 50.0;
  static const double perKmRate = 25.0;

  @override
  double calculateFare(double distance) {
    return baseFare + (distance * perKmRate);
  }
}
void printFare(Ride ride, double distance) {
  double fare = ride.calculateFare(distance);
  String rideType = ride is BikeRide ? 'Bike' : 'Car';
  print('$rideType Ride Fare for ${distance}km: ৳${fare.toStringAsFixed(2)}');
}
void main() {
  print('Starting program...');
  print('=== Simple Ride System ===\n');
  Driver driver1 = Driver('Aumimul', 25, 'Bike');
  Driver driver2 = Driver('Ahoshan', 30, 'Car');
  print('Driver Information:');
  print(driver1.getInfo());
  print(driver2.getInfo());
  print('');
  BikeRide bikeRide = BikeRide();
  CarRide carRide = CarRide();
  print('Fare Calculation:');
  printFare(bikeRide, 5.0);
  printFare(bikeRide, 10.0);
  printFare(carRide, 5.0);
  printFare(carRide, 10.0);
  print('');
  print('Accessing through getters:');
  print('Driver name: ${driver1.name}');
  print('Driver age: ${driver1.age}');
}