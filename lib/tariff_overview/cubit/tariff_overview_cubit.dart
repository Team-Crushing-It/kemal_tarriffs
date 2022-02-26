import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tariff_overview_state.dart';

class TariffOverviewCubit extends Cubit<TariffOverviewState> {
  TariffOverviewCubit() : super(TariffOverviewInitial());
}
