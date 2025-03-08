import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _signUpCategory = prefs.getString('ff_signUpCategory') ?? _signUpCategory;
    });
    _safeInit(() {
      _userRole = prefs.getString('ff_userRole') ?? _userRole;
    });
    _safeInit(() {
      _Signature = prefs.getString('ff_Signature') ?? _Signature;
    });
    _safeInit(() {
      _driverGeoStart =
          latLngFromString(prefs.getString('ff_driverGeoStart')) ??
              _driverGeoStart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _signUpCategory = '';
  String get signUpCategory => _signUpCategory;
  set signUpCategory(String value) {
    _signUpCategory = value;
    prefs.setString('ff_signUpCategory', value);
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
  }

  int _menuIndex = 1;
  int get menuIndex => _menuIndex;
  set menuIndex(int value) {
    _menuIndex = value;
  }

  String _menuIndexAdmin = 'Заказы';
  String get menuIndexAdmin => _menuIndexAdmin;
  set menuIndexAdmin(String value) {
    _menuIndexAdmin = value;
  }

  String _userRole = '';
  String get userRole => _userRole;
  set userRole(String value) {
    _userRole = value;
    prefs.setString('ff_userRole', value);
  }

  List<FilterHomeOrdersStruct> _filterHomeOrders = [
    FilterHomeOrdersStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Новый\",\"status\":\"true\"}')),
    FilterHomeOrdersStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"В работе\",\"status\":\"true\"}')),
    FilterHomeOrdersStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Завершён\",\"status\":\"true\"}')),
    FilterHomeOrdersStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Отменён\",\"status\":\"true\"}'))
  ];
  List<FilterHomeOrdersStruct> get filterHomeOrders => _filterHomeOrders;
  set filterHomeOrders(List<FilterHomeOrdersStruct> value) {
    _filterHomeOrders = value;
  }

  void addToFilterHomeOrders(FilterHomeOrdersStruct value) {
    filterHomeOrders.add(value);
  }

  void removeFromFilterHomeOrders(FilterHomeOrdersStruct value) {
    filterHomeOrders.remove(value);
  }

  void removeAtIndexFromFilterHomeOrders(int index) {
    filterHomeOrders.removeAt(index);
  }

  void updateFilterHomeOrdersAtIndex(
    int index,
    FilterHomeOrdersStruct Function(FilterHomeOrdersStruct) updateFn,
  ) {
    filterHomeOrders[index] = updateFn(_filterHomeOrders[index]);
  }

  void insertAtIndexInFilterHomeOrders(
      int index, FilterHomeOrdersStruct value) {
    filterHomeOrders.insert(index, value);
  }

  int _temprCountOffer = 0;
  int get temprCountOffer => _temprCountOffer;
  set temprCountOffer(int value) {
    _temprCountOffer = value;
  }

  FilterHomeProjectStruct _filterHomeProject = FilterHomeProjectStruct();
  FilterHomeProjectStruct get filterHomeProject => _filterHomeProject;
  set filterHomeProject(FilterHomeProjectStruct value) {
    _filterHomeProject = value;
  }

  void updateFilterHomeProjectStruct(
      Function(FilterHomeProjectStruct) updateFn) {
    updateFn(_filterHomeProject);
  }

  bool _filterActiveProject = false;
  bool get filterActiveProject => _filterActiveProject;
  set filterActiveProject(bool value) {
    _filterActiveProject = value;
  }

  String _adress = '';
  String get adress => _adress;
  set adress(String value) {
    _adress = value;
  }

  String _pickedDataaddress = '';
  String get pickedDataaddress => _pickedDataaddress;
  set pickedDataaddress(String value) {
    _pickedDataaddress = value;
  }

  LatLng? _pickedDataaddressLatLong;
  LatLng? get pickedDataaddressLatLong => _pickedDataaddressLatLong;
  set pickedDataaddressLatLong(LatLng? value) {
    _pickedDataaddressLatLong = value;
  }

  String _Signature = '';
  String get Signature => _Signature;
  set Signature(String value) {
    _Signature = value;
    prefs.setString('ff_Signature', value);
  }

  LatLng? _driverGeoStart = LatLng(55, 37);
  LatLng? get driverGeoStart => _driverGeoStart;
  set driverGeoStart(LatLng? value) {
    _driverGeoStart = value;
    value != null
        ? prefs.setString('ff_driverGeoStart', value.serialize())
        : prefs.remove('ff_driverGeoStart');
  }

  List<SelectedDopStruct> _selectedDop = [];
  List<SelectedDopStruct> get selectedDop => _selectedDop;
  set selectedDop(List<SelectedDopStruct> value) {
    _selectedDop = value;
  }

  void addToSelectedDop(SelectedDopStruct value) {
    selectedDop.add(value);
  }

  void removeFromSelectedDop(SelectedDopStruct value) {
    selectedDop.remove(value);
  }

  void removeAtIndexFromSelectedDop(int index) {
    selectedDop.removeAt(index);
  }

  void updateSelectedDopAtIndex(
    int index,
    SelectedDopStruct Function(SelectedDopStruct) updateFn,
  ) {
    selectedDop[index] = updateFn(_selectedDop[index]);
  }

  void insertAtIndexInSelectedDop(int index, SelectedDopStruct value) {
    selectedDop.insert(index, value);
  }

  String _smsCode = '';
  String get smsCode => _smsCode;
  set smsCode(String value) {
    _smsCode = value;
  }

  SelectedTeknikStruct _selectedZakazchiTekhnik = SelectedTeknikStruct();
  SelectedTeknikStruct get selectedZakazchiTekhnik => _selectedZakazchiTekhnik;
  set selectedZakazchiTekhnik(SelectedTeknikStruct value) {
    _selectedZakazchiTekhnik = value;
  }

  void updateSelectedZakazchiTekhnikStruct(
      Function(SelectedTeknikStruct) updateFn) {
    updateFn(_selectedZakazchiTekhnik);
  }

  int _loopController = 0;
  int get loopController => _loopController;
  set loopController(int value) {
    _loopController = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
