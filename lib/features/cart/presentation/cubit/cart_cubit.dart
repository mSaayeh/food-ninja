import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/data/services/cart_service.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartService cartService;
  CartCubit(this.cartService) : super(const CartInitial());

  void increaseQuantity(CartItem cartItem) async {
    emit(const CartLoading());
    await cartService.addToCart(cartItem.meal.ref, 1);
    Future.delayed(const Duration(milliseconds: 500), () {
      emit(const CartInitial());
    });
  }

  void decreaseQuantity(CartItem cartItem) async {
    emit(const CartLoading());
    if (cartItem.quantity == 1) {
      await cartService.removeFromCart(cartItem.meal.ref);
    } else {
      await cartService.addToCart(cartItem.meal.ref, -1);
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      emit(const CartInitial());
    });
  }
}
