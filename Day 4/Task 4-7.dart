// 4-7
// Create a `Calculator` class with:
// - Methods `add()`, `subtract()`, `multiply()`, and `divide()`.
// - Each method takes two numbers and returns the result.
// Test with different operations.

void main() {
  Calculator calc = new Calculator();
  print('Addition: ${calc.add(5, 10)}');
  print('Subtraction: ${calc.subtract(5, 10)}');
  print('Multiplication: ${calc.multiply(5, 10)}');
  print('Division: ${calc.divide(5, 10)}');
  try{
    print('Division: ${calc.divide(5, 0)}'); // to throw invalid argument.
  } catch(e){
    print(e);
  }
}

class Calculator {
  double add(double n1, double n2) => n1 + n2;
  double subtract(double n1, double n2) => n1 - n2;
  double multiply(double n1, double n2) => n1 * n2;
  double divide(double n1, double n2){
    if (n2 == 0) 
      throw ArgumentError('Cant divide by zero.');
    else
      return n1 / n2;
  }
}