part of 'cart_bloc.dart';

@immutable
abstract class CalculatorState extends Equatable {
  const CalculatorState();
}

class CalculatorLoading extends CalculatorState {
  @override
  List<Object> get props => [];
}

class CalculatorLoaded extends CalculatorState {
  const CalculatorLoaded({this.cart = const Calculator()});

  final Calculator cart;

  @override
  List<Object> get props => [cart];
}

class CalculatorError extends CalculatorState {
  @override
  List<Object> get props => [];
}
