import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  final FocusNode? focusNode;
  final GlobalKey searchKey;
  final VoidCallback onTap;
  final TextEditingController controller;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.searchKey,
    required this.onTap,
    this.focusNode,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.searchKey,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade300.withOpacity(0.8),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide.none,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 60,
        ),
        suffixIcon: Center(
          child: IconButton(
            icon: const Icon(CupertinoIcons.clear,color: AppColors.darkBlue1,),
            onPressed: () {
              widget.controller.clear();
            },
          ),
        ),
        prefixIcon: Center(
          child:
              BackButton(onPressed: widget.onTap, color: AppColors.darkBlue1),
        ),
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 50,
        ),
        hintStyle: const TextStyle(color: AppColors.darkBlue1),
        hintText: "Search here",
      ),
    );
  }
}
