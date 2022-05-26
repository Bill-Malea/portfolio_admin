// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _createBottomSheet(String message) async {
      await showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(
                      20,
                    ),
                  )),
              child: StatefulBuilder(builder:
                  (BuildContext context,
                      StateSetter setState) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 250,
                  child: Column(
                    children: [
                      const Text(
                        'Message ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        message,
                      ),
                    ],
                  ),
                );
              }),
            );
          });
    }

    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _createBottomSheet(
                  'I would like you to create my app');
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
                      backgroundColor: Colors.primaries[
                          Random().nextInt(
                              Colors.primaries.length)],
                    ),
                    title: const Text(
                      'Joe',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
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
