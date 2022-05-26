import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(
                    top: 5,
                  ),
                  leading: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://ksnmedia.com/wp-content/uploads/2021/08/mpesa.png "),
                    backgroundColor: Colors.transparent,
                  ),
                  title: const Text(
                    'Foodie',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  subtitle: const Text(
                    'A food delivery mobile app that enables Foodie a food delivery company to seemlesly reach out their customers. The app intergrates, authentication,cloud functions and local payment modes intergration',
                    style: TextStyle(fontSize: 11),
                  ),
                  trailing: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {}),
                        child: const Icon(
                          Icons.edit,
                          size: 23,
                        ),
                      ),
                      InkWell(
                        onTap: (() {}),
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
