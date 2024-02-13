import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors/app_colors.dart';
import '../../../core/constants/icons/icons.dart';
import '../../../domain/services/local_db/chat_services_sqflt.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drawer.dart';
import 'package:bard_ai/presentation/blocs/message_bloc/message_bloc.dart';

class HomePage extends StatefulWidget {
  final String? id;

  const HomePage({super.key, this.id});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late TextEditingController controller;

  late final MessageBloc messageBloc;
  late ScrollController scrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    scrollController = ScrollController();
    focusNode = FocusNode()..addListener(listenFocus);
    messageBloc = MessageBloc(
      context.read<MessageDB>(),
      widget.id,
      context.read<DB>(),
    )..add(const MessageEvent.started());
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(listenFocus)
      ..dispose();
    scrollController.dispose();
    messageBloc.close();
    controller.dispose();
    super.dispose();
  }

  void listenFocus() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Durations.short2,
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: messageBloc,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 70.r),
          child: const CustomAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocConsumer<MessageBloc, MessageState>(
                listener: (context, state) {
                  if (state.chatsViewModel != null) {
                    context.read<DB>().addToChats(state.chatsViewModel!);
                  }
                },
                listenWhen: (previous, current) =>
                    previous.chatsViewModel != current.chatsViewModel,
                bloc: messageBloc,
                builder: (context, state) {
                  if (state.error != null) {
                    return Center(
                      child: Text(
                        state.error!.message,
                      ),
                    );
                  }

                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.item.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(left: 5.r),
                      child: Image(
                        width: 298.w,
                        height: 364.h,
                        image: const AssetImage(
                          AppIcons.features,
                        ),
                      ),
                    );
                  }
                  final item = state.item;
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      if (item.isNotEmpty) {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: Durations.short2,
                          curve: Curves.linear,
                        );
                      }
                    },
                  );
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: scrollController,
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        final data = item[index];
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
                                    data.text,
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
                  );
                },
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
                          focusNode: focusNode,
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
                    BlocBuilder<MessageBloc, MessageState>(
                      bloc: messageBloc,
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: state.isLoading
                              ? null
                              : () {
                                  if (controller.text.isNotEmpty) {
                                    messageBloc.add(
                                      MessageEvent.sendMessage(controller.text),
                                    );
                                  }
                                  controller.clear();
                                },
                          child: Container(
                            width: 40.r,
                            height: 40.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blue,
                            ),
                            child: Center(
                              child: state.isLoading
                                  ? const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : const Icon(
                                      Icons.send,
                                      color: AppColors.white,
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
          ),
        ),
      ),
    );
  }
}
