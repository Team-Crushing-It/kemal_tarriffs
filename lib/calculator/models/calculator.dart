import 'package:equatable/equatable.dart';
import 'package:kemal_tarriffs/catalog/catalog.dart';

class Calculator extends Equatable {
  const Calculator({this.items = const <Item>[]});

  final List<Item> items;

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }

  @override
  List<Object> get props => [items];
}
