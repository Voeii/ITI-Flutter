// 4-6
// Create a `Rectangle` class with:
// - Private fields `_width` and `_height`.
// - A constructor to initialize both.
// - Getters for `width`, `height`, `area`, and `perimeter`.
// - Setters to ensure width and height are **positive**.
// Test with a `Rectangle` object and print its area and perimeter.

void main() {
  try{
    Rectangle rec = Rectangle(8, 10);
    print('Rectangle Perimeter: ${rec.perimeter}');
    print('Rectangle Area: ${rec.area}');
    rec.height = -11; // to throw the invalid argument.
    //rec._height = -11; will work fine, as _height is private to the library not the class.
    //print(rec.height); so _height & height will be -11.
  } catch (e) {
    print(e);
  }
}

class Rectangle {
  double _width;
  double _height;
  Rectangle(this._width, this._height){
    if (_width <= 0 && _height <= 0)
      throw ArgumentError('Width & height must be positive.');
    else if (_width <= 0)
      throw ArgumentError('Width must be positive.');
    else if (_height <= 0)
      throw ArgumentError('Height must be positive.');
  }
  
  double get width => _width;
  double get height => _height;
  double get area => _width * _height;
  double get perimeter => 2 * (_width + _height);

  set width(double w){
    if (w <= 0)
      throw ArgumentError('Width must be positive.');
    _width = w;
  }
  set height(double h){
    if (h <= 0)
      throw ArgumentError('Height must be positive.');
    _height = h;
  }
}