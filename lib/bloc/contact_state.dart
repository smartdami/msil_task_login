part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactLoadingState extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoadedState extends ContactState {
  dynamic contatdetails;

  // ignore: prefer_const_constructors_in_immutables
  ContactLoadedState(this.contatdetails);
  @override
  List<Object> get props => [contatdetails];
}

class ContactSearchListState extends ContactState {
  dynamic contatdetails;

  ContactSearchListState(this.contatdetails);
  @override
  List<Object> get props => [contatdetails];
}
