part of 'contact_search_bloc.dart';

abstract class ContactSearchEvent extends Equatable {
  const ContactSearchEvent();

  @override
  List<Object> get props => [];
}

class ContactSearchInitialEvent extends ContactSearchEvent {
  @override
  List<Object> get props => [];
}

class ContactSearchingSearchingEvent extends ContactSearchEvent {
  final dynamic contactli;
  final dynamic isSearching = true;
  ContactSearchingSearchingEvent(this.contactli);
  @override
  List<Object> get props => [contactli, isSearching];
}

// class ContactLoadedEvent extends ContactSearchEvent {
//   final dynamic contactli;

//   ContactLoadedEvent(this.contactli);
//   @override
//   List<Object> get props => [contactli];
// }
