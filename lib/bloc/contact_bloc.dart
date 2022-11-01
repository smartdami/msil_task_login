import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:msil_task_login/model/contact/contact_model.dart';
import 'package:msil_task_login/repositories/contacts/contacts_repo.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactsRepo _contactsRepo;
  ContactBloc(this._contactsRepo) : super(ContactLoadingState()) {
    on<ContactLoadingEvent>((event, emit) async {
      try {
        emit(ContactLoadingState());
        ContactsModel contactdetails = await _contactsRepo.contactrepo();
        emit(ContactLoadedState(contactdetails));
      } catch (e) {}
    });
    on<ContactSearchingEvent>((event, emit) async {
      try {
        dynamic values = event.contactli;
        List searchvalues = [];
        emit(ContactLoadingState());
        for (int i = 0; i < values.data.length; i++) {
          if ((values.data[i].firstName + " " + values.data[i].lastName)
              .toString()
              .toLowerCase()
              .contains(event.searchtext!.toLowerCase())) {
            searchvalues.add(values.data[i]);
          }
        }
        emit(ContactSearchListState(searchvalues));
      } catch (e) {}
    });
    on<ContactLoadedEvent>((event, emit) async {
      try {
        emit(ContactLoadedState(event.contactdetails));
      } catch (e) {}
    });
  }
}
