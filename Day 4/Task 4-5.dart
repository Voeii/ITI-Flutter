// 4-5
// Create a `Temperature` class with:
// - A private field `_celsius` (double)
// - A constructor to initialize `_celsius`
// - Methods:
// 1 `toFahrenheit()` → Returns temperature in Fahrenheit
// 2 `toKelvin()` → Returns temperature in Kelvin
// Test by converting 25°C to Fahrenheit and Kelvin.

void main() {
  Temperature cel = Temperature(25);
  print('${cel.toFahrenheit()}°F');
  print('${cel.toKelvin()}°K');
}

class Temperature {
  double _celsius;
  Temperature(this._celsius);

  double toFahrenheit(){
    return (_celsius * (9/5)) + 32;
  }
  double toKelvin(){
    return _celsius + 273.15;
  }
}