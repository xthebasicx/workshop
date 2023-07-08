import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/adduser.dart';
import 'package:workshop/listname.dart';
import 'package:workshop/listprovince.dart';
import 'package:workshop/testProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TestProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homepage(),
      ),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'List name',
              ),
              Tab(
                text: 'List sorted by province',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            listname(),
            listprovince(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.deepPurple,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120, 10, 120, 10),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 5.0,
              height: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => adduser(),
                  ),
                );
              },
              child: Text(
                "Add name",
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
