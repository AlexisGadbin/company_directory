import 'package:company_directory/models/address.dart';
import 'package:company_directory/models/company.dart';
import 'package:company_directory/router.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    Company("Entreprise 1", Address("Rue 1", "Ville 1", "Code postal 1")),
    Company("Entreprise 2", Address("Rue 2", "Ville 2", "Code postal 2")),
    Company("Entreprise 3", Address("Rue 3", "Ville 3", "Code postal 3")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Liste des entreprises",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _companies.length,
          itemBuilder: (context, index) {
            final company = _companies[index];
            return ListTile(
              title: Text(company.name),
              subtitle:
                  Text("${company.address.city} ${company.address.postcode}"),
              onTap: () {},
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Company? company = await Navigator.of(context)
              .pushNamed(AppRouter.addCompanyPage) as Company?;
          if (company != null) {
            setState(() {
              _companies.add(company);
            });
          }
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
