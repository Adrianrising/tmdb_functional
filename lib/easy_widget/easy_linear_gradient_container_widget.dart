import 'package:flutter/material.dart';

import '../constant/colors.dart';

class EasyLinearGradientContainerWidget extends StatelessWidget {
  const EasyLinearGradientContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );
  }
}