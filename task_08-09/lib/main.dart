import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV Shows',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TvShowsScreen(),
    );
  }
}

class TvShowsScreen extends StatefulWidget {
  @override
  _TvShowsScreenState createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  final String apiKey = '4aedf0f05e137d46c3b82f1e203e6849';
  final String baseUrl = 'https://api.themoviedb.org/3/tv/popular';
  List tvShows = [];
  int page = 1;
  bool isLoading = false;
  double appBarOpacity = 1.0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchTvShows();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
        fetchTvShows();
      }
      setState(() {
        appBarOpacity = (_scrollController.position.pixels < 200)
            ? (1 - _scrollController.position.pixels / 200).clamp(0.0, 1.0)
            : 0.0;
      });
    });
  }

  Future<void> fetchTvShows() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    try {
      final response = await Dio().get('$baseUrl?api_key=$apiKey&page=$page');
      setState(() {
        tvShows.addAll(response.data['results']);
        page++;
      });
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular TV Shows"),
        backgroundColor: Colors.blue.withOpacity(appBarOpacity),
        elevation: 0.0,
      ),
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: tvShows.length + 1,
          itemBuilder: (context, index) {
            if (index == tvShows.length) {
              return isLoading ? Center(child: CircularProgressIndicator()) : SizedBox();
            }
            final show = tvShows[index];
            return ListTile(
              leading: Image.network('https://image.tmdb.org/t/p/w200${show['poster_path']}', width: 50, fit: BoxFit.cover),
              title: Text(show['name']),
              subtitle: Text('Rating: ${show['vote_average']}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TvShowDetailScreen(showId: show['id']),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TvShowDetailScreen extends StatefulWidget {
  final int showId;
  TvShowDetailScreen({required this.showId});

  @override
  _TvShowDetailScreenState createState() => _TvShowDetailScreenState();
}

class _TvShowDetailScreenState extends State<TvShowDetailScreen> {
  final String apiKey = '4aedf0f05e137d46c3b82f1e203e6849';
  Map<String, dynamic>? showDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTvShowDetails();
  }

  Future<void> fetchTvShowDetails() async {
    try {
      final response = await Dio().get('https://api.themoviedb.org/3/tv/${widget.showId}?api_key=$apiKey&append_to_response=credits');
      setState(() {
        showDetails = response.data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching details: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(showDetails?['name'] ?? 'Loading...'),
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${showDetails?['poster_path']}',
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Original Name: ${showDetails?['original_name']}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Status: ${showDetails?['status']}',
                        style: TextStyle(fontSize: 16)),
                    Text('Original Language: ${showDetails?['original_language']}',
                        style: TextStyle(fontSize: 16)),
                    Text('Type: ${showDetails?['type']}',
                        style: TextStyle(fontSize: 16)),
                    Text('Seasons: ${showDetails?['number_of_seasons']}',
                        style: TextStyle(fontSize: 16)),
                    Text('Network: ${showDetails?['networks'][0]['name']}',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text('Overview:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(showDetails?['overview'] ?? ''),
                    SizedBox(height: 10),
                    Text('Cast:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Column(
                      children: (showDetails?['credits']['cast'] as List)
                          .take(5)
                          .map((actor) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w200${actor['profile_path']}'),
                                ),
                                title: Text(actor['name']),
                                subtitle: Text(actor['character']),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
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
