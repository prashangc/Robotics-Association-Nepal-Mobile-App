import 'dart:convert';

import 'package:app/model/imageSliderModel.dart';
import 'package:app/model/screenTitle_model.dart';
import 'package:app/model/statsDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class DetailsState with ChangeNotifier {
  LocalStorage storage = LocalStorage("usertoken");
  List<ScreenTitle>? _screenTitle;
  List<ImageSliderModel>? _imageSlider;
  List? _serviceTitle;
  List<StatsDetailsModel>? _statsDetails;

  List? data;
  List imagesUrl = [];
  Future<List> getImageSliderData() async {
    try {
      String url = 'http://10.0.2.2:8000/api/images/';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // Future<void> getImageByProvider() async {
  //   try {
  //     String url = 'http://127.0.0.1:8000/api/images';
  //     http.Response response = await http.get(Uri.parse(url));
  //     var fetchData = json.decode(response.body) as List;
  //     data = fetchData;
  //     data?.forEach((element) {
  //       imagesUrl.add(element['url']);
  //     });
  //     print(data);
  //     notifyListeners();
  //   } catch (e) {
  //     print("error getImageErrorInServices");
  //     print(e);
  //   }
  // }

  Future<void> getScreenTitleData() async {
    try {
      String url = 'http://10.0.2.2:8000/api/titles/';
      http.Response response = await http.get(Uri.parse(url));
      var data = json.decode(response.body) as List;
      List<ScreenTitle> temp = [];
      for (var element in data) {
        ScreenTitle screenTitle = ScreenTitle.fromJson(element);
        temp.add(screenTitle);
      }
      _screenTitle = temp;
      notifyListeners();
    } catch (e) {
      print("error getSreenTitleData");
      print(e);
    }
  }

  Future<List> getAllScreenTitles() async {
    try {
      String url = 'http://10.0.2.2:8000/api/titles/';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getAllServiceTitles() async {
    try {
      String url = 'http://10.0.2.2:8000/api/services/';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getAllStatsDetails() async {
    try {
      String url = 'http://10.0.2.2:8000/api/stats/';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> loginNow(String username, String password) async {
    try {
      String url = 'http://10.0.2.2:8000/api/login/';
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            'username': username,
            'password': password,
          }));
      var data = json.decode(response.body) as Map;
      // print(data);
      if (data.containsKey('token')) {
        // print(data['token']);
        storage.setItem('token', data['token']);
        // print(storage.getItem('token'));
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      print("error loginNow");
      return true;
    }
  }

  Future<bool> registerNow(String username, String email, String password,
      String confirmPassword) async {
    try {
      String url = 'http://10.0.2.2:8000/api/register/';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "username": username,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );
      var data = json.decode(response.body) as Map;

      return data['error'];
    } catch (e) {
      print("error register");
      print(e);
      return true;
    }
  }

  List<ScreenTitle>? get screenTitle {
    return [...?_screenTitle];
  }

  List<ImageSliderModel>? get imageSlider {
    return [...?_imageSlider];
  }

  List? get serviceTitle {
    return [...?_serviceTitle];
  }

  List<StatsDetailsModel>? get statsDetails {
    return [...?_statsDetails];
  }
}
