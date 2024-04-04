import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/getx/Apicontroller/datalistcontroller.dart';

class DataListPageScreen extends StatelessWidget {
  DataListPageScreen({super.key});
  final DatalListController controller = Get.put(DatalListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          GetBuilder<DatalListController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      controller.dataList[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text(controller.dataList[index].postId.toString(),
                            style: TextStyle(color: Colors.grey[700])),
                        Text(controller.dataList[index].id.toString(),
                            style: TextStyle(color: Colors.grey[700])),
                        SizedBox(height: 8.0),
                        Text(
                          controller.dataList[index].email,
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(height: 8.0),
                        Text('Body:',
                            style: TextStyle(color: Colors.grey[700])),
                        Text(
                          controller.dataList[index].body,
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ));
            });
      }),
    );
  }
}
