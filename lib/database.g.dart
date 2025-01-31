// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FormTable extends Form with TableInfo<$FormTable, FormData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _quarterMeta =
      const VerificationMeta('quarter');
  @override
  late final GeneratedColumn<String> quarter = GeneratedColumn<String>(
      'quarter', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
      'account_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sexeMeta = const VerificationMeta('sexe');
  @override
  late final GeneratedColumn<String> sexe = GeneratedColumn<String>(
      'sexe', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 1),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _birthdateMeta =
      const VerificationMeta('birthdate');
  @override
  late final GeneratedColumn<String> birthdate = GeneratedColumn<String>(
      'birthdate', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _urlImageMeta =
      const VerificationMeta('urlImage');
  @override
  late final GeneratedColumn<String> urlImage = GeneratedColumn<String>(
      'url_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlIdCardMeta =
      const VerificationMeta('urlIdCard');
  @override
  late final GeneratedColumn<String> urlIdCard = GeneratedColumn<String>(
      'url_id_card', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        quarter,
        location,
        accountType,
        firstName,
        lastName,
        phoneNumber,
        sexe,
        age,
        birthdate,
        createdAt,
        urlImage,
        urlIdCard
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'form';
  @override
  VerificationContext validateIntegrity(Insertable<FormData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quarter')) {
      context.handle(_quarterMeta,
          quarter.isAcceptableOrUnknown(data['quarter']!, _quarterMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('sexe')) {
      context.handle(
          _sexeMeta, sexe.isAcceptableOrUnknown(data['sexe']!, _sexeMeta));
    } else if (isInserting) {
      context.missing(_sexeMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('birthdate')) {
      context.handle(_birthdateMeta,
          birthdate.isAcceptableOrUnknown(data['birthdate']!, _birthdateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('url_image')) {
      context.handle(_urlImageMeta,
          urlImage.isAcceptableOrUnknown(data['url_image']!, _urlImageMeta));
    }
    if (data.containsKey('url_id_card')) {
      context.handle(
          _urlIdCardMeta,
          urlIdCard.isAcceptableOrUnknown(
              data['url_id_card']!, _urlIdCardMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FormData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FormData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      quarter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quarter']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      accountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_type']),
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      sexe: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sexe'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      birthdate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}birthdate']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      urlImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_image']),
      urlIdCard: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_id_card']),
    );
  }

  @override
  $FormTable createAlias(String alias) {
    return $FormTable(attachedDatabase, alias);
  }
}

class FormData extends DataClass implements Insertable<FormData> {
  final int id;
  final String? quarter;
  final String? location;
  final String? accountType;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String sexe;
  final int? age;
  final String? birthdate;
  final DateTime? createdAt;
  final String? urlImage;
  final String? urlIdCard;
  const FormData(
      {required this.id,
      this.quarter,
      this.location,
      this.accountType,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      required this.sexe,
      this.age,
      this.birthdate,
      this.createdAt,
      this.urlImage,
      this.urlIdCard});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || quarter != null) {
      map['quarter'] = Variable<String>(quarter);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || accountType != null) {
      map['account_type'] = Variable<String>(accountType);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['sexe'] = Variable<String>(sexe);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || birthdate != null) {
      map['birthdate'] = Variable<String>(birthdate);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || urlImage != null) {
      map['url_image'] = Variable<String>(urlImage);
    }
    if (!nullToAbsent || urlIdCard != null) {
      map['url_id_card'] = Variable<String>(urlIdCard);
    }
    return map;
  }

  FormCompanion toCompanion(bool nullToAbsent) {
    return FormCompanion(
      id: Value(id),
      quarter: quarter == null && nullToAbsent
          ? const Value.absent()
          : Value(quarter),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      accountType: accountType == null && nullToAbsent
          ? const Value.absent()
          : Value(accountType),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      sexe: Value(sexe),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      birthdate: birthdate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthdate),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      urlImage: urlImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlImage),
      urlIdCard: urlIdCard == null && nullToAbsent
          ? const Value.absent()
          : Value(urlIdCard),
    );
  }

  factory FormData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FormData(
      id: serializer.fromJson<int>(json['id']),
      quarter: serializer.fromJson<String?>(json['quarter']),
      location: serializer.fromJson<String?>(json['location']),
      accountType: serializer.fromJson<String?>(json['accountType']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      sexe: serializer.fromJson<String>(json['sexe']),
      age: serializer.fromJson<int?>(json['age']),
      birthdate: serializer.fromJson<String?>(json['birthdate']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      urlImage: serializer.fromJson<String?>(json['urlImage']),
      urlIdCard: serializer.fromJson<String?>(json['urlIdCard']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quarter': serializer.toJson<String?>(quarter),
      'location': serializer.toJson<String?>(location),
      'accountType': serializer.toJson<String?>(accountType),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'sexe': serializer.toJson<String>(sexe),
      'age': serializer.toJson<int?>(age),
      'birthdate': serializer.toJson<String?>(birthdate),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'urlImage': serializer.toJson<String?>(urlImage),
      'urlIdCard': serializer.toJson<String?>(urlIdCard),
    };
  }

  FormData copyWith(
          {int? id,
          Value<String?> quarter = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> accountType = const Value.absent(),
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          String? sexe,
          Value<int?> age = const Value.absent(),
          Value<String?> birthdate = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<String?> urlImage = const Value.absent(),
          Value<String?> urlIdCard = const Value.absent()}) =>
      FormData(
        id: id ?? this.id,
        quarter: quarter.present ? quarter.value : this.quarter,
        location: location.present ? location.value : this.location,
        accountType: accountType.present ? accountType.value : this.accountType,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        sexe: sexe ?? this.sexe,
        age: age.present ? age.value : this.age,
        birthdate: birthdate.present ? birthdate.value : this.birthdate,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        urlImage: urlImage.present ? urlImage.value : this.urlImage,
        urlIdCard: urlIdCard.present ? urlIdCard.value : this.urlIdCard,
      );
  FormData copyWithCompanion(FormCompanion data) {
    return FormData(
      id: data.id.present ? data.id.value : this.id,
      quarter: data.quarter.present ? data.quarter.value : this.quarter,
      location: data.location.present ? data.location.value : this.location,
      accountType:
          data.accountType.present ? data.accountType.value : this.accountType,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      sexe: data.sexe.present ? data.sexe.value : this.sexe,
      age: data.age.present ? data.age.value : this.age,
      birthdate: data.birthdate.present ? data.birthdate.value : this.birthdate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      urlImage: data.urlImage.present ? data.urlImage.value : this.urlImage,
      urlIdCard: data.urlIdCard.present ? data.urlIdCard.value : this.urlIdCard,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FormData(')
          ..write('id: $id, ')
          ..write('quarter: $quarter, ')
          ..write('location: $location, ')
          ..write('accountType: $accountType, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('sexe: $sexe, ')
          ..write('age: $age, ')
          ..write('birthdate: $birthdate, ')
          ..write('createdAt: $createdAt, ')
          ..write('urlImage: $urlImage, ')
          ..write('urlIdCard: $urlIdCard')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      quarter,
      location,
      accountType,
      firstName,
      lastName,
      phoneNumber,
      sexe,
      age,
      birthdate,
      createdAt,
      urlImage,
      urlIdCard);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormData &&
          other.id == this.id &&
          other.quarter == this.quarter &&
          other.location == this.location &&
          other.accountType == this.accountType &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.phoneNumber == this.phoneNumber &&
          other.sexe == this.sexe &&
          other.age == this.age &&
          other.birthdate == this.birthdate &&
          other.createdAt == this.createdAt &&
          other.urlImage == this.urlImage &&
          other.urlIdCard == this.urlIdCard);
}

class FormCompanion extends UpdateCompanion<FormData> {
  final Value<int> id;
  final Value<String?> quarter;
  final Value<String?> location;
  final Value<String?> accountType;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> phoneNumber;
  final Value<String> sexe;
  final Value<int?> age;
  final Value<String?> birthdate;
  final Value<DateTime?> createdAt;
  final Value<String?> urlImage;
  final Value<String?> urlIdCard;
  const FormCompanion({
    this.id = const Value.absent(),
    this.quarter = const Value.absent(),
    this.location = const Value.absent(),
    this.accountType = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.sexe = const Value.absent(),
    this.age = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.urlImage = const Value.absent(),
    this.urlIdCard = const Value.absent(),
  });
  FormCompanion.insert({
    this.id = const Value.absent(),
    this.quarter = const Value.absent(),
    this.location = const Value.absent(),
    this.accountType = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    required String sexe,
    this.age = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.urlImage = const Value.absent(),
    this.urlIdCard = const Value.absent(),
  }) : sexe = Value(sexe);
  static Insertable<FormData> custom({
    Expression<int>? id,
    Expression<String>? quarter,
    Expression<String>? location,
    Expression<String>? accountType,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? phoneNumber,
    Expression<String>? sexe,
    Expression<int>? age,
    Expression<String>? birthdate,
    Expression<DateTime>? createdAt,
    Expression<String>? urlImage,
    Expression<String>? urlIdCard,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quarter != null) 'quarter': quarter,
      if (location != null) 'location': location,
      if (accountType != null) 'account_type': accountType,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (sexe != null) 'sexe': sexe,
      if (age != null) 'age': age,
      if (birthdate != null) 'birthdate': birthdate,
      if (createdAt != null) 'created_at': createdAt,
      if (urlImage != null) 'url_image': urlImage,
      if (urlIdCard != null) 'url_id_card': urlIdCard,
    });
  }

  FormCompanion copyWith(
      {Value<int>? id,
      Value<String?>? quarter,
      Value<String?>? location,
      Value<String?>? accountType,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? phoneNumber,
      Value<String>? sexe,
      Value<int?>? age,
      Value<String?>? birthdate,
      Value<DateTime?>? createdAt,
      Value<String?>? urlImage,
      Value<String?>? urlIdCard}) {
    return FormCompanion(
      id: id ?? this.id,
      quarter: quarter ?? this.quarter,
      location: location ?? this.location,
      accountType: accountType ?? this.accountType,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      sexe: sexe ?? this.sexe,
      age: age ?? this.age,
      birthdate: birthdate ?? this.birthdate,
      createdAt: createdAt ?? this.createdAt,
      urlImage: urlImage ?? this.urlImage,
      urlIdCard: urlIdCard ?? this.urlIdCard,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quarter.present) {
      map['quarter'] = Variable<String>(quarter.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (sexe.present) {
      map['sexe'] = Variable<String>(sexe.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (birthdate.present) {
      map['birthdate'] = Variable<String>(birthdate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (urlImage.present) {
      map['url_image'] = Variable<String>(urlImage.value);
    }
    if (urlIdCard.present) {
      map['url_id_card'] = Variable<String>(urlIdCard.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormCompanion(')
          ..write('id: $id, ')
          ..write('quarter: $quarter, ')
          ..write('location: $location, ')
          ..write('accountType: $accountType, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('sexe: $sexe, ')
          ..write('age: $age, ')
          ..write('birthdate: $birthdate, ')
          ..write('createdAt: $createdAt, ')
          ..write('urlImage: $urlImage, ')
          ..write('urlIdCard: $urlIdCard')
          ..write(')'))
        .toString();
  }
}

class $GroupTable extends Group with TableInfo<$GroupTable, GroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group';
  @override
  VerificationContext validateIntegrity(Insertable<GroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  GroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $GroupTable createAlias(String alias) {
    return $GroupTable(attachedDatabase, alias);
  }
}

class GroupData extends DataClass implements Insertable<GroupData> {
  final int id;
  const GroupData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  GroupCompanion toCompanion(bool nullToAbsent) {
    return GroupCompanion(
      id: Value(id),
    );
  }

  factory GroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  GroupData copyWith({int? id}) => GroupData(
        id: id ?? this.id,
      );
  GroupData copyWithCompanion(GroupCompanion data) {
    return GroupData(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is GroupData && other.id == this.id);
}

class GroupCompanion extends UpdateCompanion<GroupData> {
  final Value<int> id;
  final Value<int> rowid;
  const GroupCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupCompanion.insert({
    required int id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<GroupData> custom({
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupCompanion copyWith({Value<int>? id, Value<int>? rowid}) {
    return GroupCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupCompanion(')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $FormTable form = $FormTable(this);
  late final $GroupTable group = $GroupTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [form, group];
}

typedef $$FormTableCreateCompanionBuilder = FormCompanion Function({
  Value<int> id,
  Value<String?> quarter,
  Value<String?> location,
  Value<String?> accountType,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> phoneNumber,
  required String sexe,
  Value<int?> age,
  Value<String?> birthdate,
  Value<DateTime?> createdAt,
  Value<String?> urlImage,
  Value<String?> urlIdCard,
});
typedef $$FormTableUpdateCompanionBuilder = FormCompanion Function({
  Value<int> id,
  Value<String?> quarter,
  Value<String?> location,
  Value<String?> accountType,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> phoneNumber,
  Value<String> sexe,
  Value<int?> age,
  Value<String?> birthdate,
  Value<DateTime?> createdAt,
  Value<String?> urlImage,
  Value<String?> urlIdCard,
});

class $$FormTableFilterComposer extends Composer<_$Database, $FormTable> {
  $$FormTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get quarter => $composableBuilder(
      column: $table.quarter, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sexe => $composableBuilder(
      column: $table.sexe, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get birthdate => $composableBuilder(
      column: $table.birthdate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlImage => $composableBuilder(
      column: $table.urlImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlIdCard => $composableBuilder(
      column: $table.urlIdCard, builder: (column) => ColumnFilters(column));
}

class $$FormTableOrderingComposer extends Composer<_$Database, $FormTable> {
  $$FormTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quarter => $composableBuilder(
      column: $table.quarter, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sexe => $composableBuilder(
      column: $table.sexe, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get birthdate => $composableBuilder(
      column: $table.birthdate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlImage => $composableBuilder(
      column: $table.urlImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlIdCard => $composableBuilder(
      column: $table.urlIdCard, builder: (column) => ColumnOrderings(column));
}

class $$FormTableAnnotationComposer extends Composer<_$Database, $FormTable> {
  $$FormTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get quarter =>
      $composableBuilder(column: $table.quarter, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get sexe =>
      $composableBuilder(column: $table.sexe, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get birthdate =>
      $composableBuilder(column: $table.birthdate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get urlImage =>
      $composableBuilder(column: $table.urlImage, builder: (column) => column);

  GeneratedColumn<String> get urlIdCard =>
      $composableBuilder(column: $table.urlIdCard, builder: (column) => column);
}

class $$FormTableTableManager extends RootTableManager<
    _$Database,
    $FormTable,
    FormData,
    $$FormTableFilterComposer,
    $$FormTableOrderingComposer,
    $$FormTableAnnotationComposer,
    $$FormTableCreateCompanionBuilder,
    $$FormTableUpdateCompanionBuilder,
    (FormData, BaseReferences<_$Database, $FormTable, FormData>),
    FormData,
    PrefetchHooks Function()> {
  $$FormTableTableManager(_$Database db, $FormTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FormTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> quarter = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> accountType = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<String> sexe = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<String?> birthdate = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<String?> urlImage = const Value.absent(),
            Value<String?> urlIdCard = const Value.absent(),
          }) =>
              FormCompanion(
            id: id,
            quarter: quarter,
            location: location,
            accountType: accountType,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            sexe: sexe,
            age: age,
            birthdate: birthdate,
            createdAt: createdAt,
            urlImage: urlImage,
            urlIdCard: urlIdCard,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> quarter = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> accountType = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            required String sexe,
            Value<int?> age = const Value.absent(),
            Value<String?> birthdate = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<String?> urlImage = const Value.absent(),
            Value<String?> urlIdCard = const Value.absent(),
          }) =>
              FormCompanion.insert(
            id: id,
            quarter: quarter,
            location: location,
            accountType: accountType,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            sexe: sexe,
            age: age,
            birthdate: birthdate,
            createdAt: createdAt,
            urlImage: urlImage,
            urlIdCard: urlIdCard,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FormTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $FormTable,
    FormData,
    $$FormTableFilterComposer,
    $$FormTableOrderingComposer,
    $$FormTableAnnotationComposer,
    $$FormTableCreateCompanionBuilder,
    $$FormTableUpdateCompanionBuilder,
    (FormData, BaseReferences<_$Database, $FormTable, FormData>),
    FormData,
    PrefetchHooks Function()>;
typedef $$GroupTableCreateCompanionBuilder = GroupCompanion Function({
  required int id,
  Value<int> rowid,
});
typedef $$GroupTableUpdateCompanionBuilder = GroupCompanion Function({
  Value<int> id,
  Value<int> rowid,
});

class $$GroupTableFilterComposer extends Composer<_$Database, $GroupTable> {
  $$GroupTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));
}

class $$GroupTableOrderingComposer extends Composer<_$Database, $GroupTable> {
  $$GroupTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));
}

class $$GroupTableAnnotationComposer extends Composer<_$Database, $GroupTable> {
  $$GroupTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $$GroupTableTableManager extends RootTableManager<
    _$Database,
    $GroupTable,
    GroupData,
    $$GroupTableFilterComposer,
    $$GroupTableOrderingComposer,
    $$GroupTableAnnotationComposer,
    $$GroupTableCreateCompanionBuilder,
    $$GroupTableUpdateCompanionBuilder,
    (GroupData, BaseReferences<_$Database, $GroupTable, GroupData>),
    GroupData,
    PrefetchHooks Function()> {
  $$GroupTableTableManager(_$Database db, $GroupTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupCompanion(
            id: id,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupCompanion.insert(
            id: id,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $GroupTable,
    GroupData,
    $$GroupTableFilterComposer,
    $$GroupTableOrderingComposer,
    $$GroupTableAnnotationComposer,
    $$GroupTableCreateCompanionBuilder,
    $$GroupTableUpdateCompanionBuilder,
    (GroupData, BaseReferences<_$Database, $GroupTable, GroupData>),
    GroupData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$FormTableTableManager get form => $$FormTableTableManager(_db, _db.form);
  $$GroupTableTableManager get group =>
      $$GroupTableTableManager(_db, _db.group);
}
