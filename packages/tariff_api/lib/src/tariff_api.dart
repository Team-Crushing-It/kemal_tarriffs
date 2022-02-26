import 'package:tariff_api/src/models/tariff_model.dart';

/// {@template tariff_api}
/// My tariff  package
/// {@endtemplate}
class TariffApi {
  /// {@macro tariff_api}
  TariffApi();

  final _tariffList = [
    Tariff(
      ageCondition: 'Grown',
      additionalInfo: '',
      price: 64386,
    ),
    Tariff(
      ageCondition: 'Grown',
      additionalInfo: 'Citizen of Kamchatka',
      price: 18000,
    ),
    Tariff(
      ageCondition: 'Baby from 2 to 12',
      additionalInfo: 'Resident of Russia',
      price: 9000,
    ),
    Tariff(
      ageCondition: 'Baby from 2 to 12',
      additionalInfo: 'Foreign Residences',
      price: 32193,
    ),
    Tariff(
      ageCondition: 'Baby under 2 years old',
      additionalInfo: 'Without seat',
      price: 0,
    ),
  ];

  /// Function to just pull down tariff info
  Future<Tariff> getTariff(String ageCondition, String additionalInfo) async {
    final filteredTariff = _tariffList.firstWhere(
      (element) =>
          element.ageCondition == ageCondition &&
          element.ageCondition == additionalInfo,
      orElse: () => throw TariffNotFoundException(),
    );

    return filteredTariff;
  }
}

/// Error thrown when a [Tariff] with a given id is not found.
class TariffNotFoundException implements Exception {}
