import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/icons/icons.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      toolbarHeight: 70.r,
      title: const Text("Chatbot"),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.r),
        child: Builder(
          builder: (context) {
            return IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Image(
                image: AssetImage(
                  AppIcons.drawer,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
