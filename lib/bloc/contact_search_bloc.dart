import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_search_event.dart';
part 'contact_search_state.dart';

class ContactSearchBloc extends Bloc<ContactSearchEvent, ContactSearchState> {
  ContactSearchBloc() : super(ContactSearchInitialState()) {
    on<ContactSearchInitialEvent>((event, emit) {
      emit(ContactSearchInitialState());
    });

    on<ContactSearchingSearchingEvent>((event, emit) {
      emit(ContactSearchingSearchingState());
    });

    // on<ContactLoadedEvent>((event, emit) {
    //   emit(ContactLoadedState(event.contactli));
    // });
  }
}
