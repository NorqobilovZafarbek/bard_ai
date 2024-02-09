import 'package:bard_ai/core/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/colors/app_colors.dart';
import '../../../core/constants/icons/icons.dart';
import '../../../domain/services/local_db/app_services.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late PageController controller;
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  List<ButtonData> items = [
    ButtonData(text: "Chat", index: 0),
    ButtonData(text: "Pinnet", index: 1),
    ButtonData(text: "Shared", index: 2),
  ];

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('---------------------------------------');
    List<List<Content>> chats = AppServices.readChats();
    print('--------------------history');
    print(chats.first.isEmpty);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(
                top: 40.r,
                left: 20.r,
                right: 20.r,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pushNamed(AppRouteConstants.homeRouteName);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 26.r,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "History",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 24.sp),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image(
                          height: 25.r,
                          image: const AssetImage(
                            AppIcons.search,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.r),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: items
                        .map(
                          (e) => ValueListenableBuilder<int>(
                              valueListenable: currentIndex,
                              builder: (context, value, child) {
                                return CustomSegmentButton(
                                  onTap: () {
                                    currentIndex.value = e.index;
                                    controller.animateToPage(
                                      currentIndex.value,
                                      duration: const Duration(
                                        microseconds: 200,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  name: e.text,
                                  isEqual: value == e.index,
                                );
                              }),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 20.r),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: PageView(
              controller: controller,
              children: [
                chats.first.isEmpty
                    ? const Center(
                        child: Text("No element chat"),
                      )
                    : ListView.builder(
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: 10.r,
                            ),
                            child: CutomListTile(
                              title:
                                  chats[index][index].parts?.first.text ?? "",
                              subtitle:
                                  chats[index][index + 1].parts?.first.text ??
                                      "",
                            ),
                          );
                        },
                      ),
                const Center(
                  child: Text("There is no posted message ?"),
                ),
                const Center(
                  child: Text("There is no shared message ?"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CutomListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const CutomListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.black26),
        ),
        child: SizedBox(
          height: 48.r,
          width: 48.r,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: const Image(
              image: AssetImage(
                AppIcons.message,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert_outlined,
        ),
      ),
    );
  }
}

class CustomSegmentButton extends StatelessWidget {
  final String name;
  final bool isEqual;
  final void Function() onTap;

  const CustomSegmentButton({
    super.key,
    required this.name,
    required this.isEqual,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isEqual ? AppColors.blue : AppColors.white50,
          borderRadius: isEqual
              ? BorderRadius.all(
                  Radius.circular(4.r),
                )
              : null,
        ),
        child: SizedBox(
          height: 32.r,
          width: 96.r,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                color: isEqual ? AppColors.white : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonData {
  final int index;
  final String text;

  ButtonData({
    required this.index,
    required this.text,
  });
}
