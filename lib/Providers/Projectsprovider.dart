import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio_admin/Models/ProjectsModel.dart';
import 'package:http/http.dart' as http;

class Projectsprovider extends ChangeNotifier {
  final List<Project> _projects = [];

  List<Project> projects() {
    return [..._projects];
  }

  loadprojects() async {
    final url = Uri.parse('');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body)
            as Map<String, dynamic>;
        var projects = [];
        data.forEach((id, _data) {
          projects.add(Project(
            description: _data["description"],
            id: id,
            image: _data["image"],
            link: _data["link"],
            name: _data[" name"],
          ));
        });
      } else {
        Fluttertoast.showToast(
            msg: response.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on SocketException {
      Fluttertoast.showToast(
          msg:
              "Check Your Internet Connection and Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  addproject(Project project) async {
    final url = Uri.parse('');
    var data = {
      "Name": project.name,
      "Image": project.image,
      "Link": project.link,
      "Description": project.description,
    };
    try {
      var response =
          await http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: response.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on SocketException {
      Fluttertoast.showToast(
          msg:
              "Check Your Internet Connection and Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  editproject(Project project) async {
    final url = Uri.parse('http.yoururl.example/Projects');
    var data = {
      "Name": project.name,
      "Image": project.image,
      "Link": project.link,
      "Description": project.description,
    };
    try {
      var response =
          await http.patch(url, body: jsonEncode(data));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: response.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on SocketException {
      Fluttertoast.showToast(
          msg:
              "Check Your Internet Connection and Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  deleteproject(Project project) async {
    final url = Uri.parse('http.yoururl.example/Projects');
    var data = {
      "Name": project.name,
      "Image": project.image,
      "Link": project.link,
      "Description": project.description,
    };
    try {
      var response =
          await http.delete(url, body: jsonEncode(data));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: response.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on SocketException {
      Fluttertoast.showToast(
          msg:
              "Check Your Internet Connection and Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
