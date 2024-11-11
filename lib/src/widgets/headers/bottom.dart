import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  static final List<FloatingActionButtonLocation> centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Constants.bottomAppBarColor,
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Go back',
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Share',
            icon: const Icon(Icons.ios_share),
            onPressed: () {
              //TODO: implement this
            },
          ),
          IconButton(
            tooltip: 'Save',
            icon: const Icon(Icons.save_alt),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
