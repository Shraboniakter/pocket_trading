import 'package:flutter/material.dart';

import '../../widgets/CustomAppbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHomeAppBar(),
          Expanded(
            child: Container(
              color: Colors.grey[100],
            ),
          )
        ],
      ),
    );
  }
}
