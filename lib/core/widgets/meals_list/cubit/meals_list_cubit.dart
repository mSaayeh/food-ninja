import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meals_list_state.dart';

class MealsListCubit extends Cubit<MealsListState> {
  MealsListCubit() : super(MealsListInitial());
}
