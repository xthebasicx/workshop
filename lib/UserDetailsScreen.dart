import 'package:flutter/material.dart';
import 'package:workshop/model.dart';

class UserDetailsScreen extends StatelessWidget {
  final usermodel user;

  const UserDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Identification number: ${user.idnumber}'),
            SizedBox(height: 8),
            Text('Date of birth: ${user.date}'),
            SizedBox(height: 8),
            Text('Address: ${user.address}'),
            SizedBox(height: 8),
            Text('Province: ${user.province}'),
          ],
        ),
      ),
    );
  }
}
