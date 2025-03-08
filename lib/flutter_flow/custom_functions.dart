import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool validatorSms(String sms) {
  if (sms.length >= 6) {
    return true;
  } else {
    return false;
  }
}

String? plusText(
  String? text1,
  String? text2,
) {
  return '$text1 (гос.номер: $text2)';
}

DateTime? timeInOrder(DateTime? startDataTime) {
  if (startDataTime != null) {
    return startDataTime.add(Duration(hours: 1));
  }
  return null;
}

int? returnIntenger(double? slider) {
  // get double and  return Intenger
  if (slider == null) {
    return null;
  } else {
    return slider.toInt();
  }
}

bool? returnMaxSumm(
  String? priceTeh,
  String? inputSumm,
) {
  if (priceTeh == null || inputSumm == null) {
    // Вернуть null, если один из аргументов равен null
    return null;
  }

  double order = double.tryParse(priceTeh) ?? 0;
  double input = double.tryParse(inputSumm) ?? 0;

  return input <= order;
}

int? returnHourInt(String? rate) {
  if (rate == null) {
    return null;
  }

  final regex = RegExp(r'\d+');
  final match = regex.firstMatch(rate);

  if (match != null) {
    return int.tryParse(match.group(0) ?? '');
  }

  return null;
}

String? onlyNumber(String? number) {
  if (number == null) {
    return null;
  }

  // Удаляем все символы, кроме цифр
  String cleanedNumber = number.replaceAll(RegExp(r'[^0-9]'), '');

  return cleanedNumber;
}

List<String>? getUnikumClass(List<String>? values) {
  if (values == null || values.isEmpty) return ['Ничего нет'];

  var uniqueValues = values.where((value) => value.isNotEmpty).toSet().toList();

  return uniqueValues.isEmpty ? ['Ничего нет'] : uniqueValues;
}

bool checkInList(
  String value,
  List<SelectedDopStruct> listDop,
) {
  return listDop.any((dop) => dop.dopName == value);
}

int getSumm(List<int>? values) {
  if (values == null || values.isEmpty) return 0;

  return values.fold(0, (sum, value) => sum + value);
}

List<SpravochnikTekhnikaRecord>? getListTehknik(
  String? classTeh,
  String? typeTeh,
  String? kindTeh,
  String? modelTeh,
  List<SpravochnikTekhnikaRecord>? docsTeh,
) {
  if (docsTeh == null || docsTeh.isEmpty) {
    return [];
  }

  List<SpravochnikTekhnikaRecord> filteredList = docsTeh;

  // Фильтрация по class_tehnik, если оно не пустое и не "Ничего не найдено"
  if (classTeh != null &&
      classTeh.isNotEmpty &&
      classTeh != "Ничего не найдено") {
    filteredList =
        filteredList.where((doc) => doc.classTehnik == classTeh).toList();
  }

  // Фильтрация по type_tehnik, если оно не пустое и не "Ничего не найдено"
  if (typeTeh != null && typeTeh.isNotEmpty && typeTeh != "Ничего не найдено") {
    filteredList =
        filteredList.where((doc) => doc.typeTehnik == typeTeh).toList();
  }

  // Фильтрация по kind_tehnik, если оно не пустое и не "Ничего не найдено"
  if (kindTeh != null && kindTeh.isNotEmpty && kindTeh != "Ничего не найдено") {
    filteredList =
        filteredList.where((doc) => doc.kindTehnik == kindTeh).toList();
  }

  // Фильтрация по model_tehnik, если оно не пустое и не "Ничего не найдено"
  if (modelTeh != null &&
      modelTeh.isNotEmpty &&
      modelTeh != "Ничего не найдено") {
    filteredList =
        filteredList.where((doc) => doc.modelTehnik == modelTeh).toList();
  }

  return filteredList;
}

List<OrdersRecord>? sortOrders(
  List<OrdersRecord>? orders,
  String? sortBy,
) {
  if (orders == null) return null;

  switch (sortBy) {
    case '1':
      // Сортировка по полю orderNumber (по убыванию), игнорируя null
      orders.sort((a, b) => (b.orderNumber ?? 0).compareTo(a.orderNumber ?? 0));
      break;
    case '2':
      // Сортировка по полю startTime (от раннего к позднему), игнорируя null
      orders.sort((a, b) {
        final aTime = a.startTime ?? DateTime(0);
        final bTime = b.startTime ?? DateTime(0);
        return aTime.compareTo(bTime);
      });
      break;
    case '3':
      // Сортировка по полю orderPriceMinusNacenka (по возрастанию), игнорируя null
      orders.sort((a, b) => (a.orderPriceMinusNacenka ?? 0)
          .compareTo(b.orderPriceMinusNacenka ?? 0));
      break;
    case '4':
      // Сортировка по полю orderPriceMinusNacenka (по убыванию), игнорируя null
      orders.sort((a, b) => (b.orderPriceMinusNacenka ?? 0)
          .compareTo(a.orderPriceMinusNacenka ?? 0));
      break;
    default:
      return orders;
  }

  return orders;
}

List<DocumentReference>? addListRefferance(List<String> references) {
  if (references.isEmpty) {
    return null;
  }

  /// Преобразуем идентификаторы в `DocumentReference`
  return references.map((id) {
    // Формируем путь, например: 'users/<id>/dop_oborud'
    final path = 'users/$id/dop_oborud';
    return FirebaseFirestore.instance.doc(path);
  }).toList();
}

bool filterbySearch(
  String? searchField,
  String? classT,
  String? typeT,
  String? kindT,
) {
  // Если строка поиска пуста, сразу возвращаем true
  if (searchField == null || searchField.isEmpty) {
    return true; // Если searchField пусто или null, возвращаем true
  }

  // Преобразуем строку поиска и поля в нижний регистр для нечувствительности к регистру
  String searchLower = searchField.toLowerCase();
  String classLower = classT?.toLowerCase() ??
      ''; // Если classT null, то используем пустую строку
  String typeLower = typeT?.toLowerCase() ??
      ''; // Если typeT null, то используем пустую строку
  String kindLower = kindT?.toLowerCase() ??
      ''; // Если kindT null, то используем пустую строку

  // Проверяем, содержится ли строка поиска как подстрока в одном из полей
  if (classLower.contains(searchLower) ||
      typeLower.contains(searchLower) ||
      kindLower.contains(searchLower)) {
    return true; // Если есть совпадение, возвращаем true
  }

  // Если совпадений нет, возвращаем false
  return false;
}

int? stringtoInt(String? stringValue) {
  if (stringValue == null) {
    return null;
  }
  return int.tryParse(stringValue);
}
