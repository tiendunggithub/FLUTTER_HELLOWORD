import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:flutter_helloword/screen/index.dart';
import 'package:flutter_helloword/screen/login.dart';
import 'package:flutter_helloword/screen/todo.dart';

import 'model/todo.dart'; 
// import 'package:http/http.dart' as http;

void main() {
  // print(http.read('http://localhost:3000/tables'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
  
  Widget contentWidget() {
    return SizedBox(child: _buildGrid(),);
  }

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30));

  // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
  // The List.generate() constructor allows an easy way to create
  // a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) => List.generate(count,
      (i) => Container(child: Image.asset('../images/prod-coffee-1.jpg')));

  Widget buildGrid() {
    return SizedBox(
      height: 250,
      child: ListView(
        children: [
          _tile('Bạc xỉu', '20.000đ', 'prod-coffee-1.jpg'),
          _tile('Cà phê sữa SG', '18.000đ', 'prod-coffee-1.jpg'),
          _tile('Cà phê đen SG', '16.000đ', 'prod-coffee-1.jpg'),
          _tile('Cà phê đen', '10.000đ', 'prod-coffee-1.jpg'),
          _tile('Cà phê sữa', '12.000đ', 'prod-coffee-1.jpg'),
        ],
      ),
    );
  }

  ListTile _tile(String title, String subtitle, String image) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Image.asset('../images/' + image + ''),
      selected: title == 'Bạc xỉu' ? true : false,
      selectedColor: Colors.deepOrangeAccent,
      onTap: (){
        // print("Container pressed");
      },
    );
  }

  ListTile listCard() {
    return ListTile(
      title: const Text(
        '1625 Main Street',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: const Text('My City, CA 99984'),
      leading: Icon(
        Icons.restaurant_menu,
        color: Color(0xF4E21414),
      ),
    );
  }

  Widget buildListCard() {
    return ListView(
      children: [listCard()],
    );
  }

  //card
  Widget _buildCard() {
    return SizedBox(
      // height: 300,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                '1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text('My City, CA 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Color(0xF4E21414),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: const Text('costa@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
