import 'dart:convert';

import 'package:app/model/ProgramModel.dart';
import 'package:app/model/imageSliderModel.dart';
import 'package:app/model/ServicesModel.dart';
import 'package:app/model/StatsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../model/ProjectsModel.dart';

class DetailsState with ChangeNotifier {
  LocalStorage storage = LocalStorage("usertoken");
  late List<ServicesModel> _services;
  late List<ProjectsModel> _projects;
  late List<ProgramsModel> _programs;
  List<ImageSliderModel>? _imageSlider;
  List<StatsModel>? _statsDetails;

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

  Future<bool> getAllServiceTitles() async {
    try {
      String url = 'http://10.0.2.2:8000/api/services/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      var data = json.decode(response.body) as List;
      List<ServicesModel> temp = [];
      for (var element in data) {
        ServicesModel services = ServicesModel.fromJson(element);
        temp.add(services);
      }
      _services = temp;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getAllProjectTitles() async {
    try {
      String url = 'http://10.0.2.2:8000/api/projects/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      var data = json.decode(response.body) as List;
      List<ProjectsModel> temp = [];
      for (var element in data) {
        ProjectsModel projects = ProjectsModel.fromJson(element);
        temp.add(projects);
      }
      _projects = temp;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getAllProgramsTitles() async {
    try {
      String url = 'http://10.0.2.2:8000/api/programs/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      var data = json.decode(response.body) as List;
      List<ProgramsModel> temp = [];
      for (var element in data) {
        ProgramsModel programs = ProgramsModel.fromJson(element);
        temp.add(programs);
      }
      _programs = temp;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getAllStatsDetails() async {
    try {
      String url = 'http://10.0.2.2:8000/api/stats/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      var data = json.decode(response.body) as List;
      List<StatsModel> temp = [];
      for (var element in data) {
        StatsModel stats = StatsModel.fromJson(element);
        temp.add(stats);
      }
      _statsDetails = temp;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
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

  List<ImageSliderModel>? get imageSlider {
    return [...?_imageSlider];
  }

  List<ServicesModel>? get serviceTitle {
    return [..._services];
  }

  List<ProjectsModel>? get projectTitle {
    return [..._projects];
  }

  List<ProgramsModel>? get programTitle {
    return [..._programs];
  }

  List<StatsModel>? get statsDetails {
    return [...?_statsDetails];
  }
}
