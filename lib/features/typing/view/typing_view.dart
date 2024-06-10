import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkeytype/core/configs/environment.dart';
import 'package:monkeytype/features/typing/bloc/typing/typing_bloc.dart';
import 'package:monkeytype/features/typing/widgets/typing_config_bottom_sheet_widget.dart';
import 'package:monkeytype/features/typing/widgets/typing_widget.dart';
import 'package:pixelarticons/pixel.dart';


class TypingView extends StatefulWidget {
  const TypingView({super.key});

  static const String route = '/home';

  @override
  State<TypingView> createState() => _TypingViewState();
}

class _TypingViewState extends State<TypingView> {



  final typingBloc = TypingBloc();


  static const Duration hideOnStartTyping = Duration(milliseconds: 150);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
          create: (context) => typingBloc,
          child: BlocBuilder<TypingBloc, TypingState>(
            builder: (context, state) {

              return Scaffold(
                appBar: AppBar(
                  title: const Text(Environment.APP_NAME),
                  centerTitle: true,
                  actions: [

                    AnimatedOpacity(
                      opacity: state is TypingStarted ? 0.0 : 1.0,
                      duration: hideOnStartTyping,
                      child: IconButton(
                        icon: const Icon(Pixel.sliders),
                        onPressed: () {
                          showModalBottomSheet(
                            useSafeArea: true,
                            context: context,
                            builder: (context) => const TypingConfigBottomSheetWidget(),
                          );
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

