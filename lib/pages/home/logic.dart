import 'package:get/get.dart';
import 'package:mobile/global/logic.dart';
import 'package:mobile/http/recommend.dart';
import 'package:mobile/routes.dart';

import '../../http/net.dart';

class HomeLogic extends GetxController {
  final global = Get.find<GlobalLogic>().state;
  List<HimalayaSubItemInfo> rankList = [
    HimalayaSubItemInfo(
      title: '推荐',
      state: true,
    ),
    HimalayaSubItemInfo(
      title: '澜湄视听周',
      state: false,
    ),
    HimalayaSubItemInfo(
      title: '党政专栏',
      state: false,
    ),
    HimalayaSubItemInfo(
      title: '澜湄观察',
      state: false,
    )
  ];

  List<TitleContent> titleContent = [
    TitleContent(
      title: '坚持不懈用习近平新时代中国特色社会主义思想凝心铸魂',
      url: 'https://via.placeholder.com/359x188',
      publisher: '澜湄观察',
      releaseTime: '14分钟前',
    ),
    TitleContent(
      title: '云南省与教育部签署战略合作协议',
      url: 'https://via.placeholder.com/359x188',
      publisher: '澜湄观察',
      releaseTime: '14分钟前',
    ),
    TitleContent(
      title: '云南省重大科技专项“发酵蔬菜加工共性关键技术研究与产业化”通过验收',
      url: 'https://via.placeholder.com/359x188',
      publisher: '澜湄观察',
      releaseTime: '14分钟前',
    ),
  ];

  @override
  void onReady() {
    print("xnssxpmxopmxpsmxp");

    if (global.accessToken == "") {
      Get.toNamed(HRoutes.login);
    }
    handleUserList();
    super.onReady();
  }

  void clickss(e) {
    for (var i = 0; i < rankList.length; i++) {
      rankList[i].state = false;
    }
    rankList[e].state = true;
    update();
  }

  Future<void> handleUserList() async {
    try {
      var r = await fetch<Recommend>(
        "v1/recommend/paging?page=0&count=20",
        method: "GET",
        silent: false,


      );
      print(r);
    } catch (_) {}
  }
}

class HimalayaSubItemInfo {
  HimalayaSubItemInfo({
    required this.title,
    this.state = false,
  });

  ///按钮名称
  String title;
  bool state;
}

class TitleContent {
  TitleContent({
    required this.title,
    required this.url,
    required this.publisher,
    required this.releaseTime,
  });

  ///标题
  String title;

  ///子列表
  String url;
  String publisher;
  String releaseTime;
}
