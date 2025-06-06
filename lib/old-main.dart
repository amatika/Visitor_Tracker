import 'package:flutter/material.dart';

/*oid main()=> runApp(MaterialApp
  (
    home:Scaffold
    (
      appBar: AppBar
      (
        title: Text("My First App"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[200],
      ),
      body:Center(
        child:Image(
          //image:AssetImage('assets/mumis.jpeg'),
          image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBF53xg5CWrzOVSONP5ygw0_3L4DFKrMGgTw&s"),
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child:Center(child:Text("click here"))
      ),
    ),
 )
);*/
//import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Row & Column Example")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Column Example", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Item 1", style: TextStyle(fontSize: 18)),
                  Text("Item 2", style: TextStyle(fontSize: 18)),
                  Text("Item 3", style: TextStyle(fontSize: 18)),
                ],
              ),

              const SizedBox(height: 30),

              const Text("Row Example", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star, size: 40, color: Colors.blue),
                  Icon(Icons.favorite, size: 40, color: Colors.red),
                  Icon(Icons.thumb_up, size: 40, color: Colors.green),
                ],
              ),

              const SizedBox(height: 30),

              const Text("Row with Expanded", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Container(height: 50, color: Colors.blue),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(height: 50, color: Colors.red),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(height: 50, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
