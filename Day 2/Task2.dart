void main() {
    // Exercise 1
    print("Exercise 1");

    //Create a list of integers: [5, 10, 15, 20, 25].
    List nums = [5, 10, 15, 20, 25];

    // Add 30 to the list.
    nums.add(30);
    print(nums);

    // Remove the first element.
    nums.remove(nums[0]);
    print(nums);

    // Find all numbers greater than 15.
    for (int i in nums){
        if (i > 15)
            print(i);
    }

    // Multiply all numbers in the list by 2.
    for (int i = 0; i < nums.length;i++){
        nums[i]*=2;
    }
    print(nums);

    // Exercise 2
    print("\nExercise 2");

    // Create two sets: {1, 2, 3, 4, 5} and {3, 4, 5, 6, 7}.
    Set one = {1, 2, 3, 4, 5};
    Set two = {3, 4, 5, 6, 7};

    // Find the union of both sets.
    Set uni = one.union(two);
    print(uni);

    // Find the intersection of both sets.
    Set inter = one.intersection(two);
    print(inter);

    // Find the difference between the first set and the second set.
    Set onediff = one.difference(two);
    Set twodiff = two.difference(one);
    print(onediff);
    print(twodiff);

    // Exercise 3
    print("\nExercise 3");

    // Create a map of products with their prices:{ "Laptop": 1500, "Phone": 800, "Tablet": 400 }.
    Map products = {
        "Laptop": 1500, 
        "Phone": 800, 
        "Tablet": 400
    };
    print(products);

    // Add a new product: "Smartwatch": 200.
    products["Smartwatch"] = 200;
    print(products);

    // Update the price of "Phone" to 850.
    products["Phone"] = 850;
    print(products);

    // Remove the "Tablet".
    products.remove("Tablet");
    print(products);

    // Print all product names whose price is above 500.(bouns)
    products.forEach((key, value) {
      if (value > 500)
        print(key);
    });

    //Exercise 4
    print("\nExercise 4");

    // Declare a nullable String? variable name.
    String? name;

    // If the variable is null, assign it the value "Guest".
    print(name?? "Guest");

    // Print the value of name.
    print(name);

    // Exercise 5
    print("\nExercise 5");

    // Create a list of integers that includes some null values: [1, null, 2, null, 3].
    List<int?> inters = [1, null, 2, null, 3];
    print(inters);

    // Remove all null values from the list and print the updated list.
    inters.removeWhere((e) => e == null);
    print(inters);

    // Exercise 6
    print("\nExercise 6");

    // Declare a nullable integer int? value.
    int? value;
    print(value);

    // If value is null, set it to 100 using the null-aware assignment operator (??=).
    value ??= 100;
    print(value);
    
    // Exercise 7
    print("\nExercise 7");

    // Write an if-else statement that: Checks if a number x is positive, negative, or zero.
    int x = 5;
    if (x > 0)
        print("Positive");
    else if (x < 0)
        print("Negative");
    else
        print("Zero");

    // Exercise 8
    print("\nExercise 8");

    // Declare a variable role with the value "editor".
    var role = "editor";

    // Use a switch case to print:"X Access" if role is "admin" or "editor" or "viewer" or "No Access".
    switch (role){
        case "admin":
        print("Admin Access");
        break;

        case "editor":
        print("Editor Access");
        break;

        case "viewer":
        print("Viewer Access");
        break;

        default:
        print("No Access");
    }

    // Exercise 9
    print("\nExercise 9");

    // Create a list of integers [1, 2, 3, 4, 5].
    List L = [1, 2, 3, 4, 5];

    // Use a for loop to print the square of each number.
    for (int i = 0; i < L.length; i++){
        print(L[i] * L[i]);
    }

    // Exercise 10
    print("\nExercise 10");

    // Use a while loop to print all numbers from 10 to 1 in reverse order.
    int rev = 10;
    while(rev > 0){
        print(rev);
        rev--;
    }

    // Exercise 11
    print("\nExercise 11");

    // Use a do-while loop to print the numbers from 1 to 5.
    int v = 1;
    do {
        print(v);
        v++;
    } while(v <= 5);
}