import 'package:flutter/material.dart';
import 'package:portfolio_admin/Projects.dart';
import 'package:provider/provider.dart';
import 'AddProject.dart';
import 'Messages.dart';
import 'Providers/Projectsprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Projectsprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(title: 'Portfolio Admin'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> tabs = [
    const Projects(),
    const AddProjects(),
    const Messages(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor:
                  Theme.of(context).primaryColor,
              indicatorWeight: 2.0,
              isScrollable: false,
              tabs: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.3,
                  child: const Tab(
                    text: 'Projects ',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.3,
                  child: const Tab(
                    text: 'Add Project',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.3,
                  child: const Tab(
                    text: 'Messages',
                  ),
                ),
              ],
            )),
        body: TabBarView(
            children: [for (final tab in tabs) tab]),
      ),
    );
  }
}
