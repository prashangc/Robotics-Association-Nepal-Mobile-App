import 'dart:convert';

import 'package:app/model/MembersModel.dart';
import 'package:app/model/ProgramModel.dart';
import 'package:app/model/ImageSliderModel.dart';
import 'package:app/model/ServicesModel.dart';
import 'package:app/model/StatsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../model/ProjectsModel.dart';
import '../model/YearModel.dart';

class DetailsState with ChangeNotifier {
  LocalStorage storage = LocalStorage("usertoken");
  List<ServicesModel>? _services;
  List<ProjectsModel>? _projects;
  List<ProgramsModel>? _programs;

  List<ImageSliderModel>? _imageSlider;
  List<MembersModel>? _members;
  List<YearModel>? _years;

  List<StatsModel>? _statsDetails;
  // String baseUrl = 'http://10.0.2.2:8000/';
  String baseUrl = 'http://mobileapplication.ran.org.np/';
  // String baseUrl = 'http://192.168.1.88:8000/';

  List? data;
  List imagesUrl = [];

  var titleServices, imageServices;

  Future<List> getImageSliderData() async {
    try {
      String url = '${baseUrl}api/images/';
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
      String url = '${baseUrl}api/titles/';
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
      String url = '${baseUrl}Services/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token f5f49f7acc36c89441899028e49f3fa71c365860",
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
      var token = storage.getItem('token');
      String url = '${baseUrl}Projects/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token f5f49f7acc36c89441899028e49f3fa71c365860",
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
      String url = '${baseUrl}Programs/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token f5f49f7acc36c89441899028e49f3fa71c365860",
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
      String url = '${baseUrl}api/stats/';
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

  Future<bool> getAllMembersDetails() async {
    try {
      String url = '${baseUrl}Membership/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token f5f49f7acc36c89441899028e49f3fa71c365860",
        },
      );
      var data = json.decode(response.body) as List;
      List<MembersModel> temp = [];
      for (var element in data) {
        MembersModel members = MembersModel.fromJson(element);
        temp.add(members);
      }
      _members = temp;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getAllYearsDetails() async {
    try {
      String url = '${baseUrl}api/year/';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      var data = json.decode(response.body) as List;
      List<YearModel> temp = [];
      for (var element in data) {
        YearModel years = YearModel.fromJson(element);
        temp.add(years);
      }
      _years = temp;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginNow(String username, String password) async {
    try {
      String url = '${baseUrl}api/login/';
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
      String url = '${baseUrl}api/register/';
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
    return [...?_services];
  }

  List<ProjectsModel>? get projectTitle {
    return [...?_projects];
  }

  List<ProgramsModel>? get programTitle {
    return [...?_programs];
  }

  List<StatsModel>? get statsDetails {
    return [...?_statsDetails];
  }

  List<MembersModel>? get membersDetails {
    return [...?_members];
  }

  List<YearModel>? get yearDetails {
    return [...?_years];
  }

  MembersModel? singlePost(int membershipID) {
    return _members
        ?.firstWhere((element) => element.membershipID == membershipID);
  }

  ProjectsModel? projectsData(int projectID) {
    return _projects?.firstWhere((element) => element.projectID == projectID);
  }

  ServicesModel? servicesData(int servicesID) {
    return _services?.firstWhere((element) => element.servicesID == servicesID);
  }

  ProgramsModel? programsData(int programID) {
    return _programs?.firstWhere((element) => element.programID == programID);
  }

  void ServiceTitle(var title) {
    titleServices = title;
  }

  void ServiceImage(var image) {
    imageServices = image;
  }
}
