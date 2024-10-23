import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/checkout/data/models/address.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressLoading());

  void getAddress() {
    emit(AddressLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        if (event.data()!.containsKey('address')) {
          final address = Address.fromMap(event.data()!['address']);
          emit(AddressLoaded(address));
        } else {
          emit(const AddressError('Address not found'));
        }
      } else {
        emit(const AddressError('User not found'));
      }
    });
  }
}
