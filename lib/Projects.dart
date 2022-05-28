import 'package:flutter/material.dart';
import 'package:portfolio_admin/Providers/Projectsprovider.dart';
import 'package:portfolio_admin/Widgets/modalbottomsheet.dart';
import 'package:provider/provider.dart';

import 'Editproject.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = Provider.of<Projectsprovider>(context).projects();

    _deleteproject(String id,String name) async {
      bool isconfirmed = await deleteBottomSheet(context, name);
      if (isconfirmed) {}
    }

    return ListView.builder(
        itemCount: project.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(
                    top: 5,
                  ),
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(project[index].image),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    project[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text(
                    project[index].description,
                    style: const TextStyle(fontSize: 11),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => Editproject(
                                project: project[index],
                              ),
                            ),
                          );
                        }),
                        child: const Icon(
                          Icons.edit,
                          size: 23,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _deleteproject(project[index].id,project[index].name,);
                        },
                        child: const Icon(
                          Icons.delete,
                          size: 23,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                )
              ],
            ),
          );
        });
  }
}
