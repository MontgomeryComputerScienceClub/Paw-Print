import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/point.dart';

//use https://pub.dev/packages/flutter_earth_globe
// need to modify story or story preview to include location ig idk

class WorldPolitics extends StatefulWidget {
  const WorldPolitics({super.key});

  @override
  State<WorldPolitics> createState() => _WorldPoliticsState();
}

class _WorldPoliticsState extends State<WorldPolitics> {
  late FlutterEarthGlobeController _controller;

  @override
  initState() {
    super.initState();
    _controller = FlutterEarthGlobeController(
        rotationSpeed: 0.05,
        isBackgroundFollowingSphereRotation: true,
        background: Image.asset('assets/2k_stars.jpg').image,
        surface: Image.asset('assets/2k_earth-day.jpg').image);

    List<Point> points = [
      Point(
          id: '1',
          coordinates: const GlobeCoordinates(51.5072, 0.1276),
          label: 'London',
          isLabelVisible: true,
          style: const PointStyle(color: Colors.red, size: 6)),
      Point(
          id: '2',
          isLabelVisible: true,
          coordinates: const GlobeCoordinates(40.7128, -74.0060),
          style: const PointStyle(color: Colors.green),
          onHover: () {},
          label: 'New York'),
      Point(
          id: '3',
          isLabelVisible: true,
          coordinates: const GlobeCoordinates(35.6895, 139.6917),
          style: const PointStyle(color: Colors.blue),
          onHover: () {
            print('Tokyo');
          },
          label: 'Tokyo'),
      Point(
          id: '4',
          isLabelVisible: true,
          onTap: () {
            Future.delayed(Duration.zero, () {
              if (!mounted) return;
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        title: Text('Center'),
                        content: Text('This is the center of the globe'),
                      ));
            });
          },
          coordinates: const GlobeCoordinates(0, 0),
          style: const PointStyle(color: Colors.yellow),
          label: 'Center'),
    ];

    for (var point in points) {
      _controller.addPoint(point);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FlutterEarthGlobe(
      alignment: Alignment.center,
      controller: _controller,
      radius: 80,
    ));
  }
}
