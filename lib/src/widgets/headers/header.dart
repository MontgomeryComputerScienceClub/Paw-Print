import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/models/info.dart';
import 'package:myapp/src/widgets/search/searchdelegate.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.implyleading,
    this.title,
    required this.includeSearch,
    this.includeColumns = true,
    this.tabController,
  });

  final bool implyleading;
  final String? title;
  final bool includeSearch;
  final bool includeColumns;
  final double height = 80;
  final int headerTextLength = 16;
  final TabController? tabController;

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(includeColumns ? height : height - 40);
}

class _HeaderState extends State<Header> {
  Info info = Info(issue: 0);

  @override
  void initState() {
    super.initState();

    Info.syncInfo().then((value) {
      setState(() {
        info = value;
      });
    });
  }

  String _formatTitleForHeader(String paramtitle) {
    String ret = paramtitle;
    if (paramtitle.characters.length > widget.headerTextLength) {
      ret = "${paramtitle.characters.toList().sublist(0, widget.headerTextLength).join("")} ...";
    }

    return ret;
  }

  List<Widget> _generateColumns() {
    List<Widget> ret = [];

    for (int i = 0; i < Constants.columns.length; i++) {
      if (i != Constants.columnsThisIssueIndex) {
        ret.add(Tab(
          height: 23,
          child: Text(Constants.columns[i], style: GoogleFonts.aBeeZee()),
        ));
      } else {
        ret.add(Tab(
            height: 23,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Issue ", style: GoogleFonts.aBeeZee()),
                Text(info.issueToNumeral(),
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                      color: Constants.green,
                    )))
              ],
            )));
      }
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: const Color.fromARGB(45, 158, 158, 158),
      toolbarHeight: widget.height,
      actions: [
        widget.includeSearch
            ? IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: PaperSearchDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  size: 25,
                ))
            : const SizedBox.shrink(),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: widget.title != null
            ? [
                Text(_formatTitleForHeader(widget.title ?? ""),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25)),
              ]
            : [
                Text("The ",
                    style: GoogleFonts.unifrakturMaguntia(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25, color: Constants.black),
                    )),
                Text("Paw",
                    style: GoogleFonts.unifrakturMaguntia(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25, color: Constants.black),
                    )),
                Text("Print",
                    style: GoogleFonts.unifrakturMaguntia(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25, color: Constants.black),
                    )),
              ],
      ),
      centerTitle: true,
      bottom: widget.includeColumns
          ? TabBar(
              isScrollable: true,
              // unselectedLabelColor: Colors.white.withOpacity(0.3),
              // indicatorColor: Colors.white,
              tabs: _generateColumns(),
              controller: widget.tabController,
            )
          : null,
    );
  }
}
