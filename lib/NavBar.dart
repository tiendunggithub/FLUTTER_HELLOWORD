import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_helloword/screen/login.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Tiến Dũng'),
            accountEmail: Text('tiendung1001gn@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/naruto.jpg',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                )
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Account'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.coffee),
            title: Text('Product'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.table_bar),
            title: Text('Table'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculate'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart_sharp),
            title: Text('Report'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () {
              
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 25,
                height: 25,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Center(
                  child: Text('15',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}