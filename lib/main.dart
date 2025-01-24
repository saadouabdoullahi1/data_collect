import 'package:data_collect/database.dart';
import 'package:data_collect/info_form.dart';
import 'package:flutter/material.dart';

late Database db;
void main() {
  db = Database();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 218, 240, 25)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: db.getForms(),
        builder: (context, snapshot) {

          if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Row(
                  children: [
                    CircleAvatar(),
                    Column(
                      children: [Text('data'), Text('data')],
                    ),
                  ],
                ),
              );
            },
          );
          }return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>InfoForm()));
        },
        tooltip: 'Ajouter ',
        child: const Icon(Icons.add),
      ),
    );
  }
}
