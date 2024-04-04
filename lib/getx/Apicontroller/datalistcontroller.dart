import 'package:get/get.dart';

import 'package:task/api/datalistapicall.dart';
import 'package:task/models/datalistmodels.dart';

class DatalListController extends GetxController {
  final DataListApiCall authService = DataListApiCall();
  var dataList = <Data>[].obs;
  @override
  void onInit() {
    collectDataListdata();
    super.onInit();
  }

  void collectDataListdata() async {
    var collectedData = await authService.fetchdata();
    dataList.assignAll(collectedData);
  }
}
