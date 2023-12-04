import 'package:company_directory/models/address.dart';

class Company {
  final String name;
  final Address address;

  const Company(this.name, this.address);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      json['name'],
      Address.fromJson(json['address']),
    );
  }
}
