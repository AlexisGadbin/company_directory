import 'package:company_directory/models/company.dart';
import 'package:flutter/material.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ajouter une entreprise",
            style: TextStyle(color: Colors.white),
          ),
          //Back button
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _textFieldController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez saisir le nom de l'entreprise";
                    }
                    return null;
                  },
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    hintText: "Nom de l'entreprise",
                    prefixIcon: Icon(
                      Icons.business,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context)
                          .pop(Company(_textFieldController.text));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const ContinuousRectangleBorder()),
                  child: const Text("Ajouter",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
}
