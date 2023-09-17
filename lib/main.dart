import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 70.0,
          title: const Text(
            "Photo Gallery",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),

        body: PhotoGalleryScreen(),
      ),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Welcome to my Photo Gallery!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search For Photo...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9
            ),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Photo ${index + 1} clicked!"),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://placekitten.com/150/150",
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Photo ${index + 1}"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://placekitten.com/50/50"),
            ),
            title: Text("Sample Photo 1"),
            subtitle: Text("Subtitle 1"),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://placekitten.com/50/50"),
            ),
            title: Text("Sample Photo 2"),
            subtitle: Text("Subtitle 2"),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://placekitten.com/50/50"),
            ),
            title: Text("Sample Photo 3"),
            subtitle: Text("Subtitle 3"),
          ),
           InkWell(
               onTap: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(
                     content: Text("Photos Uploaded Successfully!"),
                   ),
                 );
               },
               child: const CircleAvatar(
                   backgroundColor: Colors.blue,
                   child: Icon(Icons.upload, color: Colors.white,))),
        ],
      ),
    );
  }
}
