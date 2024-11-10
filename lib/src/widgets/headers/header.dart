import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header(
      {super.key,
      required this.implyleading,
      this.title,
      required this.includeSearch});

  final bool implyleading;
  final String? title;
  final bool includeSearch;
  final double height = 80;
  final int headerTextLength = 16;

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  String _formatTitleForHeader(String paramtitle) {
    String ret = paramtitle;
    if (paramtitle.characters.length > widget.headerTextLength) {
      ret =
          "${paramtitle.characters.toList().sublist(0, widget.headerTextLength).join("")} ...";
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: const Color.fromARGB(45, 158, 158, 158),
      leadingWidth: 400,
      toolbarHeight: widget.height,
      actions: [
        widget.includeSearch
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
          widget.implyleading
              ? IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios))
              : const SizedBox.shrink(),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.title == null
                  ? [
                      Text(
                        "The",
                        style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(color: Constants.black)),
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
                        "${DateFormat('yMd').format(DateTime.now())} - Issue XX",
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ]
                  : [
                      Text(_formatTitleForHeader(widget.title ?? ""),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                      Text(
                          "${DateFormat('yMd').format(DateTime.now())} - Issue XX"),
                    ]),
        ]),
      ),
    );
  }
}
