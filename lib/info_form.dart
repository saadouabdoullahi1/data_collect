import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InfoForm extends StatefulWidget {
  const InfoForm({super.key});

  @override
  State<InfoForm> createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController numberOfDependentsController =
      TextEditingController();

  int? sexe;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final data = {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'contact': contactController.text,
        'sexe': sexe,
        'age': int.tryParse(ageController.text),
        'birthdate': birthdateController.text,
        'numberOfDependents': int.tryParse(numberOfDependentsController.text),
        'urlImage': _selectedImage?.path,
      };

      print('Données soumises : $data');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulaire soumis avec succès !')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Person Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(labelText: 'Contact'),
                ),
                DropdownButtonFormField<int>(
                  value: sexe,
                  decoration: InputDecoration(labelText: 'Sex'),
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
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null &&
                        int.tryParse(value) == null &&
                        value.isNotEmpty) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: birthdateController,
                  decoration: InputDecoration(labelText: 'Date naissance'),
                  keyboardType: TextInputType.datetime,
                ),
                TextFormField(
                  controller: numberOfDependentsController,
                  decoration: InputDecoration(labelText: 'Nombre de personnes à charge'),
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
                const SizedBox(height: 16),
                _selectedImage == null
                    ? Text('aucune image selectionnée')
                    : Image.file(_selectedImage!, height: 150),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Choisir Image'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
