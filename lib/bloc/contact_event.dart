part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class ContactLoadingEvent extends ContactEvent {
  @override
  List<Object> get props => [];
}

class ContactLoadedEvent extends ContactEvent {
  final dynamic contactdetails;

  const ContactLoadedEvent(this.contactdetails);
  @override
  List<Object> get props => [contactdetails];
}

class ContactSearchingEvent extends ContactEvent {
  dynamic contactli;

  String? searchtext;
  ContactSearchingEvent(this.contactli, this.searchtext);
  @override
  List<Object> get props => [contactli, searchtext!];
}
