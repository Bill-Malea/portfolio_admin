import 'package:flutter/material.dart';

import 'AddProject.dart';
import 'Models/ProjectsModel.dart';

class Editproject extends StatefulWidget {
  final Project project;
  const Editproject({Key? key, required this.project}) : super(key: key);

  @override
  _EditprojectState createState() => _EditprojectState();
}

class _EditprojectState extends State<Editproject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 15,
              )),
          centerTitle: true,
          title: const Text(
            "Edit Project",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: AddProjects(
          project: widget.project,
        ));
  }
}
