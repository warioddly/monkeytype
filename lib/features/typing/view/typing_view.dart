import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkeytype/core/configs/environment.dart';
import 'package:monkeytype/core/utils/extensions/navigator_extension.dart';
import 'package:monkeytype/features/profile/view/profile_view.dart';
import 'package:monkeytype/features/typing/bloc/typing/typing_bloc.dart';
import 'package:monkeytype/features/typing/widgets/typing_config_bottom_sheet_widget.dart';
import 'package:monkeytype/features/typing/widgets/typing_widget.dart';
import 'package:pixelarticons/pixel.dart';


class TypingView extends StatefulWidget {
  const TypingView({super.key});

  static const String route = '/typing';

  @override
  State<TypingView> createState() => _TypingViewState();
}

class _TypingViewState extends State<TypingView> {


  static const Duration hideOnStartTyping = Duration(milliseconds: 150);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
          create: (context) => TypingBloc(),
          child: BlocBuilder<TypingBloc, TypingState>(
            builder: (context, state) {

              final opacity = state is TypingStarted ? 0.0 : 1.0;

              return Scaffold(
                appBar: AppBar(
                  title: const Text(Environment.APP_NAME),
                  centerTitle: true,
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      AnimatedOpacity(
                        opacity: opacity,
                        duration: hideOnStartTyping,
                        child: IconButton(
                          tooltip: "Play with friends",
                          icon: const Icon(Pixel.users),
                          onPressed: () {
                            showModalBottomSheet(
                              useSafeArea: true,
                              context: context,
                              builder: (context) => const TypingConfigBottomSheetWidget(),
                            );
                          },

                        ),
                      ),

                    ],
                  ),
                  actions: [

                    AnimatedOpacity(
                      opacity: opacity,
                      duration: hideOnStartTyping,
                      child: IconButton(
                        tooltip: "Settings",
                        icon: const Icon(Pixel.sliders),
                        onPressed: () {
                          showModalBottomSheet(
                            useSafeArea: true,
                            context: context,
                            builder: (context) => const TypingConfigBottomSheetWidget(),
                          );
                        },

                      ),
                    ),

                    AnimatedOpacity(
                      opacity: opacity,
                      duration: hideOnStartTyping,
                      child: IconButton(
                        tooltip: "Profile",
                        icon: const Icon(Pixel.avatar),
                        onPressed: () {
                          context.go(ProfileView.route);
                        },

                      ),
                    )

                  ],
                ),
                body: const Center(
                  child: TypingWidget(),
                ),
              );
            },
          ),
        )
    );
  }
}

