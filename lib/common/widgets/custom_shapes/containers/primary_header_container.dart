import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: SizedBox(
          height: 330,
          child: Container(
            color: TColors.primaryBackground,

            child: Stack(
              children: [
                Positioned(top: -190, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),)),
                Positioned(top: 60, right: -300, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),)),
                child,

              ],
            ),
          ),
      ),
    );
  }
}

