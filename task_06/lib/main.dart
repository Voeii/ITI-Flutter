import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {"name": "Ankur", "message": "Lets meet tomorrow", "time": "3:09 PM", "image": "assets/Ankur.jfif", "isOnline": true},
    {"name": "Stella", "message": "Hey What's up?", "time": "Wed", "image": "assets/Stella.jpg", "isOnline": false},
    {"name": "Rosy", "message": "Are you ready for the party...", "time": "Thu", "image": "assets/Rosy.jfif", "isOnline": true},
    {"name": "Ani", "message": "Let's go have some fun", "time": "Wed", "image": "assets/Ani.jfif", "isOnline": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Chats", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              Container(
                height: 100,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {},
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        storyAvatar("Your Story", "assets/Story.png", isAddButton: true),
                        storyAvatar("Ankur", "assets/Ankur.jfif", isOnline: true),
                        storyAvatar("Stella", "assets/Stella.jpg", isOnline: false),
                        storyAvatar("Rosy", "assets/Rosy.jfif", isOnline: true),
                        storyAvatar("Ani", "assets/Ani.jfif", isOnline: false),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {},
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(chats[index]["image"]!),
                              radius: 30,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: chats[index]["isOnline"] ? Colors.green : Colors.grey,
                                radius: 8,
                              ),
                            ),
                          ],
                        ),
                        title: Text(chats[index]["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(chats[index]["message"]!),
                        trailing: Text(chats[index]["time"]!),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget storyAvatar(String name, String image, {bool isAddButton = false, bool isOnline = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 30,
              ),
              if (isAddButton)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 10,
                    child: Icon(Icons.add, color: Colors.white, size: 15),
                  ),
                ),
              if (!isAddButton)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: isOnline ? Colors.green : Colors.grey,
                    radius: 8,
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}