import 'dart:developer';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:csv/csv.dart';
import 'package:data_collect/form_info_screen.dart';
import 'package:data_collect/database.dart';
import 'package:data_collect/info_form.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

late Database db;
void main() {
  initializeDateFormatting();
  db = Database();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collecte de données',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 218, 240, 25),
        ),
        useMaterial3: true,
      ),
      // Vérification initiale sur la page de login
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController groupController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkGroupExistence();
  }

  Future<void> _checkGroupExistence() async {
    setState(() {
      isLoading = true;
    });

    try {
      final groupExists = await _doesGroupExist();
      if (groupExists) {
        // Redirection directe si le groupe existe déjà
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  const MyHomePage(title: 'Collecte de données'),
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Erreur lors de la vérification : ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> _doesGroupExist() async {
    bool isExist=(await db.select(db.group).get()).isNotEmpty;
    if(isExist) {
      return true;
    }
    return false;
  }

  Future<void> _submitGroup() async {
    final groupName = groupController.text.trim();

    if (groupName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer un nom de groupe')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await db.into(db.group).insert(
          GroupCompanion(id: drift.Value(int.parse(groupController.text))));

      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                const MyHomePage(title: 'Collecte de données'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'ajout : ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    ' Veuillez  ajouter le numéro de votre groupe  pour continuer.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: groupController,
                    maxLength: 2,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(counter:  SizedBox.shrink(),
                      labelText: 'Numéro du groupe',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isLoading ? null : _submitGroup,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Ajouter le groupe'),
                  ),
                ],
              ),
            ),
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
  bool isMultiSelection = false;
  bool isEmptyList = true;

  Map<int, int> selectedIndex = {};
  Future<void> exportFormTableToCSV(Database db) async {
    final rows = await db.select(db.form).get();
    final groupId=await db.select(db.group).getSingle();
    List<List<dynamic>> csvData = [
      [
        'Quartier',
        'Emplacement',
        'Prenom',
        'Nom',
        'Contact',
        'Sexe',
        'Age',
        'Date de naissance',
        'Date d\'ajout',
        'Photo d\'identité',
        'Carte',
        'Groupe'
      ],
      ...rows.map((row) => [
            row.quarter,
            row.location,
            row.firstName,
            row.lastName,
            row.phoneNumber,
            row.sexe,
            row.age,
            row.birthdate,
            row.createdAt?.toIso8601String(),
           (row.urlImage==null)?'': row.urlImage!.replaceAll(
                '/data/user/0/com.example.data_collect/app_flutter/images/',
                ''),
            (row.urlIdCard==null)?'':row.urlIdCard!.replaceAll(
                '/data/user/0/com.example.data_collect/app_flutter/images/',
                ''),
            '${groupId.id}'
          ])
    ];

    String csv = const ListToCsvConverter(textDelimiter: ";").convert(csvData);
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/liste.csv';

    final file = File(filePath);
    await file.writeAsString(csv);

    log('Fichier CSV enregistré à : $filePath');
  }

  Future<File> compressDataToZip() async {
    final directory = await getApplicationDocumentsDirectory();
    final csvFilePath = '${directory.path}/liste.csv';
    final imagesDirPath = '${directory.path}/images';
    final archive = Archive();
    final csvFile = File(csvFilePath);
    if (await csvFile.exists()) {
      final csvBytes = await csvFile.readAsBytes();
      archive.addFile(ArchiveFile('liste.csv', csvBytes.length, csvBytes));
    }

    final imagesDir = Directory(imagesDirPath);
    if (await imagesDir.exists()) {
      final imageFiles = imagesDir.listSync();
      for (var entity in imageFiles) {
        if (entity is File) {
          final imageBytes = await entity.readAsBytes();
          final fileName = entity.path.split('/').last;
          archive.addFile(
              ArchiveFile('images/$fileName', imageBytes.length, imageBytes));
        }
      }
    }
    final zipEncoder = ZipEncoder();
    final zipData = zipEncoder.encode(archive);
    final zipFilePath = '${directory.path}/terrafinance.zip';
    final zipFile = File(zipFilePath);
    await zipFile.writeAsBytes(zipData);
    log('Fichier ZIP créé à : $zipFilePath');
    return zipFile;
  }

  void shareZipFile(File zipFile) {
    Share.shareXFiles([XFile(zipFile.path)],
        text: 'Voici les données compressées.');
  }

  Future<void> deleteImage(String filePath) async {
    final file = File(filePath);

    if (await file.exists()) {
      try {
        await file.delete();
        log('Image deleted successfully: $filePath');
      } catch (e) {
        log('Error deleting the image: $e');
      }
    } else {
      log('File does not exist: $filePath');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  void showProgressDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }

  Future<void> handleSharingProcessWithDialog(BuildContext context) async {
    try {
      showProgressDialog(context, 'Exportation des données CSV...');
      print('numero 1');
      await exportFormTableToCSV(db);
      print('numero 2');
      if (context.mounted) {
        print('numero 3');
        Navigator.pop(context);
        showProgressDialog(context, 'Compression des données...');
      }
      print('numero 4');
      if (context.mounted) {
        print('numero 5');
        Navigator.pop(context);
        showProgressDialog(context, 'Partage des données...');
      }
      final zipFile = await compressDataToZip();
      await Future.delayed(Duration(seconds: 1));
      shareZipFile(zipFile);
      if (context.mounted) {
        Navigator.pop(context);
        showSnackBar(context, 'Partage terminé avec succès !');
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        showSnackBar(context, 'Erreur lors du processus : $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          if (isMultiSelection)
            IconButton(
                onPressed: () async {
                  for (var id in selectedIndex.values) {
                    final record = await (db.select(db.form)
                          ..where((f) => f.id.equals(id)))
                        .getSingleOrNull();
                    if (record != null) {
                      if (record.urlImage != null) {
                        await deleteImage(record.urlImage!);
                      }
                      if (record.urlIdCard != null) {
                        await deleteImage(record.urlIdCard!);
                      }
                    }

                    db.form.deleteWhere((f) => f.id.equals(id));
                    setState(() {
                      isMultiSelection = false;
                      selectedIndex = {};
                    });
                  }
                },
                icon: Icon(Icons.delete)),
          StreamBuilder(
            stream: db.form.select().watch(),
            builder: (context, snapshot) {
              final isListEmpty =
                  !(snapshot.hasData && snapshot.data!.isNotEmpty);

              return IconButton(
                onPressed: isListEmpty
                    ? null
                    : () async {
                        await handleSharingProcessWithDialog(context);
                      },
                icon: Icon(Icons.share),
                color: isListEmpty ? Colors.grey : null,
              );
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: db.form.select().watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final id = data[index].id;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 3),
                    child: GestureDetector(
                      onTap: () {
                        if (isMultiSelection) {
                          if (selectedIndex.keys.contains(index)) {
                            setState(() {
                              selectedIndex.remove(index);
                              if (selectedIndex.keys.isEmpty) {
                                isMultiSelection = false;
                              }
                            });
                          } else {
                            setState(() {
                              selectedIndex[index] = id;
                            });
                          }
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  FormInfoScreen(form: data[index])));
                        }
                      },
                      onLongPress: () {
                        setState(() {
                          isMultiSelection = true;
                          selectedIndex[index] = id;
                        });
                      },
                      child: Center(
                        child: Card(
                          elevation: 1,
                          clipBehavior: Clip.hardEdge,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withValues(alpha: 0.9),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  CircleAvatar(
                                    radius: 22,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data[index].firstName!} ${data[index].lastName!}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.phone),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            data[index]
                                                .phoneNumber!
                                                .splitMapJoin(RegExp(r'.{1,2}'),
                                                    onMatch: (math) =>
                                                        '${math.group(0)} ')
                                                .trim(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (selectedIndex.keys.contains(index))
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withValues(alpha: 0.7),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 2,
                                          color:
                                              Theme.of(context).primaryColor)),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
          return Center(child: Text('Aucune donnée ajoutée'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!isMultiSelection) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => InfoForm()));
          } else {
            setState(() {
              selectedIndex = {};
              isMultiSelection = false;
            });
          }
        },
        child: Icon(isMultiSelection ? Icons.cancel_outlined : Icons.add),
      ),
    );
  }
}
