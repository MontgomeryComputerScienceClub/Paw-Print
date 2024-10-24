import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/navbar.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 300,
          toolbarHeight: 80,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                    )))
          ],
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("The"),
                Text(
                  "PawPrint",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)
                      .copyWith(fontSize: 30),
                ),
                Text(DateFormat('yMd').format(DateTime.now())),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const Navbar(
          selectedIndex: 0,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Theme.of(context).canvasColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        "Recent Stories",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold)
                            .copyWith(fontSize: 20)
                            .copyWith(color: Colors.blue.shade800),
                      )),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 160,
                          color: Colors.red,
                        ),
                        Container(
                          width: 160,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 160,
                          color: Colors.green,
                        ),
                        Container(
                          width: 160,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: 160,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(Theme.of(context).textTheme.bodySmall?.fontFamily);
                },
                child: Text("helo"))
          ]),
        ));
  }
}
