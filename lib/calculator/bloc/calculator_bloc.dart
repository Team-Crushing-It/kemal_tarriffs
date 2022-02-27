import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kemal_tarriffs/calculator/calculator.dart';
import 'package:kemal_tarriffs/catalog/catalog.dart';
import 'package:kemal_tarriffs/tariff_repository.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc({required this.tariffRepository})
      : super(CalculatorLoading()) {
    on<CalculatorStarted>(_onStarted);
    on<CalculatorItemAdded>(_onItemAdded);
    on<CalculatorItemRemoved>(_onItemRemoved);
  }

  final TariffRepository tariffRepository;

  void _onStarted(
      CalculatorStarted event, Emitter<CalculatorState> emit) async {
    emit(CalculatorLoading());
    try {
      final items = await tariffRepository.loadCalculatorItems();
      emit(CalculatorLoaded(calculator: Calculator(items: [...items])));
    } catch (_) {
      emit(CalculatorError());
    }
  }

  void _onItemAdded(
      CalculatorItemAdded event, Emitter<CalculatorState> emit) async {
    final state = this.state;
    if (state is CalculatorLoaded) {
      try {
        tariffRepository.addItemToCalculator(event.item);
        emit(CalculatorLoaded(
            calculator:
                Calculator(items: [...state.calculator.items, event.item])));
      } catch (_) {
        emit(CalculatorError());
      }
    }
  }

  void _onItemRemoved(
      CalculatorItemRemoved event, Emitter<CalculatorState> emit) {
    final state = this.state;
    if (state is CalculatorLoaded) {
      try {
        tariffRepository.removeItemFromCalculator(event.item);
        emit(
          CalculatorLoaded(
            calculator: Calculator(
              items: [...state.calculator.items]..remove(event.item),
            ),
          ),
        );
      } catch (_) {
        emit(CalculatorError());
      }
    }
  }
}
