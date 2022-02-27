import 'package:equatable/equatable.dart';
import 'package:kemal_tarriffs/catalog/catalog.dart';

class Catalog extends Equatable {
  Catalog({required this.itemNames});

  final List<Tariff> itemNames;

  Tariff getById(int id) => Tariff(
        id: id,
        additionalInfo: itemNames[id].additionalInfo,
        ageCondition: itemNames[id].ageCondition,
        price: itemNames[id].price,
      );

  Tariff getByPosition(int position) => getById(position);

  @override
  List<Object> get props => [itemNames];
}
