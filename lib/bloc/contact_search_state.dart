part of 'contact_search_bloc.dart';

abstract class ContactSearchState extends Equatable {
  const ContactSearchState();

  @override
  List<Object> get props => [];
}

class ContactSearchInitialState extends ContactSearchState {
  final bool isSearching = false;
  @override
  List<Object> get props => [isSearching];
}

class ContactSearchingSearchingState extends ContactSearchState {
  @override
  List<Object> get props => [];
}

// class ContactLoadedState extends ContactSearchState {
//   final dynamic contactli;

//   ContactLoadedState(this.contactli);
//   @override
//   List<Object> get props => [contactli];
// }
