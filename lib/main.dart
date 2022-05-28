import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_admin/Projects.dart';
import 'package:provider/provider.dart';
import 'AddProject.dart';
import 'Messages.dart';
import 'Models/ProjectsModel.dart';
import 'Phoneauth.dart';
import 'Providers/Projectsprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, snap) {
                if (snap.hasData) {
                  return const MyHomePage(
                
                  );
                }
                return const VerifyPhone();
              }),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> tabs = [
    const Projects(),
    AddProjects(
      project: Project(description: '', id: '', image: '', link: '', name: ''),
    ),
    const Messages(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            title: Text('My Portfolio Admin'),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 2.0,
              isScrollable: false,
              tabs: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: const Tab(
                    text: 'Projects ',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: const Tab(
                    text: 'Add Project',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: const Tab(
                    text: 'Messages',
                  ),
                ),
              ],
            )),
        body: TabBarView(children: [for (final tab in tabs) tab]),
      ),
    );
  }
}
