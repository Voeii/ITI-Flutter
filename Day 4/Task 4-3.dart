// 4-3
// Create a `Student` class with:
// - `name` (String)
// - `grade` (double)
// - A method `showInfo()` to print: "{name} has a grade of {grade}"
// In `main()`, create a list of 3 students and print their details.

void main() {
  List<Student> students =[
    Student('Ali', 89.6),
    Student('Omar', 71),
    Student('Shahd', 98.1)
  ];

  students.forEach((e){
    e.showinfo();
  });
}

class Student {
  String name;
  double grade;
  Student(this.name, this.grade);

  void showinfo(){
    print("$name has a grade of $grade");
  }
}