import 'dart:async';

import 'package:kemal_tarriffs/catalog/catalog.dart';

const _delay = Duration(milliseconds: 800);

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

class TariffRepository {
  final _items = <Item>[];

  Future<List<Tariff>> loadCatalog() =>
      Future.delayed(_delay, () => _tariffList);

  Future<List<Item>> loadCalculatorItems() =>
      Future.delayed(_delay, () => _items);

  void addItemToCalculator(Item item) => _items.add(item);

  void removeItemFromCalculator(Item item) => _items.remove(item);
}
