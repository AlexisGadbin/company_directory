import 'package:company_directory/models/company.dart';
import 'package:company_directory/repositories/preferences_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {
  final PreferencesRepository preferencesRepository;

  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit(this.preferencesRepository) : super([]);

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    final List<Company> companies = await preferencesRepository.loadCompanies();

    emit(companies);
  }

  /// Méthode pour ajouter une entreprise
  void addCompany(Company company) {
    emit([...state, company]);

    preferencesRepository.saveCompanies(state);
  }
}
