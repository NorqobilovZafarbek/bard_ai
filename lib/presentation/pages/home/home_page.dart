import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors/app_colors.dart';
import '../../../core/constants/icons/icons.dart';
import '../../blocs/bloc/chat_bloc.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drawer.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ChatBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70.r),
        child: const CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: BlocBuilder<ChatBloc, ChatState>(
          bloc: bloc,
          builder: (context, state) {
            return Column(
              children: [
                state.maybeMap(
                  orElse: () => const SizedBox(),
                  started: (value) => Padding(
                    padding: EdgeInsets.only(left: 5.r),
                    child: Image(
                      width: 298.w,
                      height: 364.h,
                      image: const AssetImage(
                        AppIcons.features,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: bloc.chats.length,
                    itemBuilder: (context, index) {
                      final data = bloc.chats[index].parts?.first.text;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 20.r,
                              child: const ColoredBox(
                                color: AppColors.black26,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Card(
                              elevation: 0,
                              color: AppColors.white50,
                              child: Padding(
                                padding: EdgeInsets.all(16.r),
                                child: Text(
                                  data ?? "null",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                state.maybeMap(
                  orElse: () => const SizedBox(),
                  loading: (value) => const CupertinoActivityIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.r, right: 8.r),
                          child: TextField(
                            controller: controller,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              prefixIcon: const Icon(Icons.add),
                              suffixIcon: const Icon(Icons.mic),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                              ),
                              hintText: 'Write a message...',
                              hintStyle: const TextStyle(
                                color: AppColors.black26,
                              ),
                            ),
                          ),
                        ),
                      ),
                      BlocBuilder<ChatBloc, ChatState>(
                        bloc: bloc,
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              state.maybeMap(
                                orElse: () {
                                  if (controller.text.isNotEmpty) {
                                    bloc.add(
                                      ChatEvent.sendMessage(controller.text),
                                    );
                                  }
                                  controller.clear();
                                },
                                loading: (value) {
                                  return null;
                                },
                              );
                            },
                            child: Container(
                              width: 40.r,
                              height: 40.r,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blue,
                              ),
                              child: Center(
                                child: state.maybeMap(
                                  orElse: () => const Icon(
                                    Icons.send,
                                    color: AppColors.white,
                                  ),
                                  loading: (value) => const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
