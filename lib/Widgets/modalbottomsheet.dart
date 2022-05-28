import 'package:flutter/material.dart';

createBottomSheet(
  String message,
  BuildContext context,
) async {
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
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
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

Future<bool> deleteBottomSheet(
  BuildContext context,
  String name,
) async {
  var confirm;
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
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              margin: const EdgeInsets.all(10),
              height: 150,
              child: Column(
                children: [
                  const Text(
                    'Are you sure you want to delete ',
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
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        onPressed: () {
                          setState(() {
                            confirm = true;
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        onPressed: () {
                          setState(() {
                            confirm = false;
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      });

  return confirm;
}
