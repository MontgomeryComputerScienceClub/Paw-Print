import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, required this.implyleading, this.title});

  final double height = 80;
  final bool implyleading;
  final String? title;
  // final String title;
  // final Color backgroundColor;
  // final List<Widget> actions;
  // Header({required this.title, required this.backgroundColor, required this.actions});

  String _formatTitleForHeader(String paramtitle) {
    String ret = paramtitle;
    List<String> splitTitle = paramtitle.split(" ");
    if (splitTitle.length > 2) {
      ret = "${splitTitle.sublist(0, 2).join(" ")} ...";
    }

    return ret;
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: title == null
                    ? [
                        const Text("The"),
                        Text(
                          "PawPrint",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold)
                              .copyWith(fontSize: 30),
                        ),
                        Text(
                            "${DateFormat('yMd').format(DateTime.now())} - Issue XX"),
                      ]
                    : [
                        SizedBox(
                          width: 240,
                          child: Text(_formatTitleForHeader(title ?? ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)
                                  .copyWith(fontSize: 30)),
                        ),
                        Text(
                            "${DateFormat('yMd').format(DateTime.now())} - Issue XX"),
                      ]),
          ])),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
