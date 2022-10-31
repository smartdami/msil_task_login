import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msil_task_login/bloc/contact_bloc.dart';
import 'package:msil_task_login/model/contact/contact_model.dart';
import 'package:msil_task_login/repositories/contacts/contacts_repo.dart';
import 'package:msil_task_login/ui/screens/login/loginscreen.dart';

class ContactPageList extends StatefulWidget {
  const ContactPageList({super.key});

  @override
  State<ContactPageList> createState() => _ContactPageListState();
}

class _ContactPageListState extends State<ContactPageList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ContactBloc(RepositoryProvider.of<ContactsRepo>(context))
            ..add(ContactLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
              child: Text(
            "Contacts",
            style: TextStyle(color: Colors.black54),
          )),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
            },
            icon: Icon(
              Icons.menu,
              color: Colors.grey.shade500,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
        body: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state is ContactLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ContactLoadedState) {
              return contactList(state.contatdetails);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget contactList(ContactsModel contactdetails) {
    return Container(
      color: const Color.fromARGB(148, 255, 251, 251),
      alignment: Alignment.topLeft,
      // padding: const EdgeInsets.only(top: 20, left: 0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              child: ListView.builder(
                  itemCount: contactdetails.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 20)),
                            Center(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          contactdetails.data[index].avatar),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 50)),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  Text(
                                    "${contactdetails.data[index].firstName} ${contactdetails.data[index].lastName}",
                                    //style: page_textstyle,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  Text(
                                    contactdetails.data[index].email,
                                    //style: page_textstyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
