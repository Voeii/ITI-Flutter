// 4-9
// Create a base class `SmartDevice` with:
// - `brand`, `model`
// - A method `showDetails()`
// Create subclasses:
// - `Smartphone` (adds `os` property)
// - `Laptop` (adds `ram` property)
// Override `showDetails()` in both subclasses.
// Test with objects of `Smartphone` and `Laptop`.

void main() {
  Smartphone SP = Smartphone('Iphone', '16', 'IOS');
  Laptop LP = Laptop('Lenovo', 'Legion 7', '32GBs');
  print(SP.showdetails());
  print(LP.showdetails());
}

class SmartDevice {
  String brand;
  String model;
  SmartDevice(this.brand, this.model);
  String showdetails() => 'Brand: $brand | Model: $model';
}

class Smartphone extends SmartDevice {
  String os;
  Smartphone(String brand, String model, this.os) : super(brand, model);
  @override
  String showdetails() => '${super.showdetails()} | OS: $os';
}

class Laptop extends SmartDevice {
  String ram;
  Laptop(String brand, String model, this.ram) : super(brand, model);
  @override
  String showdetails() => '${super.showdetails()} | Ram: $ram';
}