import 'dart:io';

import 'package:data_collect/database.dart' as db;
import 'package:data_collect/edit_info_form.dart';
import 'package:flutter/material.dart';

class FormInfoScreen extends StatefulWidget {
  final db.FormData form;
  const FormInfoScreen({super.key, required this.form});

  @override
  State<FormInfoScreen> createState() => _FormInfoScreenState();
}

class _FormInfoScreenState extends State<FormInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final form = widget.form;
    final child = Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Container(
                height: 120,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  color: const Color.fromARGB(255, 202, 201, 201),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.7),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child:(!(form.urlImage==null))? Image.file(
                      File(form.urlImage!),
                      width: 120,
                    ):Icon(Icons.person,size: 100,),
                  ),
                ),
              ),
              Positioned(
                top: 125,
                right: 20,
                child: OutlinedButton(
                    style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(2),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
                        side: WidgetStatePropertyAll(BorderSide(
                            color:
                                Theme.of(context).colorScheme.inversePrimary))),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => EditInfoForm(form: form),
                        ),
                      );
                    },
                    child: Text(
                      'Modifier',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${form.lastName} ${form.firstName}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              const SizedBox(height: 6),
              Table(children: [
                TableRow(children: [
                  Text(
                    "Date de naissance",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  Text(
                    "Age",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "${form.birthdate}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    form.age.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "Contact",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  Text(
                    "Sexe",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    form.phoneNumber!
                        .splitMapJoin(RegExp(r'.{1,2}'),
                            onMatch: (math) => '${math.group(0)} ')
                        .trim(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    (form.sexe == 'F') ? 'Féminin' : 'Masculin',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "Quartier",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  Text(
                    "Emplacement",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    form.quarter!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    form.location!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ]),
                TableRow(children: [
                  
                  Text(
                    "Type produit",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),Text(
                    "",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ]),
                TableRow(children: [
                  
                  Text(
                    form.accountType!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),Text(
                    '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ]),
              ]),
            ],
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Form Info',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
