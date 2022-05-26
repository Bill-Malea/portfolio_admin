// ignore: file_names
import 'package:flutter/material.dart';
import 'package:portfolio_admin/FormInput.dart';

class AddProjects extends StatelessWidget {
  const AddProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FormInputFieldWithIcon(
              isDescript: false,
              labelText: 'Name',
              validator: (tring) {
                return null;
              },
              onSaved: (cffff) {},
            ),
            const SizedBox(
              height: 10,
            ),
            FormInputFieldWithIcon(
              isDescript: false,
              labelText: 'Image',
              validator: (tring) {
                return null;
              },
              onSaved: (cffff) {},
            ),
            const SizedBox(
              height: 10,
            ),
            FormInputFieldWithIcon(
              isDescript: false,
              labelText: 'Link',
              validator: (tring) {
                return null;
              },
              onSaved: (cffff) {},
            ),
            const SizedBox(
              height: 10,
            ),
            FormInputFieldWithIcon(
              labelText: 'Description',
              validator: (tring) {
                return null;
              },
              onSaved: (cffff) {},
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
                  onPressed: () {},
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
    );
  }
}
