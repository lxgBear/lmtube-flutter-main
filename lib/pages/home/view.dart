import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import '../../styles/theme.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: theme.colorScheme.surface,
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text("asnxisnxi"),
          ),
          body: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                _buildCardBg(theme),
                Image.network(
                  "https://via.placeholder.com/359x188",
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _listView(theme),
                      ),
                      _card(theme),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      _lists(),
                    ],
                  ),
                )
              ],
            )),
          )),
    );
  }


  Widget _lists() {
    return Container(
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 140,
                height: 100,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/140x100"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Container(
                color: Colors.red,
                  height: 92,
               child: const Column(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("习近平在浙江金华市考察调研"),
                   Text("澜湄视听 . 15分钟前"),
                 ],
               ),
              )
            ],
          )   ,
          Padding(padding: EdgeInsets.only(top: 8)),
          Row(
            children: [
              Container(
                width: 140,
                height: 100,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/140x100"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Container(
                color: Colors.red,
                  height: 92,
               child: const Column(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("习近平在浙江金华市考察调研"),
                   Text("澜湄视听 . 15分钟前"),
                 ],
               ),
              )
            ],
          )
        ]));
  }

  Widget _card(ThemeData theme) {
    return Container(
      child: Column(children: [
        Image.network(
          'https://via.placeholder.com/140x100',
          fit: BoxFit.fill,
          width: 359,
          height: 188,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            Text("有一种叫云南的生活·我家乡村美，当一群年轻人决定回乡",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            const Text("澜湄视听 . 15分钟前")
          ],
        ),
      ]),
    );
  }

  List<Widget> _listView(ThemeData theme) {
    return logic.titleContent
        .map((e) => Container(
              margin: EdgeInsets.only(top: 8, bottom: 12),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title,
                          style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: LocaleKeys.commonly_used_major.tr,
                            style: theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                              text: e.publisher,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: ' . ${e.releaseTime}',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ))
        .toList();
  }

  Widget _buildCardBg(ThemeData theme) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 8),
      child: Row(children: [
        GestureDetector(
            onTap: () => logic.clickss(0),
            child: GetBuilder<HomeLogic>(
              builder: (HomeLogic controller) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                  margin: EdgeInsets.only(left: 8),
                  decoration: ShapeDecoration(
                    color: logic.rankList[0].state
                        ? theme.colorScheme.secondaryContainer
                        : HThemeData.getSurfaceContainer(theme),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text('${logic.rankList[0].title}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      )),
                );
              },
            )),
        GestureDetector(
            onTap: () => logic.clickss(1),
            child: GetBuilder<HomeLogic>(
              builder: (HomeLogic controller) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                  margin: EdgeInsets.only(left: 8),
                  decoration: ShapeDecoration(
                    color: logic.rankList[1].state
                        ? theme.colorScheme.secondaryContainer
                        : HThemeData.getSurfaceContainer(theme),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text('${logic.rankList[1].title}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      )),
                );
              },
            )),
        GestureDetector(
            onTap: () => logic.clickss(2),
            child: GetBuilder<HomeLogic>(
              builder: (HomeLogic controller) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                  margin: EdgeInsets.only(left: 8),
                  decoration: ShapeDecoration(
                    color: logic.rankList[2].state
                        ? theme.colorScheme.secondaryContainer
                        : HThemeData.getSurfaceContainer(theme),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text('${logic.rankList[2].title}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      )),
                );
              },
            )),
        GestureDetector(
            onTap: () => logic.clickss(3),
            child: GetBuilder<HomeLogic>(
              builder: (HomeLogic controller) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                  margin: EdgeInsets.only(left: 8),
                  decoration: ShapeDecoration(
                    color: logic.rankList[3].state
                        ? theme.colorScheme.secondaryContainer
                        : HThemeData.getSurfaceContainer(theme),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text('${logic.rankList[3].title}',
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSurface, fontSize: 14)),
                );
              },
            ))
      ]),
    );
  }
}
