import 'package:company_directory/ui/screens/add_company.dart';
import 'package:company_directory/ui/screens/home.dart';
import 'package:company_directory/ui/screens/search_address.dart';

class AppRouter {
  static const String homePage = '/home';
  static const String addCompanyPage = '/add-company';
  static const String searchAddress = '/search-address';

  static final routes = {
    homePage: (context) => const Home(),
    addCompanyPage: (context) => AddCompany(),
    searchAddress: (context) => const SearchAddress(),
  };
}
