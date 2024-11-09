import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/constants.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header(
      {super.key,
      required this.implyleading,
      this.title,
      required this.includeSearch});

  final double height = 80;
  final bool implyleading;
  final String? title;
  final bool includeSearch;
  final int headerTextLength = 16;

  String _formatTitleForHeader(String paramtitle) {
    String ret = paramtitle;
    if (paramtitle.characters.length > headerTextLength) {
      ret =
          "${paramtitle.characters.toList().sublist(0, headerTextLength).join("")} ...";
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: const Color.fromARGB(45, 158, 158, 158),
      leadingWidth: 400,
      toolbarHeight: height,
      actions: [
        includeSearch
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                    )))
            : const SizedBox.shrink(),
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
                        Text(
                          "The",
                          style: TextStyle(color: Constants.black),
                        ),
                        Row(
                          children: [
                            Text(
                              "Paw",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Constants.darkGold),
                            ),
                            Text(
                              "Print",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Constants.green),
                            ),
                          ],
                        ),

                        //TODO: Find a way to get issue XX done
                        Text(
                            "${DateFormat('yMd').format(DateTime.now())} - Issue XX"),
                      ]
                    : [
                        Text(_formatTitleForHeader(title ?? ""),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                        Text(
                            "${DateFormat('yMd').format(DateTime.now())} - Issue XX"),
                      ]),
          ])),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
