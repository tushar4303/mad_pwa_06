import 'package:exp04/homepage.dart';
import 'package:exp04/models/subjectfaculty.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyProfilePage(),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class MySubjects extends StatefulWidget {
  const MySubjects({super.key});

  @override
  State<MySubjects> createState() => _MySubjectsState();
}

class _MySubjectsState extends State<MySubjects> {
  List<SubjectFaculty> subjects = [
    SubjectFaculty(icon: "", sub: "AI_DS", teacher: "Prof. Prasad Padalkar"),
    SubjectFaculty(icon: "", sub: "MAD_PWA", teacher: "Prof. Nilesh Ghavate"),
    SubjectFaculty(
        icon: "", sub: "Wireless Technology", teacher: "Prof. Tayyabali"),
  ];

  Widget subjectTemplate(sub) {
    return Card(
        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(sub.subject),
              const SizedBox(
                height: 10.0,
              ),
              Text(sub.faculty),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: subjects.map((sub) => subjectTemplate(sub)).toList(),
    );
  }
}

class _MyProfilePageState extends State<MyProfilePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool showlogo = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const HomePage(),
      const MySubjects(),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 72,
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/88235295?v=4"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Name",
                  textScaleFactor: 0.95,
                ),
                subtitle: Text(
                  "Tushar Padhy",
                  textScaleFactor: 1.1,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  "City",
                  textScaleFactor: 0.95,
                ),
                subtitle: Text(
                  "Mumbai",
                  textScaleFactor: 1.1,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  "Phone",
                  textScaleFactor: 0.95,
                ),
                subtitle: Text(
                  "8104951731",
                  textScaleFactor: 1.1,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  "Email",
                  textScaleFactor: 0.95,
                ),
                subtitle: Text(
                  "padhytushar4303@gmail.com",
                  textScaleFactor: 1.1,
                ),
              ),
              if (showlogo)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "assets/builtwithflutter.png",
                  ),
                ),
              const SizedBox(
                height: 72,
              )
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.person),
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Mad Pwa Lab"),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: const Image(image: AssetImage('assets/dash.png')),
          onPressed: () {
            setState(() {
              showlogo = !showlogo;
            });
          }),
    );
  }
}
