import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  final FocusNode focusNode;
  final GlobalKey searchKey;
  final VoidCallback onTap;
  final TextEditingController controller;

  const CustomSearchBar({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.searchKey,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      trailing: [
        IconButton(
          icon: const Icon(CupertinoIcons.clear),
          onPressed: () {
            widget.controller.clear();
          },
        ),
      ],
      leading:
          BackButton(onPressed: widget.onTap, color: AppColors.searchColor),
      hintText: "Search here",
      key: widget.searchKey,
      focusNode: widget.focusNode,
      controller: widget.controller,
    );
  }
}
