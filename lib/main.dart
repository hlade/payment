import 'package:flutter/material.dart';
import 'walletScreen.dart';
import 'cardScreen.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WalletApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WalletApp extends StatefulWidget {
  @override
  _WalletAppState createState() => _WalletAppState();
}

class _WalletAppState extends State<WalletApp> {
  var screens = [WalletScreen(), CardScreen()];
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5FB),
      bottomNavigationBar: FFNavigationBar(
        selectedIndex: selectedTab,
        onSelectTab: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.account_balance_wallet,
            label: 'Wallet',
          ),
          FFNavigationBarItem(
            iconData: Icons.group,
            label: 'Teams',
          ),
          FFNavigationBarItem(
            iconData: Icons.announcement,
            label: 'Reaquests',
          ),
          FFNavigationBarItem(
            iconData: Icons.filter_list,
            label: 'More',
          ),
        ],
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemLabelColor: Colors.blue[700],
        ),
      ),
      body: screens[selectedTab],
    );
  }
}
