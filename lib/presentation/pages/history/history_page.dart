import 'package:bard_ai/core/routes/app_route_constants.dart';
import 'package:bard_ai/presentation/blocs/chat_bloc/chat_bloc.dart';
import 'package:bard_ai/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/colors/app_colors.dart';
import '../../../core/constants/icons/icons.dart';
import '../../../domain/services/local_db/chat_services_sqflt.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late PageController controller;
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  late ChatBloc chatBloc;

  List<ButtonData> items = [
    ButtonData(text: "Chat", index: 0),
    ButtonData(text: "Pinnet", index: 1),
    ButtonData(text: "Shared", index: 2),
  ];

  @override
  void initState() {
    chatBloc = ChatBloc(
      context.read<DB>(),
      context.read<MessageDB>(),
    )..add(const ChatEvent.getChats());
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    chatBloc.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: chatBloc,
      child: Scaffold(
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
                          onPressed: () async {
                            await context.read<DB>().clear();
                            await context.read<MessageDB>().clear();
                          },
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
            BlocBuilder<ChatBloc, ChatState>(
              bloc: chatBloc,
              builder: (context, state) {
                return state.map(
                  loading: (value) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  success: (value) {
                    return Expanded(
                      flex: 8,
                      child: PageView(
                        controller: controller,
                        children: [
                          ListView.builder(
                            itemCount: value.item.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 10.r,
                                ),
                                child: CutomListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          id: value.item[index].id,
                                        ),
                                      ),
                                    );
                                  },
                                  title: value.item[index].topic ?? "null",
                                  subtitle: "${value.item[index].createdAt}",
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
                    );
                  },
                  error: (value) {
                    return const Center(
                      child: Text("Error"),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CutomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;

  const CutomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
