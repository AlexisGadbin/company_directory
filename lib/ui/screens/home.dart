import 'package:company_directory/models/company.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    const Company(0, "Entreprise 1"),
    const Company(1, "Entreprise 2"),
    const Company(2, "Entreprise 3"),
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
            return ListTile(
              title: Text(_companies[index].name),
              onTap: () {},
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Company? company =
              await Navigator.of(context).pushNamed('/add-company') as Company?;
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
