import 'package:flutter/material.dart';
import 'package:flutter_fetching_prak/constant.dart';
import 'package:flutter_fetching_prak/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.color.value = colorUtama;
            },
            child: Icon(Icons.refresh),
          ),
          backgroundColor: controller.color.value,
          body: controller.isLoading.value == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.datas!.data!.memes!.length,
                  itemBuilder: (context, index) {
                    var data = controller.datas!.data!.memes![index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          data.id!,
                          style: styleUtama,
                        ),
                        subtitle: Text(
                          data.name!,
                          style: styleKedua,
                        ),
                        leading: Container(
                          height: 200,
                          width: 50,
                          child: Image.network(
                            data.url!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
