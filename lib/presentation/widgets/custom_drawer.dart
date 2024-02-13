import 'package:bard_ai/data/models/chat_view/chat_view_model.dart';
import 'package:bard_ai/presentation/blocs/message_bloc/message_bloc.dart';
import 'package:bard_ai/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors/app_colors.dart';
import '../../core/routes/app_route_constants.dart';
import '../../core/constants/icons/icons.dart';
import 'package:go_router/go_router.dart';

import '../../domain/services/local_db/chat_services_sqflt.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 30.r, left: 20.r, right: 20.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  child: Icon(
                    Icons.person,
                    size: 30.r,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Random Dude",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "random.dude@random.com",
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 28.r),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                ),
              ),
              child: SizedBox(
                height: 77.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 26.r,
                      foregroundColor: AppColors.white,
                      child: Image(
                        height: 25.r,
                        width: 25.r,
                        image: const AssetImage(
                          AppIcons.star,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upgrade to Pro",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                        Text(
                          "Enjoy all the benefits and \n generate up to 1000",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.r),
            Column(
              children: [
                ListTile(
                  title: const Text("New Chat"),
                  onTap: () {
                    ChatsViewModel chatsViewModel = ChatsViewModel(
                      createdAt: DateTime.now(),
                    );
                    context.read<DB>().addToChats(chatsViewModel);
                    context.read<MessageBloc>().add(
                          MessageEvent.newChat(
                            chatsViewModel.id,
                          ),
                        );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          id: chatsViewModel.id,
                        ),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.add,
                    size: 20.r,
                  ),
                ),
                ListTile(
                  onTap: () {
                    context.go('/${AppRouteConstants.historyRouteName}');
                  },
                  title: const Text("History"),
                  leading: Icon(
                    size: 20.r,
                    Icons.history,
                  ),
                ),
                ListTile(
                  title: const Text("Settings"),
                  leading: Icon(
                    Icons.settings,
                    size: 20.r,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
