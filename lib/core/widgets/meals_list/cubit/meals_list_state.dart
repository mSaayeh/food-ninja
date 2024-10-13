part of 'meals_list_cubit.dart';

sealed class MealsListState extends Equatable {
  const MealsListState();

  @override
  List<Object> get props => [];
}

final class MealsListInitial extends MealsListState {}

final class MealsListLoading extends MealsListState {}
