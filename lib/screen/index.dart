import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_helloword/NavBar.dart';
import 'package:flutter_helloword/screen/account.dart';
import 'package:flutter_helloword/screen/product.dart';
import 'package:flutter_helloword/screen/report.dart';
import 'package:flutter_helloword/screen/tables.dart';
import 'package:flutter_helloword/screen/todo.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;

import '../model/todo.dart';
import '../widgets/todo_items.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  List<dynamic> tables = [];

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, );
  final _pageOptions = [
    ToDoScreen(),
    // ProductScreen(),
    TablesCreen(),
    ReportScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: NavBar(),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      // ListView.builder(itemCount: tables.length, itemBuilder: (context, index){
      //   final table = tables[index];
      //   final name = table['NAME'];
      //   return ListTile(
      //     leading: CircleAvatar(
      //       child: Text((index + 1).toString())),
      //     title: Text(name),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(15.0),
      //     ),
      //   );
      // }),
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: fetchTables,
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const ToDoScreen()),
      //       );
      //   },
      //   child: Icon(Icons.navigate_next),
      //   backgroundColor: Colors.blue,
      //   ),
    );
  }

  void fetchTables() async {
    print('fetchTables called');
    const url = 'http://10.0.2.2:3000/tables';
    // final uri = ;
    final response = await http.get(Uri.parse(url));
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      tables = json;
    });
    print('fetchTables complete');
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black87,
              size: 30, // Changing Drawer Icon Size
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: Color(0xFFEEEEEE),
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        // const Icon(
        //   Icons.menu_rounded,
        //   color: Colors.black,
        //   size: 30,
        // ),
        Container(
          width: 40,
          height: 40,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/naruto.jpg')),
        )
      ]),
    );
  }
}
