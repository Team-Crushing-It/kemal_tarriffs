import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemal_tarriffs/calculator/calculator.dart';
import 'package:kemal_tarriffs/catalog/catalog.dart';
import 'package:kemal_tarriffs/tariff_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.tariffRepository}) : super(key: key);

  final TariffRepository tariffRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            tariffRepository: tariffRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CalculatorBloc(
            tariffRepository: tariffRepository,
          )..add(CalculatorStarted()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Tariff Calculator',
        initialRoute: '/',
        routes: {
          '/': (_) => CatalogPage(),
          '/calculator': (_) => CalculatorPage(),
        },
      ),
    );
  }
}
