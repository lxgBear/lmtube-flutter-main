import 'package:get/get.dart';
import 'package:mobile/pages/home/view.dart';
import 'package:mobile/pages/index/view.dart';
import 'package:mobile/pages/login/view.dart';

class HRoutes {
  static const String main = "/";
  static const String home = "/home";
  static const String login = "/login";

  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => IndexPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
  ];
}
