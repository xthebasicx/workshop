import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/model.dart';
import 'package:workshop/testProvider.dart';

import 'UserDetailsScreen.dart';

class listprovince extends StatefulWidget {
  const listprovince({super.key});

  @override
  State<listprovince> createState() => _listprovinceState();
}

class _listprovinceState extends State<listprovince> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TestProvider>(
        builder: (context, TestProvider provider, child) {
          var sortedUserdata = provider.getSortedUserdataByProvince();
          var count = sortedUserdata.length;
          if (count <= 0) {
            return Center(
              child: Text('Data Not Found'),
            );
          } else {
            return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                usermodel data = sortedUserdata[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 3,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsScreen(user: data),
                        ),
                      );
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.name.toString()),
                        Container(
                          child: Row(
                            children: [
                              Text(data.province.toString()),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Alert'),
                                          content:
                                              Text('Do you want to delete?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  provider.removeUserData(data);
                                                },
                                                child: Text('Yes')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No')),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
