import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/model.dart';
import 'package:workshop/testProvider.dart';
import 'package:workshop/UserDetailsScreen.dart';

class listname extends StatefulWidget {
  const listname({super.key});

  @override
  State<listname> createState() => _listnameState();
}

class _listnameState extends State<listname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: ((context, TestProvider provider, child) {
        var count = provider.userdata.length;
        if (count <= 0) {
          return Center(
            child: Text('Data not found'),
          );
        } else {
          return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                usermodel data = provider.userdata[index];
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
                                icon: Icon(Icons.delete))
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    ));
  }
}
