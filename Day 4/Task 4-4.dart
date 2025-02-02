// 4-4
// Create a `Book` class with:
// - Properties: `title`, `author`, `pages`
// - A constructor to initialize all properties.
// - A method `bookInfo()` that prints: "Title: {title}, Author: {author}, Pages: {pages}"
// In `main()`, create 3 Book objects and call `bookInfo()` on each.

void main() {
  Book B1 = Book('Book1', 'Author1', 99);
  Book B2 = Book('Book2', 'Author2', 199);
  Book B3 = Book('Book3', 'Author3', 999);
  B1.bookinfo();
  B2.bookinfo();
  B3.bookinfo();
}

class Book {
  String title;
  String author;
  int pages;
  Book(this.title, this.author, this.pages);

  void bookinfo(){
    print('Title: $title, Author: $author, Pages: $pages');
  }
}