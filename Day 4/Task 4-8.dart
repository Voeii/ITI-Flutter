// 4-8
// Create a `Movie` class with:
// - `title`, `director`, `rating`
// - Constructor with default `rating = "Not Rated"`
// - Method `showDetails()` to print movie info
// Test with different movies, some without a rating.

void main() {
  Movie mv1 = Movie('Inception', 'Christopher', rating: 'PG-13');
  Movie mv2 = Movie('Dark Knight', 'Christopher');
  mv1.showdetails();
  mv2.showdetails();
}

class Movie {
  String title;
  String director;
  String rating;
  Movie(this.title,this.director, {this.rating = 'Not Rated'});

  void showdetails() => print('Title: $title | Director: $director | Rating: $rating');
}