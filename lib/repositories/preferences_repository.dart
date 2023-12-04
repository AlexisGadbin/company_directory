import 'dart:convert';

import 'package:company_directory/models/company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  Future<void> saveCompanies(List<Company> companies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Company company in companies) {
      listJson.add(jsonEncode(company.toJson()));
    }
    prefs.setStringList('companies', listJson);
  }

  Future<List<Company>> loadCompanies() async {
    // A compléter

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = prefs.getStringList('companies') ?? [];
    final List<Company> companies = [];
    for (final String json in listJson) {
      companies.add(Company.fromJson(jsonDecode(json)));
    }

    return companies;
  }
}
