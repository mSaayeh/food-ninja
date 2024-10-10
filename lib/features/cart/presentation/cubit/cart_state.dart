part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}
