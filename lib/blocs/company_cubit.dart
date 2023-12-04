import 'package:company_directory/models/address.dart';
import 'package:company_directory/models/company.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {
  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit() : super([]);

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    emit([
      Company('Entreprise 1', Address('street', 'city', 'postcode')),
      Company('Entreprise 2', Address('street', 'city', 'postcode')),
      Company('Entreprise 3', Address('street', 'city', 'postcode')),
    ]);
  }

  /// Méthode pour ajouter une entreprise
  void addCompany(Company company) {
    emit([...state, company]);
  }
}
