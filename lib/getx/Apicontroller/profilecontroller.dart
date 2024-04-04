import 'package:get/get.dart';

import 'package:task/api/profileapicall.dart';

import 'package:task/models/profilrmodel.dart';

class ProfileController extends GetxController {
  final ProfileApiCall authService = ProfileApiCall();
  var dataList = <Datum>[].obs;
  @override
  void onInit() {
    collectProfiledata();
    super.onInit();
  }

  void collectProfiledata() async {
    var collectedData = await authService.fetchdata();
    dataList.addAll(collectedData.data);
  }
}
