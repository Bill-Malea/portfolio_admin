// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';

import 'Widgets/modalbottomsheet.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              createBottomSheet(
                'I would like you to create my app',
                context,
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                      top: 5,
                    ),
                    leading: CircleAvatar(
                      child: const Text('J'),
                      radius: 20.0,
                      backgroundColor: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                    title: const Text(
                      'Joe',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: const Text(
                      'I would like you to create my app',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  )
                ],
              ),
            ),
          );
        });
  }
}
