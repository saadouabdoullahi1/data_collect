import 'package:data_collect/database.dart';
import 'package:data_collect/main.dart';
import 'package:data_collect/utils.dart';
import 'package:drift/drift.dart' as drift;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class InfoForm extends StatefulWidget {
  const InfoForm({super.key});

  @override
  State<InfoForm> createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController numberOfDependentsController =
      TextEditingController();
  DateTime? _selectedDate;
  int? neighborhood;
  int? sexe;
  File? _selectedIdentityPhoto;
  File? _selectedIdCard;

  Future<void> _pickImage(bool fromCamera, bool isIdentityPhoto) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      maxHeight: 531,
    );

    if (image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagesDir = Directory('${directory.path}/images');

      if (!imagesDir.existsSync()) {
        imagesDir.createSync();
      }

      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final birthdate = birthdateController.text.trim();

      if (firstName.isEmpty || lastName.isEmpty || birthdate.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Veuillez remplir Nom, Prénom et Date de Naissance'),
          ),
        );
        return;
      }

      final fileName = isIdentityPhoto
          ? '${birthdate}_${firstName}_${lastName}_identity.jpg'
              .replaceAll(' ', '_')
          : '${birthdate}_${firstName}_${lastName}_idcard.jpg'
              .replaceAll(' ', '_');

      final newImagePath = '${imagesDir.path}/$fileName';

      final File newImage = await File(image.path).copy(newImagePath);

      setState(() {
        if (isIdentityPhoto) {
          _selectedIdentityPhoto = newImage;
        } else {
          _selectedIdCard = newImage;
        }
      });

      print('Image déplacée vers : $newImagePath');
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await db.insertForm(
        FormCompanion(
          quarter: drift.Value(switch (neighborhood!) {
            0 => 'Lakouroussou',
            1 => 'Yantala',
            _ => 'Wadata'
          }),
          firstName: drift.Value(firstNameController.text),
          lastName: drift.Value(lastNameController.text),
          phoneNumber:
              drift.Value(contactController.text.replaceAll(' ', '').trim()),
          location: drift.Value(locationController.text),
          sexe: drift.Value((sexe == 0) ? 'M' : 'F'),
          age: drift.Value(int.tryParse(ageController.text)),
          birthdate: drift.Value(birthdateController.text),
          numberOfDependents:
              drift.Value(int.tryParse(numberOfDependentsController.text)),
          urlImage: drift.Value(_selectedIdentityPhoto?.path),
          urlIdCard: drift.Value(_selectedIdCard?.path),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulaire soumis avec succès !')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:
            Text('Formulaire', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField<int>(
                  value: neighborhood,
                  decoration: InputDecoration(
                    labelText: 'Quartier',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  items: [
                    DropdownMenuItem(value: 0, child: Text('Lakouroussou')),
                    DropdownMenuItem(value: 1, child: Text('Yantala')),
                    DropdownMenuItem(value: 2, child: Text('Wadata')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      neighborhood = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Emplacement',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'SVP, entrez votre Emplacement';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'SVP, entrez votre Prénom';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'SVP, entrez votre nom';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: contactController,
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [TelephoneNumberFormatter()],
                  decoration: InputDecoration(
                    labelText: 'Contact',
                    counter: const SizedBox.shrink(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<int>(
                  value: sexe,
                  decoration: InputDecoration(
                    labelText: 'Sexe',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  items: [
                    DropdownMenuItem(value: 0, child: Text('Masculin')),
                    DropdownMenuItem(value: 1, child: Text('Féminin')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      sexe = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null &&
                        int.tryParse(value) == null &&
                        value.isNotEmpty) {
                      return 'SVP, entrez votre âge';
                    }
                    if (value!.trim() !=
                        (DateTime.now().year - _selectedDate!.year)
                            .toString()
                            .trim()) {
                      return 'L\'âge et la date de naissance ne correspondent pas';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: birthdateController,
                  decoration: InputDecoration(
                    labelText: 'Date naissance',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  validator: (value) {
                    if ((DateTime.now().year -
                                DateFormat("dd-MM-yyyy")
                                    .parse(value!.trim())
                                    .year)
                            .toString()
                            .trim() !=
                        ageController.text.trim()) {
                      return 'La date de naissance ne correspond pas à cet âge';
                    }
                    return null;
                  },
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                        birthdateController.text = DateFormat(
                          'dd-MM-yyyy',
                        ).format(_selectedDate!);
                      });
                    }
                  },
                ),
                SizedBox(height: 10),

                TextFormField(
                  controller: numberOfDependentsController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de personnes à charge',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null &&
                        int.tryParse(value) == null &&
                        value.isNotEmpty) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Photo d'identité
                Row(
                  children: [
                    Icon(Icons.photo, color: Theme.of(context).primaryColor),
                    SizedBox(width: 8),
                    Text('Photo d\'identité',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(true, true),
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(width: 8),
                          Text('Prendre Image'),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    _selectedIdentityPhoto == null
                        ? Text('Aucune image prise')
                        : Image.file(_selectedIdentityPhoto!, height: 150),
                  ],
                ),
                SizedBox(height: 12),

                Row(
                  children: [
                    Icon(Icons.card_membership,
                        color: Theme.of(context).primaryColor),
                    SizedBox(width: 8),
                    Text('Pièce d\'identité',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(true, false),
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(width: 8),
                          Text('Prendre Image'),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    _selectedIdCard == null
                        ? Text('Aucune image prise')
                        : Image.file(_selectedIdCard!, height: 150),
                  ],
                ),
                SizedBox(height: 48),

                // Bouton d'enregistrement
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primaryContainer),
                    padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(vertical: 14, horizontal: 48)),
                  ),
                  onPressed: _submitForm,
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
