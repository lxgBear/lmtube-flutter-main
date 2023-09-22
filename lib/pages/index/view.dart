import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/generated/assets.dart';

import 'logic.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final logic = Get.put<IndexLogic>(IndexLogic());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        const Positioned.fill(
            child:
                Image(fit: BoxFit.cover, image: AssetImage(Assets.imagesBoot))),
        const Center(
            child: Image(width: 120, image: AssetImage(Assets.imagesBootLogo))),
        Positioned(
          top: 24,
          right: 20,
          child: SafeArea(
              child: GestureDetector(
                  onTap: () => logic.goHome(),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Obx(() => Text(
                            "${logic.count}秒",
                            style: theme.textTheme.labelMedium
                                ?.copyWith(color: Colors.white),
                          ))))),
        )
      ]),
    );
  }
}
