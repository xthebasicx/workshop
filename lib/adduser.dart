import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/model.dart';
import 'package:workshop/testProvider.dart';

class adduser extends StatefulWidget {
  const adduser({super.key});

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  int currentStep = 0;

  final TextEditingController idnumber = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController date = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  List<String> options = [
    'Bangkok',
    'Chiang Mai',
    'Phuket',
    'Pattaya',
  ];
  var _currentItemSelected = "Bangkok";
  var province = "Bangkok";
  final formkey = GlobalKey<FormState>();
  final formkeys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar()),
      body: Stepper(
        steps: [
          Step(
            isActive: currentStep == 0,
            title: Text('Personal information'),
            content: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: idnumber,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Identification number',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                    validator: (str) {
                      if (str!.length == 0 ||
                          str.length < 13 ||
                          str.length > 13) {
                        return "cannot be empty or not equal to 13 characters";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Name',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                    validator: (str) {
                      if (str!.length == 0) {
                        return "cannot be empty";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: date,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'YYYY/MM/DD (Date of birth)',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                    validator: (str) {
                      if (str!.length == 0) {
                        return "cannot be empty";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: currentStep == 1,
            title: Text('Address'),
            content: Form(
              key: formkeys,
              child: Column(
                children: [
                  TextFormField(
                    controller: address,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Address',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                    validator: (str) {
                      if (str!.length == 0) {
                        return "cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Province'),
                      DropdownButton<String>(
                        dropdownColor: Colors.white,
                        isDense: true,
                        isExpanded: false,
                        items: options.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(
                              dropDownStringItem,
                            ),
                          );
                        }).toList(),
                        onChanged: (newValueSelected) {
                          setState(() {
                            _currentItemSelected = newValueSelected!;
                            province = newValueSelected;
                            print(province);
                          });
                        },
                        value: _currentItemSelected,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: currentStep == 2,
            title: Text('Finish'),
            content: Container(),
          ),
        ],
        onStepTapped: (int newIndex) {
          setState(() {
            currentStep = newIndex;
          });
        },
        currentStep: currentStep,
        onStepContinue: () {
          if (currentStep != 2 && formkey.currentState!.validate()) {
            setState(() {
              currentStep = 1;
            });
            if (currentStep == 1 && formkeys.currentState!.validate()) {
              setState(() {
                currentStep += 1;
              });
            }
            if (currentStep == 2) {
              var idnumbers = idnumber.text;
              var names = name.text;
              var dates = date.text;
              var addresss = address.text;
              usermodel statement = usermodel(
                idnumber: idnumbers,
                name: names,
                date: dates,
                address: addresss,
                province: province,
              );
              var provider = Provider.of<TestProvider>(context, listen: false);
              provider.addusermodel(statement);
              print('$idnumbers$names$dates$addresss');
              Navigator.pop(context);
            }
          }
        },
        onStepCancel: () {
          if (currentStep != 0) {
            setState(() {
              currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
