// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_admin/FormInput.dart';
import 'package:portfolio_admin/Providers/Projectsprovider.dart';
import 'package:provider/provider.dart';

import 'Models/ProjectsModel.dart';

class AddProjects extends StatefulWidget {
  final Project project;

  const AddProjects({Key? key, required this.project}) : super(key: key);

  @override
  State<AddProjects> createState() => _AddProjectsState();
}

class _AddProjectsState extends State<AddProjects> {
  final _key = GlobalKey<FormState>();
  var _image;
  var _description;
  var _link;
  var _name;
  @override
  Widget build(BuildContext context) {
    upload() {
      final isValid = _key.currentState!.validate();
      var newproject = Project(
        id: '',
        image: _image,
        description: _description,
        link: _link,
        name: _name,
      );
      if (kDebugMode) {
        print(isValid);
      }
      if (isValid) {
        _key.currentState!.save();
        Provider.of<Projectsprovider>(context, listen: false)
            .addproject(newproject);
      } else if (isValid && widget.project.id.isNotEmpty) {
        var editproject = Project(
          id: widget.project.id,
          image: _image,
          description: _description,
          link: _link,
          name: _name,
        );
        _key.currentState!.save();
        Provider.of<Projectsprovider>(context, listen: false)
            .addproject(editproject);
      }
    }

    var id = widget.project.id;

    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              FormInputFieldWithIcon(
                initialvalue: id.isEmpty ? '' : widget.project.name,
                isDescript: false,
                labelText: 'Name',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _name = val!;
                    if (kDebugMode) {
                      print(val);
                    }
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormInputFieldWithIcon(
                initialvalue: id.isEmpty ? '' : widget.project.image,
                isDescript: false,
                labelText: 'Image',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _image = val!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormInputFieldWithIcon(
                initialvalue: id.isEmpty ? '' : widget.project.link,
                isDescript: false,
                labelText: 'Link',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _link = val!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormInputFieldWithIcon(
                initialvalue: id.isEmpty ? '' : widget.project.description,
                labelText: 'Description',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _description = val!;
                  });
                },
                isDescript: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    onPressed: upload,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text(
                      'Upload',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
