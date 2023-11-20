import 'package:company_directory/models/address.dart';
import 'package:company_directory/models/company.dart';
import 'package:company_directory/router.dart';
import 'package:flutter/material.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  Address? _address;

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
                TextField(
                  readOnly: true,
                  controller: _addressController,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    hintText: "Addresse de l'entreprise",
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                  ),
                  onTap: () async {
                    _address = await Navigator.of(context)
                        .pushNamed(AppRouter.searchAddress) as Address?;

                    if (_address != null) {
                      _addressController.text =
                          "${_address!.city}, ${_address!.postcode}";
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop(Company(
                          _textFieldController.text,
                          _address != null ? _address! : Address("", "", "")));
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
