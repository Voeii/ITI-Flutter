// 4-2
// Create a `Car` class with:
// - Properties: `brand`, `model`, `year`
// - A constructor to initialize all properties.
// - A named constructor `Car.oldCar()` that defaults the `year` to 2000.
// Create and print details of two car objects (one using the default constructor and another using `Car.oldCar()`).

void main() {
  Car car1 = Car('Toyota', 'Corolla', 2022);
  Car car2 = Car.oldcar('Mercedes benz', 'Model S');
  car1.print_details();
  car2.print_details();
}

class Car {
  String brand;
  String model;
  int year;
  Car(this.brand, this.model, this.year);
  Car.oldcar(this.brand, this.model) : year = 2000;

  void print_details(){
    print('Brand: $brand | Model: $model | Year: $year');
  }
}