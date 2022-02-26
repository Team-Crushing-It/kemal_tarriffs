import 'package:tariff_api/tariff_api.dart';

/// {@template tariffs_repository}
/// My tariffs repo
/// {@endtemplate}
class TariffsRepository {
  /// {@macro tariffs_repository}
  const TariffsRepository({
    required TariffApi tariffApi,
  }) : _tariffApi = tariffApi;

  final TariffApi _tariffApi;

  /// Fetches the specific tariff
  ///
  /// If no tariff exists, a [TariffNotFoundException] error is
  /// thrown.
  Future<Tariff> deleteTodo(String ageCondition, String additionalInfo) =>
      _tariffApi.getTariff(ageCondition, additionalInfo);
}
