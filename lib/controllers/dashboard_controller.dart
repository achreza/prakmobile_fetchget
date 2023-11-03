import 'package:flutter/material.dart';
import 'package:flutter_fetching_prak/models/mememodel.dart';
import 'package:get/get.dart';

import '../services/service.dart';

class DashboardController extends GetxController {
  var nama = 'Rizki Ramadhan';

  MemesModel? datas;
  RxBool isLoading = true.obs;
  Rx<Color> color = Colors.white.obs;
  TextStyle changeColor = TextStyle(color: Colors.red);

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var response = await MainService().getMemes();
    Get.log(response.body.toString());
    if (response.statusCode == 200) {
      datas = MemesModel.fromJson(response.body);
      isLoading.value = false;
    } else {
      print('error');
    }
  }
}
