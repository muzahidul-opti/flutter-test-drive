import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/form_data.dart';
import 'package:flutter_application_1/widgets/form_result.dart';

class CreateArticle extends StatefulWidget {
  const CreateArticle({super.key});

  @override
  State<CreateArticle> createState() => _CreateArticleState();
}

class _CreateArticleState extends State<CreateArticle> {
  final _formKey = GlobalKey<FormState>();
  FormData formData = FormData();

  String? validateEmail(String? value) {
    const Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern as String);
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration:  const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Please enter title' : null,
                onSaved: (newValue) => formData.title = newValue,
              ),
              SwitchListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Is Breaking News'),
                value: formData.isBreaking!, 
                onChanged: (newValue) => setState(() => formData.isBreaking = newValue),
              ),
              TextFormField(
                decoration:  const InputDecoration(labelText: 'Image Url'),
                validator: (value) => Uri.parse(value!).isAbsolute 
                ? 'Please enter valid url' : null,
                onSaved: (newValue) => formData.imageUrl = newValue,
              ),
              TextFormField(
                decoration:  const InputDecoration(labelText: 'Content'),
                maxLines: 3,
                validator: (value) => value!.isEmpty || value!.length < 10 ? 'Content too short' : null,
                onSaved: (newValue) => formData.content = newValue,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text("Category"),
              ),
              Column(
                children: [
                  RadioListTile<int>(
                    title: const Text('Sport'),
                    value: 1,
                    groupValue: formData.category,
                    onChanged: (value) {
                      setState(() {
                        formData.category = value;
                      });
                    }
                  ),
                  RadioListTile<int>(
                    title: const Text('Entertainment'),
                    value: 2,
                    groupValue: formData.category,
                    onChanged: (value) {
                      setState(() {
                        formData.category = value;
                      });
                    }
                  )
                ],
              ),
              TextFormField(
                decoration:  const InputDecoration(labelText: 'Your Email'),
                validator: (value) => value!.isEmpty ? 'Please enter title' : null,
                onSaved: (newValue) => formData.email = newValue,
              ),
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState!;
                  if (form.validate()) {
                    form.save(); 
                    form.reset();
                    _showResultDialog(context);
                  }
                  FocusScope.of(context).unfocus();
                }, 
                child: const Text('Save')
              )
            ],
          ),
        ),
      )
    );
  }

  Future<void> _showResultDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FormResult(data:formData),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('OK')
            )
          ],
        );
      }
    ).then((value) {
        setState(() {
          formData.isBreaking = false;
          formData.category = null;
        });
      });
  }
}