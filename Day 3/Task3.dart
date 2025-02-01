void main() {
  String str = "Lol";
  print(ispalindrome(str));
  print(Fib(5));
  List<int> L = [1, 2, 3, 4, 5];
  print(even_sum(L));
  String str2 = "Oloei";
  print(vowel_sum(str2));
  print(rev(str2));
  String str3 = "hei there";
  print(remove_sp(str3));
  int n = 5;
  print(isprime(n));
  print(multi(L, n));
}

//Write a function to check if a given string is a palindrome.
bool ispalindrome(String str){
  str = str.toLowerCase();
  String rev = str.split('').reversed.join('');

  if (str == rev)
    return true;
  else
    return false;
}

//Create a function to generate the first n Fibonacci numbers.
List Fib(int n){
  List fib = [];
  if (n >= 0)
    fib.add(0);
  if (n >= 1)
    fib.add(1);
  if (n >= 2){
    int i = 2;
    while(i < n){
      int nxt = fib[i-1] + fib[i-2];
      fib.add(nxt);
      i++;
    }
  }
  return fib;
}

//Write a function that calculates the sum of all even numbers in a list.
int even_sum(List<int> l){
  int sum = 0;
  l.forEach((e) {
    if (e % 2 == 0)
      sum += e;
  });
  return sum;
}

//Write a function to count the number of vowels in a string.
int vowel_sum(String str){
  int sum = 0;
  str = str.toLowerCase();
  List<String> let = str.split('');
  let.forEach((e){
    if ('aeiou'.contains(e))
      sum++;
  });
  return sum;
}

//Create a function to reverse a string.
String rev(String str){
  str = str.split('').reversed.join('');
  return str;
}

//Write a function that removes all spaces from a string.
String remove_sp(String str){
  str = str.replaceAll(' ', '');
  return str;
}

//Write a function to check if a number is prime.
bool isprime(int n){
  if (n <= 1)
    return false;
  else if (n == 2)
    return true;
  else {
    for(int i = 2; i < n; i++){
      if (n % i == 0)
        return false;
    }
  }
  return true;
}

//Create a function that multiplies all elements of a list by a given number.
List<int> multi(List<int> l, int n){
  for (int i = 0; i < l.length;i++){
    l[i]*=n;
  }
  return l;
}
