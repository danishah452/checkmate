


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Getorders.dart';
import 'package:flutter_app/models/adduser.dart';
import 'package:flutter_app/models/adduser.dart';
import 'package:flutter_app/server/api_calls.dart';


import '../helper/toast.dart';
import '../models/BaseResponseModel.dart';
import '../models/GetmeasurementModel.dart';



class HomeProvider extends ChangeNotifier {
  bool isloading = false;
  bool isFirstTime = true;
  bool isCalender = false;
  String startDate = '';
  String endDate = '';


  AddUser? adduser = AddUser();
  Getorders? getorder = Getorders();
  GetmeasurementModel? getmeasurement = GetmeasurementModel();

  HomeProvider() {
    // if(isFirstTime){
    //   loadAllData();
    //   isFirstTime = false;
    // }
    // Timer.periodic(Duration(seconds: 10), (_) => !isSearching && !isCalender?loadDetails():{});
    // Timer.periodic(Duration(seconds: 10), (_) => loadNotificationDetails());
  }

  notify() {
    notifyListeners();
  }

// loadAllData() async {
//   await loadCirclesList();
//
//   // loadBlockedList();
//
//   notifyListeners();
// }


GetMeasurement(String phoneno) async {
  getmeasurement = await NetworkHelper.on().getmeasurementAPICall(phoneno);
  notifyListeners();
}



Storeorder(String user_id,String showroom_id,String tryDate,String deliveryDate,String paymentMethod,String advancePaid,String decidedTotal,String address,String customerFabric,String productCode,
    String productLink,String fabricCode,String measurement_id,fabricImages,productImages) async {
  // isloading = true;
  // notifyListeners();

  BaseAPIResponse? response =
      await NetworkHelper.on().storeorderapicall( user_id, showroom_id,tryDate,deliveryDate,paymentMethod,advancePaid,decidedTotal,address,customerFabric,productCode,
          productLink,fabricCode,measurement_id,fabricImages,productImages);
  if (response != null) {
    if (response.status!) {
      // Utils.show("${response.message}");
    } else {
      Utils.show("${response.message}");
    }
  }

  isloading = false;
  notifyListeners();
}



getorders() async {
  getorder = await NetworkHelper.on().getorderAPICall();
  notifyListeners();
}



AddMeasurement(String? user_id, String? categoryName, List pickedAllFiles, List pickedFiles,
    String neck,String biceps,String crossback,
  String halfback,String shoulder,String sleeves,String chest,String waist,String hip,String coatlength, String trouserlength, String thigh, String kurtalength, String shalwarlength, String belly, String shirtlength, String? customerfabric, String? fabriccode, String? productcode, String? productlink) async {

  // isloading = true;
  // notifyListeners();

  BaseAPIResponse? response =
      await NetworkHelper.on().Addmeasurementapicall(
          user_id, categoryName, pickedAllFiles,pickedFiles,neck,biceps,crossback
          , halfback, shoulder,sleeves,chest,waist,hip,coatlength, trouserlength, thigh,  kurtalength,  shalwarlength,  belly,  shirtlength,
          customerfabric, fabriccode,  productcode, productlink
      );
  if (response != null) {
    if (response.status!) {
      // Utils.show("${response.message}");
    } else {
      Utils.show("${response.message}");
    }
  }

  isloading = false;
  notifyListeners();
}




Adduser(String email, String phone, String name ) async {
  // isloading = true;
  // notifyListeners();

  AddUser? addUser =
      await NetworkHelper.on().Adduserapicall(email, phone,name );
  if (addUser != null) {
    if (addUser.status!) {
      // Utils.show("${response.message}");
    } else {
      Utils.show("${addUser.message}");
    }
  }

  isloading = false;
  notifyListeners();
}


}