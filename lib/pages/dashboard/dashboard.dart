import 'package:bprcf/pages/dashboard/home_page.dart';
import 'package:bprcf/pages/home.dart';
import 'package:bprcf/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePageDash(),
    Text(
      'Info',
      style: optionStyle,
    ),
    HomePage(),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            color: Colors.indigo.shade800,
            activeColor: Colors.indigo.shade50,
            tabBackgroundColor: Colors.indigo.shade800,
            gap: 4,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                text: 'Home',
                icon: Iconsax.home,
              ),
              GButton(
                text: 'Info',
                icon: Iconsax.message,
              ),
              GButton(
                text: 'Inbox',
                icon: Iconsax.direct_inbox,
              ),
              GButton(
                text: 'Profile',
                icon: LineIcons.user,
              ),
              GButton(
                onPressed: () {
                  _modalConfirmSignOut();
                },
                icon: LineIcons.alternateSignOut,
                iconColor: Colors.red,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  void _modalConfirmSignOut() {
    Provider.of<Auth>(context, listen: false).logout();
  }
}
