import 'package:flutter/material.dart';
// import 'package:myapp/src/routes/leftrightroute.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/games/games.dart';
import 'package:myapp/src/screens/home/home.dart';

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
        Navigator.of(context)
            .pushReplacement(NoAnimationRoute(child: const Home()));
      case 1:
        Navigator.of(context)
            .pushReplacement(NoAnimationRoute(child: const GamesScreen()));
      case 2:
      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MapScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'Home',
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
      onTap: _onItemTapped,
    );
  }
}
