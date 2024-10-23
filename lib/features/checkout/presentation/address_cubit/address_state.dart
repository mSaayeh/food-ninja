part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressLoading extends AddressState {}

final class AddressLoaded extends AddressState {
  final Address address;

  const AddressLoaded(this.address);

  @override
  List<Object> get props => [address];
}

final class AddressError extends AddressState {
  final String message;

  const AddressError(this.message);

  @override
  List<Object> get props => [message];
}
