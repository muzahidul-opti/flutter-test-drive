

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/form_data.dart';

class FormResult extends StatelessWidget {
  final FormData? data;

  const FormResult({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final result = data!.toJson();
    return SizedBox(
      width: 300,
      height: 300,
      child: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          final key = result.keys.elementAt(index);
          final value = result.values.elementAt(index);
          return Column(
            children: [
              ListTile(
                title: Text(key),
                 subtitle: Text(value.toString()),
              ),
              const Divider(
                height: 2.0,
              )
          ]);
        }
      ),
    );
  }
}