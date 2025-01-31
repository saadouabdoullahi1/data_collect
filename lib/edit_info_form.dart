import 'package:data_collect/database.dart';
import 'package:data_collect/main.dart';
import 'package:data_collect/utils.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditInfoForm extends StatefulWidget {
  final FormData form;
  const EditInfoForm({super.key, required this.form});

  @override
  State<EditInfoForm> createState() => _EditInfoFormState();
}

class _EditInfoFormState extends State<EditInfoForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController locationController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController contactController;
  late final TextEditingController birthdateController;
  late final TextEditingController numberOfDependentsController;
  DateTime? _selectedDate;
  int? neighborhood;
  int? accountType;
  int? sexe;

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await (db.update(db.form)
            ..where((tbl) =>
                tbl.id.equals(widget.form.id)))
          .write(FormCompanion(
              quarter: drift.Value(switch (neighborhood!) {
                0 => 'Lakouroussou',
                1 => 'Yantala',
                _ => 'Wadata'
              }),
              accountType: drift.Value(switch (accountType!) {
                0 => 'Anfani'.toUpperCase(),
                1 => 'Nawa'.toUpperCase(),
                2 => 'Company'.toUpperCase(),
                _ => 'Haske'.toUpperCase()
              }),
              firstName: drift.Value(firstNameController.text),
              lastName: drift.Value(lastNameController.text),
              phoneNumber: drift.Value(
                  contactController.text.replaceAll(' ', '').trim()),
              location: drift.Value(locationController.text),
              sexe: drift.Value((sexe == 0) ? 'M' : 'F'),
              age: drift.Value(int.tryParse(
                (DateTime.now().year - _selectedDate!.year).toString().trim())),
              birthdate: drift.Value(birthdateController.text),
              createdAt: drift.Value(DateTime.now())));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Formulaire soumis avec succès !')),
        );
        Navigator.of(context).pop();
      }
    }
  }

  @override
  void initState() {
    locationController =
        TextEditingController(text: widget.form.location.toString());
    firstNameController =
        TextEditingController(text: widget.form.firstName.toString());
    lastNameController =
        TextEditingController(text: widget.form.lastName.toString());
    contactController =
        TextEditingController(text: widget.form.phoneNumber.toString());
    birthdateController =
        TextEditingController(text: widget.form.birthdate.toString());
       neighborhood = switch (widget.form.quarter) {
      'Lakouroussou' => 0,
      'Yantala' => 1,
      _ => 0
    };
    accountType = switch (widget.form.accountType) {
      'ANFANI' => 0,
      'NAWA' => 1,
      'COMPANY' => 2,
      _ => 3
    };
    sexe = (widget.form.sexe == 'M') ? 0 : 1;
    super.initState();
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
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner le quartier.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<int>(
                  value: accountType,
                  decoration: InputDecoration(
                    labelText: 'Type produit',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  items: [
                    DropdownMenuItem(
                        value: 0, child: Text('Anfani'.toUpperCase())),
                    DropdownMenuItem(
                        value: 1, child: Text('Nawa'.toUpperCase())),
                    DropdownMenuItem(
                        value: 2, child: Text('Company'.toUpperCase())),
                    DropdownMenuItem(
                        value: 3, child: Text('Haske'.toUpperCase())),
                  ],
                  onChanged: (value) {
                    setState(() {
                      accountType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner le type de produit.';
                    }
                    return null;
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'SVP, entrez votre Contact';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner le genre.';
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

                SizedBox(height: 38),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primaryContainer),
                    padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 36)),
                  ),
                  onPressed: () => _submitForm(context),
                  child: Text(
                    'Modifier',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
