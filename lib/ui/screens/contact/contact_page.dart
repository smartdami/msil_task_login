import 'package:flutter/material.dart';
class ContactPageList extends StatefulWidget {
  const ContactPageList({super.key});

  @override
  State<ContactPageList> createState() => _ContactPageListState();
}

class _ContactPageListState extends State<ContactPageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 20, left: 0),
        height: MediaQuery.of(context).size.height / 1.3,
        width: MediaQuery.of(context).size.width / 1.0,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Ranking",
                // style: page_textstyle,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20)),
                                  Text(
                                    "${index + 1}",
                                    //  style: page_textstyle,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 50)),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: new AssetImage(
                                              "assets/images/download.jpg"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 50)),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 60,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 25)),
                                        Container(
                                          child: Text(
                                            "Damien",
                                            //style: page_textstyle,
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        Container(
                                          child: Text(
                                            "50",
                                            //style: page_textstyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 60)),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: new AssetImage(
                                              "assets/images/download.jpg"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
