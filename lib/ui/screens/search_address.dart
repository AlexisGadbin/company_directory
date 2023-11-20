import 'package:company_directory/models/address.dart';
import 'package:company_directory/repositories/address_repository.dart';
import 'package:flutter/material.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchAddress> {
  List<Address> _addresses = [
    Address('Place du Ralliement', 'Angers', '49000'),
    Address('19 rue André le Notre', 'Angers', '49066'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chercher entreprise",
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
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Adresse",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
                onChanged: (value) {
                  if (value.trim().length < 3) return;
                  final AddressRepository addressRepository =
                      AddressRepository();
                  addressRepository.fetchAddresses(value).then((addresses) {
                    setState(() {
                      _addresses = addresses;
                    });
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _addresses.length,
                  itemBuilder: (context, index) {
                    final address = _addresses[index];
                    return ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(address.street),
                      subtitle: Text('${address.city} ${address.postcode}'),
                      onTap: () {
                        Navigator.of(context).pop(address);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
