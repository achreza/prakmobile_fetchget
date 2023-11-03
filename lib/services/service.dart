import 'package:get/get.dart';

class MainService extends GetConnect {
  @override
  void onInit() {}

  Future<Response> getMemes() => get('https://api.imgflip.com/get_memes');
}
