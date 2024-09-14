import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/data/models/promo.dart';
import 'package:food_ninja/features/home/data/services/promos_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PromosService promosService;

  HomeBloc(this.promosService) : super(const HomeState.initial()) {
    on<_Started>((event, emit) async {
      emit(const HomeState.loading());
      final promos = await promosService.getPromotions();
      emit(HomeState.loaded(promos));
    });
  }
}
