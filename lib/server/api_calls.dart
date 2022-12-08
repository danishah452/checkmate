import 'dart:collection';
import 'dart:convert';
import 'dart:io';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Getorders.dart';
import 'package:flutter_app/models/adduser.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
// import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/BaseResponseModel.dart';
import '../models/GetmeasurementModel.dart';
import '../models/loginResponseModel.dart';
import '../helper/toast.dart';



const noInternetMsg = 'You are not connected to Internet';

class NetworkHelper {
  NetworkHelper._internal();

  static final NetworkHelper _instance = NetworkHelper._internal();

  static NetworkHelper on() {
    return _instance;
  }

  // String baseUrl = "http://192.168.1.24:8080/api/";
  String baseUrl = "https://store.checkmateoutfit.com/api/showroom/";
  // String baseUrl = "http://192.168.18.47:8080/api/";
  // String baseUrl = "http://192.168.1.21:8080/api/";
  // String baseUrl = "https://clearspirit.myiqmenu.com/api/";


  String login = "login";
  String addmeasurement = "add-measurement";
  String addstore = "store-order";
  String adduser = "add-user";
  String getmeasurements = "get-measurements";
  String getorders = "get-orders";





  Future<GetmeasurementModel?> getmeasurementAPICall(String phoneno) async {
    http.Response response;

    response = await getRequest(
      getmeasurements + "/$phoneno",
      bearerToken: true,
    );

    print("response ${response.body}");

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status']) {
        var pref = await SharedPreferences.getInstance();
        // await pref.setString("user_details", response.body);
        return GetmeasurementModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        Utils.show(jsonDecode(response.body)['message']);
        return null;
      }
    } else {
      if (response.statusCode == 1000) {
        Utils.show('No Internet');
        return null;
      } else {
        // Utils.show('Server error');
        return null;
      }
    }
  }




  Future<Getorders?> getorderAPICall() async {
    http.Response response;

    response = await getRequest(
      getorders,
      bearerToken: true,
    );

    print("response ${response.body}");

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status']) {
        var pref = await SharedPreferences.getInstance();
        // await pref.setString("user_details", response.body);
        return Getorders.fromJson(
          jsonDecode(response.body),
        );
      } else {
        Utils.show(jsonDecode(response.body)['message']);
        return null;
      }
    } else {
      if (response.statusCode == 1000) {
        Utils.show('No Internet');
        return null;
      } else {
        // Utils.show('Server error');
        return null;
      }
    }
  }






  Future<BaseAPIResponse?> Addmeasurementapicall(String? user_id, String? categoryName, List pickedAllFiles, List pickedFiles,
      String neck,String biceps,String crossback,
      String halfback,String shoulder,String sleeves,String chest,String waist,String hip,String coatlength,String trouserlength, String thigh, String kurtalength, String shalwarlength, String belly, String shirtlength,
      String? customerfabric, String? fabriccode, String? productcode, String? productlink
      ) async {

    http.Response response;


    categoryName=="Sherwani"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "biceps":biceps,
          "crossback":crossback,
          "halfback":halfback,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "waist":waist,
          "chest":chest,
          "hip":hip,
          "coatlength":coatlength,

        }
        )},

      bearerToken: true,
    ):
    categoryName=="Kameez Shalwar"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "waist":waist,
          "chest":chest,
          "hip":hip,
          "kurtalength":kurtalength,
          "shalwarlength":shalwarlength,

        }
        ) },

      bearerToken: true,
    ): categoryName=="Shalwar"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({

          "waist":waist,

          "hip":hip,

          "shalwarlength":shalwarlength,

        }
        ) },

      bearerToken: true,
    ): categoryName=="Kurta Trouuser"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "waist":waist,
          "chest":chest,
          "hip":hip,
          "kurtalength":kurtalength,
          "trouserlength":trouserlength,

        }
        )},

      bearerToken: true,
    ):

    categoryName=="Prince Coat"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "biceps":biceps,
          "crossback":crossback,
          "halfback":halfback,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "waist":waist,
          "chest":chest,
          "hip":hip,
          "coatlength":coatlength,

        }
        )},

      bearerToken: true,
    ):

    categoryName=="Pant"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({

          "waist":waist,
          "thigh":thigh,
          "hip":hip,
          "trouserlength":trouserlength,

        }
        )},

      bearerToken: true,
    ):
    categoryName=="Waistcoat" || categoryName=="Awami Waistcoat"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "shoulder":shoulder,
          "belly":belly,
          "chest":chest,
          "hip":hip,
          "coatlength":coatlength,

        }
        ) },

      bearerToken: true,
    ):
    categoryName=="Kurta Trouser" || categoryName=="Event Kurta Trouser"?

    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "chest":chest,
          "waist":waist,
          "hip":hip,
          "kurtalength":kurtalength,
          "trouserlength":trouserlength,

        }
        )},

      bearerToken: true,
    ):
    categoryName=="Shirt"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "chest":chest,
          "waist":waist,
          "shirtlength":shirtlength,

        }
        ) },

      bearerToken: true,
    ):
    categoryName=="Kurta"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "chest":chest,
          "waist":waist,
          "hip":hip,
          "kurtalength":kurtalength,

        }
        )},

      bearerToken: true,
    ):
    categoryName=="Trouser"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "waist":waist,
          "hip":hip,
          "trouserlength":trouserlength,

        }
        ) },

      bearerToken: true,
    ):
    categoryName=="Pant Coat" || categoryName=="Pant Coat and Waistcoat"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "biceps":biceps,
          "crossback":crossback,
          "halfback":halfback,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "waist":waist,
          "chest":chest,
          "hip":hip,
          "coatlength":coatlength,
          "trouserlength":trouserlength,


        }
        )},

      bearerToken: true,
    ):
    categoryName=="Pant Coat" || categoryName=="Pant Coat and Waistcoat"?
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "biceps":biceps,
          "crossback":crossback,
          "halfback":halfback,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "waist":waist,
          "chest":chest,
          "hip":hip,
          "coatlength":coatlength,
          "trouserlength":trouserlength,


        }
        )},

      bearerToken: true,
    ):
    response = await postRequest(
      addmeasurement,
      {

        "user_id": user_id,
        "category": categoryName,
        if (pickedAllFiles.isNotEmpty) "fabricImages": json.encode(pickedAllFiles),
        if (pickedFiles.isNotEmpty) "productImages": json.encode(pickedFiles),
        if (customerfabric != null) "customerFabric": customerfabric,
        if (fabriccode !=  "" ) "fabricCode": fabriccode,
        if (productcode !=  "") "productCode": productcode,
        if (productlink != "") "productLink": productlink,
        "measurement":json.encode({
          "neck":neck,
          "biceps":biceps,
          "crossback":crossback,
          "halfback":halfback,
          "shoulder":shoulder,
          "sleeves":sleeves,
          "waist":waist,
          "chest":chest,
          "hip":hip,
          "coatlength":coatlength,
          "trouserlength":trouserlength,


        }
        )   },

      bearerToken: true,
    );




    print("response ${response.body}");

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status']) {
        return BaseAPIResponse.fromJson(
          jsonDecode(response.body),
        );
      } else {
        Utils.show(jsonDecode(response.body)['message']);
        return null;
      }
    } else {
      if (response.statusCode == 1000) {
        Utils.show('No Internet');
        return null;
      } else {
        // Utils.show('Server error');
        return null;
      }
    }
  }






  Future<BaseAPIResponse?> storeorderapicall(
      String user_id,tryDate,deliveryDate,paymentMethod,advancePaid,decidedTotal,measurement_id,
      ) async {
    http.Response response;

    response = await postRequest(
      addstore,
      {
        "user_id": user_id,
        // "showroom_id":showroom_id,
        "tryDate":tryDate,
        "deliveryDate":deliveryDate,
        "paymentMethod":paymentMethod,
        "advancePaid":advancePaid,
        "decidedTotal": decidedTotal,
        "address":"Johar town",

        "measurement_id":14,

        // "category": category,
        // "measurement":measurement
      },
      bearerToken: true,
    );

    print("response ${response.body}");

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status']) {
        return BaseAPIResponse.fromJson(
          jsonDecode(response.body),
        );
      } else {
        Utils.show(jsonDecode(response.body)['message']);
        return null;
      }
    } else {
      if (response.statusCode == 1000) {
        Utils.show('No Internet');
        return null;
      } else {
        // Utils.show('Server error');
        return null;
      }
    }
  }





  Future<AddUser?> Adduserapicall(
      String email, String phone, String name) async {
    http.Response response;

    response = await postRequest(
      adduser,
      {
        "email": email,
        "phone": phone,
        "name":name
      },
      bearerToken: true,
    );

    print("response ${response.body}");

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status']) {
        var pref = await SharedPreferences.getInstance();
        var id =jsonDecode(response.body)['data']['id'];
        await pref.setString("id", id.toString());
        return AddUser.fromJson(
          jsonDecode(response.body),
        );
      } else {
        Utils.show(jsonDecode(response.body)['message']);
        return null;
      }
    } else {
      if (response.statusCode == 1000) {
        Utils.show('No Internet');
        return null;
      } else {
        // Utils.show('Server error');
        return null;
      }
    }
  }





  Future<LoginSignupResponseModel?> userLogin(
      String email,
      String password,
      String deviceToken,
      ) async {
    http.Response response;

    response = await postRequest(
      login,
      {
        'email': email,
        'password': password,
        'deviceKey': deviceToken,
      },
    );

    print("response ${response.body}");
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status']) {
        var pref = await SharedPreferences.getInstance();
        await pref.setString("user", response.body);
        return LoginSignupResponseModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        Utils.show(jsonDecode(response.body)['message']);
        return null;
      }
    } else {
      if (response.statusCode == 1000) {
        Utils.show('No Internet');
        return null;
      } else {
        // Utils.show('Server error');
        return null;
      }
    }
  }





















  postRequest(String endPoint, Map? requestBody,
      {bool bearerToken = false, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response? response;
      if (!noBaseUrl) {
        debugPrint('URL: ${baseUrl}$endPoint');
      } else {
        debugPrint('URL: $endPoint');
      }
      debugPrint('body: $requestBody');

      var pref = await SharedPreferences.getInstance();
      var accessToken = pref.getString("access_token");

      // print("ACCESS TOKEN $accessToken");
      var headers = {
        HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
      };

      if (bearerToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      debugPrint("Headers: $headers");
      try {
        if (!noBaseUrl) {
          response = await post(Uri.parse('${baseUrl}$endPoint'),
              body: requestBody, headers: headers);
        } else {
          response = await post(Uri.parse(endPoint),
              body: requestBody, headers: headers);
        }
        return response;
      } catch (e) {
        debugPrint(e.toString());
        Utils.show(e.toString());
        Response? response = Response("", 500);
        return response;
      }
    } else {
      Response? response = Response("", 1000);
      return response;
    }
  }

  postMultipleRequest(
      String endpoint, Map<String, String>? requestBody, File? video,
      {bool bearerToken = false, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response? response;
      if (!noBaseUrl) {
        debugPrint('URL: ${baseUrl}$endpoint');
      } else {
        debugPrint('URL: $endpoint');
      }
      debugPrint('body: $requestBody');

      var pref = await SharedPreferences.getInstance();
      var accessToken = pref.getString("access_token");

      print("ACCESS TOKEN $accessToken");
      var headers = {
        HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
      };

      if (bearerToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      debugPrint("Headers: $headers");
      try {
        if (!noBaseUrl) {
          var request = await http.MultipartRequest(
              "POST", Uri.parse("${baseUrl}$endpoint"));
          request.headers.addAll(headers);
          request.files
              .add(await http.MultipartFile.fromPath("videoFile", video!.path));
          request.fields.addAll(requestBody!);
          var responsed = await request.send();

          response = await http.Response.fromStream(responsed);
          // response = await post(Uri.parse('${baseUrl}$endpoint'),
          //     body: requestBody, headers: headers);
        } else {
          response = await post(Uri.parse(endpoint),
              body: requestBody, headers: headers);
        }
        return response;
      } catch (e) {
        debugPrint(e.toString());
        Utils.show(e.toString());
        Response? response = Response("", 500);
        return response;
      }
    } else {
      Response? response = Response("", 1000);
      return response;
    }
  }

  putRequest(String endPoint, Map? requestBody,
      {bool bearerToken = false, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response? response;
      if (!noBaseUrl) {
        debugPrint('URL: ${baseUrl}$endPoint');
      } else {
        debugPrint('URL: $endPoint');
      }
      debugPrint('body: $requestBody');

      var pref = await SharedPreferences.getInstance();
      var accessToken = pref.getString("access_token");

      print("ACCESS TOKEN $accessToken");
      var headers = {
        HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
      };

      if (bearerToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      debugPrint("Headers: $headers");
      try {
        if (!noBaseUrl) {
          response = await put(Uri.parse('${baseUrl}$endPoint'),
              body: requestBody, headers: headers);
        } else {
          response = await put(Uri.parse(endPoint),
              body: requestBody, headers: headers);
        }
        return response;
      } catch (e) {
        debugPrint(e.toString());
        Utils.show(e.toString());
        Response? response = Response("", 500);
        return response;
      }
    } else {
      Response? response = Response("", 1000);
      return response;
    }
  }

  getRequest(String endPoint,
      {bool bearerToken = false, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response? response;
      if (!noBaseUrl) {
        debugPrint('URL: ${baseUrl}$endPoint');
      } else {
        debugPrint('URL: $endPoint');
      }
      var pref = await SharedPreferences.getInstance();
      var accessToken = pref.getString("access_token");

      print("ACCESS TOKEN $accessToken");
      var headers = {
        HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
      };

      if (bearerToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      debugPrint("Headers: $headers");
      try {
        if (!noBaseUrl) {
          response =
          await get(Uri.parse('${baseUrl}$endPoint'), headers: headers);
          // jsonDecode(response.body)['message'];
          return response;
        } else {
          response = await get(Uri.parse(endPoint), headers: headers);
          return response;
        }
      } catch (e) {
        debugPrint(e.toString());
        Utils.show(e.toString());
      }
      debugPrint('Response: ${response?.statusCode} ${response?.body}');
      return response;
    } else {
      Response? response = Response("", 1000);
      throw response;
    }
  }

  deleteRequest(String endPoint,
      {bool bearerToken = false, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response? response;
      if (!noBaseUrl) {
        debugPrint('URL: ${baseUrl}$endPoint');
      } else {
        debugPrint('URL: $endPoint');
      }
      var pref = await SharedPreferences.getInstance();
      var accessToken = pref.getString("access_token");

      print("ACCESS TOKEN $accessToken");
      var headers = {
        HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
      };

      if (bearerToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      debugPrint("Headers: $headers");
      try {
        if (!noBaseUrl) {
          response =
          await delete(Uri.parse('${baseUrl}$endPoint'), headers: headers);
          return response;
        } else {
          response = await delete(Uri.parse(endPoint), headers: headers);
          return response;
        }
      } catch (e) {
        debugPrint(e.toString());
        Utils.show(e.toString());
      }
      debugPrint('Response: ${response?.statusCode} ${response?.body}');
      return response;
    } else {
      Response? response = Response("", 1000);
      throw response;
    }
  }

  Future<bool> isNetworkAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
