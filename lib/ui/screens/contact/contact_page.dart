import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msil_task_login/bloc/contact_bloc.dart';
import 'package:msil_task_login/bloc/contact_search_bloc.dart';

import 'package:msil_task_login/repositories/contacts/contacts_repo.dart';
import 'package:msil_task_login/ui/screens/login/loginscreen.dart';

class ContactPageList extends StatefulWidget {
  const ContactPageList({super.key});

  @override
  State<ContactPageList> createState() => _ContactPageListState();
}

class _ContactPageListState extends State<ContactPageList> {
  bool _isSearching = false;
  dynamic contactli = [], contactlisearch = [];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ContactBloc(RepositoryProvider.of<ContactsRepo>(context))
                ..add(ContactLoadingEvent()),
        ),
        BlocProvider(
            create: (context) =>
                ContactSearchBloc()..add(ContactSearchInitialEvent())),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: BlocBuilder<ContactSearchBloc, ContactSearchState>(
            builder: (context, state) {
              if (state is ContactSearchInitialState) {
                return const Center(
                    child: Text(
                  "Contacts",
                  style: TextStyle(color: Colors.black54),
                ));
              }
              if (state is ContactSearchingSearchingState) {
                return TextField(
                  onChanged: (value) {
                    BlocProvider.of<ContactBloc>(context)
                        .add(ContactSearchingEvent(contactli, value));
                  },
                );
              }

              return const Center(
                  child: Text(
                "Contacts",
                style: TextStyle(color: Colors.black54),
              ));
            },
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()));
            },
            icon: Icon(
              Icons.menu,
              color: Colors.grey.shade500,
            ),
          ),
          actions: [
            BlocBuilder<ContactSearchBloc, ContactSearchState>(
                builder: (context, state) {
              if (state is ContactSearchInitialState) {
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<ContactSearchBloc>(context)
                          .add(ContactSearchingSearchingEvent(contactli));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                    ));
              }
              if (state is ContactSearchingSearchingState) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<ContactBloc>(context)
                        .add(ContactLoadedEvent(contactli));
                    BlocProvider.of<ContactSearchBloc>(context)
                        .add(ContactSearchInitialEvent());
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey.shade500,
                  ),
                );
              }
              //       : IconButton(
              //           onPressed: () {
              //             BlocProvider.of<ContactSearchBloc>(context)
              //                 .add(ContactSearchingEvent(contactli));
              //           },
              //           icon: Icon(
              //             Icons.search,
              //             color: Colors.grey.shade500,
              //           ));
              // }
              return IconButton(
                  onPressed: () {
                    _isSearching = !_isSearching;
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ));
            }),
          ],
        ),
        body: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state is ContactLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ContactLoadedState) {
              contactli = state.contatdetails;
              contactlisearch = state.contatdetails;
              return contactList(contactlisearch.data);
            } else if (state is ContactSearchListState) {
              contactlisearch = state.contatdetails;
              return contactList(contactlisearch);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget contactList(dynamic contactli) {
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
              child: contactli.length > 0
                  ? ListView.builder(
                      itemCount: contactli.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 20)),
                                Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              contactli[index].avatar),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 50)),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 20)),
                                      Text(
                                        "${contactli[index].firstName} ${contactli[index].lastName}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      Text(
                                        contactli[index].email,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
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
                      })
                  : Center(
                      child: Text(
                        "No Data  Found",
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
