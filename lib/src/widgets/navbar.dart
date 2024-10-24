import 'package:flutter/material.dart';
import 'package:myapp/src/screens/home.dart';
// import 'package:myapp/src/screens/adminHome.dart';
// import 'package:myapp/src/screens/clientHome.dart';
// import 'package:myapp/src/screens/mapscreen.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex;
  // ignore: use_key_in_widget_constructors
  const Navbar({Key? key, required this.selectedIndex});

  @override
  State<StatefulWidget> createState() => NavBarState();
}

class NavBarState extends State<Navbar> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  void _onItemTapped(int index) async {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      case 1:
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => AdminHome(

      //         )));
      case 2:
      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MapScreen()));
    }

    // if selectedIndex == indexof a page
    // nav push
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.games),
          label: 'Games',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Other',
        ),
      ],
      currentIndex: _selectedIndex,
      // backgroundColor: _isbday ? Colors.amber[700] : null,
      // selectedItemColor: _isbday ? Colors.white : primaryColorColor,
      onTap: _onItemTapped,
    );
  }
}
