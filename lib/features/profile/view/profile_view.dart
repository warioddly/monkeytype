

import 'package:flutter/material.dart';
import 'package:monkeytype/core/utils/extensions/navigator_extension.dart';
import 'package:pixelarticons/pixel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static const String route = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            leading: IconButton(
              icon: const Icon(Pixel.chevronleft),
              onPressed: () {
                context.goBack();
              },
            ),
          ),
          body: const Center(
            child: Text('Profile View'),
          )
      ),
    );
  }
}
