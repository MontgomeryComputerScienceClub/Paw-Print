import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, required this.implyleading});

  final double height = 80;
  final bool implyleading;
  // final String title;
  // final Color backgroundColor;
  // final List<Widget> actions;
  // Header({required this.title, required this.backgroundColor, required this.actions});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: const Color.fromARGB(45, 158, 158, 158),
      leadingWidth: 300,
      toolbarHeight: height,
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
            left: 10,
          ),
          child: Row(children: [
            implyleading
                ? IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios))
                : const SizedBox.shrink(),
            Column(
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
                Text("${DateFormat('yMd').format(DateTime.now())} - Issue XX"),
              ],
            ),
          ])),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
