import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemal_tarriffs/app.dart';
import 'package:kemal_tarriffs/tariff_repository.dart';
import 'package:kemal_tarriffs/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App(tariffRepository: TariffRepository())),
    blocObserver: SimpleBlocObserver(),
  );
}
