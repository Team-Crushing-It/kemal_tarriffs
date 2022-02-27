import 'dart:async';

import 'package:kemal_tarriffs/catalog/catalog.dart';

const _delay = Duration(milliseconds: 800);

const _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class TariffRepository {
  final _items = <Item>[];

  Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Item>> loadCalculatorItems() =>
      Future.delayed(_delay, () => _items);

  void addItemToCalculator(Item item) => _items.add(item);

  void removeItemFromCalculator(Item item) => _items.remove(item);
}
