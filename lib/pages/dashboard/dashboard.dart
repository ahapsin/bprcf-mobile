import 'package:bprcf/pages/dashboard/home/home_page.dart';
import 'package:bprcf/pages/dashboard/product/product_page.dart';
import 'package:bprcf/pages/dashboard/profile/profile_page.dart';
import 'package:bprcf/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icon.dart';
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
    HomePage(),
    ProfilePageDash(),
    ProfilePageDash(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 9,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              color: Colors.indigo.shade800,
              activeColor: Colors.indigoAccent,
              gap: 4,
              padding: EdgeInsets.all(10),
              tabs: [
                GButton(
                  text: 'Home',
                  icon: Iconsax.home,
                ),
                GButton(
                  text: 'Inbox',
                  icon: Iconsax.wallet_3,
                ),
                GButton(
                  text: 'Profile',
                  icon: Iconsax.cards,
                ),
                GButton(
                  onPressed: () {
                    _modalConfirmSignOut();
                  },
                  icon: Iconsax.setting_2,
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
      ),
    );
  }

  void _modalConfirmSignOut() {
    Provider.of<Auth>(context, listen: false).logout();
  }
}
