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
  }
}
