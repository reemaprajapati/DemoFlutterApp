import 'package:flutter/material.dart';

import 'contact.dart';
import 'profile.dart';


//class ContactPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Contacts"),
//
//        ),
//        body: new ContactList(contacts)
//    );
//  }
//}

class ContactList extends StatelessWidget {
  List<Contact> contactList;

  ContactList(this.contactList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: buildContact(context),
    );
  }

  List<ContactListItem> buildContact(BuildContext context) {
    return contacts.map((contact) => new ContactListItem(contact, context))
        .toList();
  }

}

class ContactListItem extends StatelessWidget {

  const ContactListItem(this.contact, BuildContext context) :
        assert(contact != null);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(2.0),
      child: new Column(
        children: <Widget>[
          new ListTile(
            onTap: () =>
                Navigator.push(context, new MaterialPageRoute(
                    builder: (_) =>
                    new MyHomePage(title: "Profile", contact: contact,))),
            title: new Text(contact.fullName),
            subtitle: new Text(contact.email),
            leading: new CircleAvatar(
              backgroundImage: new NetworkImage(contact.image),
              backgroundColor: Colors.black,
            ),
          ),
          new Divider()
        ],
      ),
    );


    new ListTile(
        onTap: () =>
            Navigator.push(context, new MaterialPageRoute(
                builder: (_) =>
                new MyHomePage(title: "Profile", contact: contact,))),
        title: new Text(contact.fullName),
        subtitle: new Text(contact.email),
        leading: new CircleAvatar(
          backgroundImage: new NetworkImage(contact.image),
          backgroundColor: Colors.black,
        )
    );
  }


}