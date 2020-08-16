import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:visiting_card/models/card_model.dart';
import 'package:visiting_card/services/card_data.dart';
import 'package:visiting_card/widgets/widgets.dart';

class FormPage extends StatefulWidget {
  final CardData cardData;

  const FormPage({Key key, this.cardData}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  static final _formKey = GlobalKey<FormState>();
  String fullName = '',
      workPosition = '',
      phoneNumber = '',
      email = '',
      address1 = '',
      address2 = '',
      address3 = '',
      path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('New Form'),backgroundColor: Colors.white70,),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFf0f2f5),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Center(
            child: NeuContainer(
              child: Text(
                'Enter Details',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2),
              ),
            ),
          ),


          Form(
            key: _formKey,
            child: Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        fullName = value;
                        print(fullName);
                      },
                      decoration: InputDecoration(
                          hintText: "Full Name", icon: Icon(Icons.person)),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        workPosition = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Designation",
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          hintText: "Your Email",
                          icon: Icon(Icons.alternate_email)),
                    ),
                    Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            address1 = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Address Line 1",
                              icon: Icon(Icons.home)),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            address2 = value;
                          },
                          decoration:
                              InputDecoration(hintText: "Address Line 2"),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            address3 = value;
                          },
                          decoration:
                              InputDecoration(hintText: "Address Line 3"),
                        ),
                      ],
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      decoration: InputDecoration(
                          hintText: "Phone number", icon: Icon(Icons.phone)),
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          heroTag: 'somdaslkjfdika',
                          mini: true,
                          backgroundColor: Colors.blueGrey,
                          onPressed: () async {
                            Future getImage() async {
                              final picker = ImagePicker();

                              final pickedFile = await picker.getImage(
                                  source: ImageSource.gallery);

                              setState(() {
                                path = pickedFile.path == null
                                    ? path
                                    : pickedFile.path;
                              });
                            }

                            await getImage();
                          },
                          child: Icon(Icons.image),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(path == null
                            ? 'Company Logo'
                            : '... ' + path.substring(path.length - 10))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                onPressed: () async {
                  print(fullName);
                  if (true) {
                    await widget.cardData.addNewCard(VisitingCard(
                        fullName: fullName == null ? '' : fullName,
                        workPosition:
                            workPosition == null ? '' : workPosition,
                        email: email == null ? '' : email,
                        address1: address1 == null ? '' : address1,
                        address2: address2 == null ? '' : address2,
                        address3: address3 == null ? '' : address3,
                        phoneNumber: phoneNumber == null ? '' : phoneNumber,
                        path: path));

                    Navigator.pop(context);
                  }
                },
                label: Text('CREATE'),
                icon: Icon(Icons.arrow_forward),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
