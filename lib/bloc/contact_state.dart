part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final dynamic contatdetails;

  // ignore: prefer_const_constructors_in_immutables
  ContactLoadedState(this.contatdetails);
  @override
  List<Object> get props => [contatdetails];
}
