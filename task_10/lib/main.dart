import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      authDomain: "movies-eb4df.firebaseapp.com",
      databaseURL: "https://movies-eb4df-default-rtdb.asia-southeast1.firebasedatabase.app",
      projectId: "movies-eb4df",
      storageBucket: "movies-eb4df.firebasestorage.app",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MovieManagerScreen(),
    );
  }
}

class MovieManagerScreen extends StatefulWidget {
  @override
  _MovieManagerScreenState createState() => _MovieManagerScreenState();
}

class _MovieManagerScreenState extends State<MovieManagerScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('movies');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void addMovie() {
    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      _database.push().set({
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
      _titleController.clear();
      _descriptionController.clear();
    }
  }

  void deleteMovie(String key) {
    _database.child(key).remove();
  }

  void editMovie(String key, String title, String description) {
    _titleController.text = title;
    _descriptionController.text = description;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Movie"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: "Title")),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: "Description")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _database.child(key).update({
                'title': _titleController.text,
                'description': _descriptionController.text,
              });
              _titleController.clear();
              _descriptionController.clear();
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Manager")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(controller: _titleController, decoration: InputDecoration(labelText: "Movie Title")),
                TextField(controller: _descriptionController, decoration: InputDecoration(labelText: "Description")),
                SizedBox(height: 10),
                ElevatedButton(onPressed: addMovie, child: Text("Add Movie")),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _database.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
                  Map<dynamic, dynamic> movies = Map<dynamic, dynamic>.from(snapshot.data!.snapshot.value as Map);
                  return ListView(
                    children: movies.entries.map((entry) {
                      return ListTile(
                        title: Text(entry.value['title']),
                        subtitle: Text(entry.value['description']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: () => editMovie(entry.key, entry.value['title'], entry.value['description'])),
                            IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => deleteMovie(entry.key)),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }
                return Center(child: Text("No movies available"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
