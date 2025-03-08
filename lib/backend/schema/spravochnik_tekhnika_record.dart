import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpravochnikTekhnikaRecord extends FirestoreRecord {
  SpravochnikTekhnikaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "dop_image" field.
  List<String>? _dopImage;
  List<String> get dopImage => _dopImage ?? const [];
  bool hasDopImage() => _dopImage != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  bool hasDiscription() => _discription != null;

  // "sort_by" field.
  int? _sortBy;
  int get sortBy => _sortBy ?? 0;
  bool hasSortBy() => _sortBy != null;

  // "is_show" field.
  bool? _isShow;
  bool get isShow => _isShow ?? false;
  bool hasIsShow() => _isShow != null;

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  bool hasRate() => _rate != null;

  // "class_tehnik" field.
  String? _classTehnik;
  String get classTehnik => _classTehnik ?? '';
  bool hasClassTehnik() => _classTehnik != null;

  // "type_tehnik" field.
  String? _typeTehnik;
  String get typeTehnik => _typeTehnik ?? '';
  bool hasTypeTehnik() => _typeTehnik != null;

  // "kind_tehnik" field.
  String? _kindTehnik;
  String get kindTehnik => _kindTehnik ?? '';
  bool hasKindTehnik() => _kindTehnik != null;

  // "weight_tons" field.
  double? _weightTons;
  double get weightTons => _weightTons ?? 0.0;
  bool hasWeightTons() => _weightTons != null;

  // "blade_width" field.
  double? _bladeWidth;
  double get bladeWidth => _bladeWidth ?? 0.0;
  bool hasBladeWidth() => _bladeWidth != null;

  // "drilling_depth_cm" field.
  double? _drillingDepthCm;
  double get drillingDepthCm => _drillingDepthCm ?? 0.0;
  bool hasDrillingDepthCm() => _drillingDepthCm != null;

  // "lifting_capacity_tons" field.
  double? _liftingCapacityTons;
  double get liftingCapacityTons => _liftingCapacityTons ?? 0.0;
  bool hasLiftingCapacityTons() => _liftingCapacityTons != null;

  // "boom_length" field.
  double? _boomLength;
  double get boomLength => _boomLength ?? 0.0;
  bool hasBoomLength() => _boomLength != null;

  // "feeding_height_m" field.
  double? _feedingHeightM;
  double get feedingHeightM => _feedingHeightM ?? 0.0;
  bool hasFeedingHeightM() => _feedingHeightM != null;

  // "laying_width" field.
  double? _layingWidth;
  double get layingWidth => _layingWidth ?? 0.0;
  bool hasLayingWidth() => _layingWidth != null;

  // "productivity_tph" field.
  double? _productivityTph;
  double get productivityTph => _productivityTph ?? 0.0;
  bool hasProductivityTph() => _productivityTph != null;

  // "feeding_distance" field.
  double? _feedingDistance;
  double get feedingDistance => _feedingDistance ?? 0.0;
  bool hasFeedingDistance() => _feedingDistance != null;

  // "platform_size" field.
  double? _platformSize;
  double get platformSize => _platformSize ?? 0.0;
  bool hasPlatformSize() => _platformSize != null;

  // "productivity_m3h" field.
  double? _productivityM3h;
  double get productivityM3h => _productivityM3h ?? 0.0;
  bool hasProductivityM3h() => _productivityM3h != null;

  // "tank_capacity_m3" field.
  double? _tankCapacityM3;
  double get tankCapacityM3 => _tankCapacityM3 ?? 0.0;
  bool hasTankCapacityM3() => _tankCapacityM3 != null;

  // "power_hp_kw" field.
  double? _powerHpKw;
  double get powerHpKw => _powerHpKw ?? 0.0;
  bool hasPowerHpKw() => _powerHpKw != null;

  // "bucket_volume_m3" field.
  double? _bucketVolumeM3;
  double get bucketVolumeM3 => _bucketVolumeM3 ?? 0.0;
  bool hasBucketVolumeM3() => _bucketVolumeM3 != null;

  // "load_weight_material" field.
  double? _loadWeightMaterial;
  double get loadWeightMaterial => _loadWeightMaterial ?? 0.0;
  bool hasLoadWeightMaterial() => _loadWeightMaterial != null;

  // "platform_size_m" field.
  double? _platformSizeM;
  double get platformSizeM => _platformSizeM ?? 0.0;
  bool hasPlatformSizeM() => _platformSizeM != null;

  // "blade_type" field.
  double? _bladeType;
  double get bladeType => _bladeType ?? 0.0;
  bool hasBladeType() => _bladeType != null;

  // "drilling_diameter_mm" field.
  double? _drillingDiameterMm;
  double get drillingDiameterMm => _drillingDiameterMm ?? 0.0;
  bool hasDrillingDiameterMm() => _drillingDiameterMm != null;

  // "max_pressure" field.
  double? _maxPressure;
  double get maxPressure => _maxPressure ?? 0.0;
  bool hasMaxPressure() => _maxPressure != null;

  // "rotation_frequency" field.
  double? _rotationFrequency;
  double get rotationFrequency => _rotationFrequency ?? 0.0;
  bool hasRotationFrequency() => _rotationFrequency != null;

  // "drilling_diameter_cm" field.
  double? _drillingDiameterCm;
  double get drillingDiameterCm => _drillingDiameterCm ?? 0.0;
  bool hasDrillingDiameterCm() => _drillingDiameterCm != null;

  // "pile_length_m" field.
  double? _pileLengthM;
  double get pileLengthM => _pileLengthM ?? 0.0;
  bool hasPileLengthM() => _pileLengthM != null;

  // "pile_weight_tons" field.
  double? _pileWeightTons;
  double get pileWeightTons => _pileWeightTons ?? 0.0;
  bool hasPileWeightTons() => _pileWeightTons != null;

  // "discharge_height_m" field.
  double? _dischargeHeightM;
  double get dischargeHeightM => _dischargeHeightM ?? 0.0;
  bool hasDischargeHeightM() => _dischargeHeightM != null;

  // "pit_cleaning_depth_m" field.
  double? _pitCleaningDepthM;
  double get pitCleaningDepthM => _pitCleaningDepthM ?? 0.0;
  bool hasPitCleaningDepthM() => _pitCleaningDepthM != null;

  // "min_milling_width_mm" field.
  double? _minMillingWidthMm;
  double get minMillingWidthMm => _minMillingWidthMm ?? 0.0;
  bool hasMinMillingWidthMm() => _minMillingWidthMm != null;

  // "max_milling_width_mm" field.
  double? _maxMillingWidthMm;
  double get maxMillingWidthMm => _maxMillingWidthMm ?? 0.0;
  bool hasMaxMillingWidthMm() => _maxMillingWidthMm != null;

  // "milling_depth_mm" field.
  double? _millingDepthMm;
  double get millingDepthMm => _millingDepthMm ?? 0.0;
  bool hasMillingDepthMm() => _millingDepthMm != null;

  // "working_width" field.
  double? _workingWidth;
  double get workingWidth => _workingWidth ?? 0.0;
  bool hasWorkingWidth() => _workingWidth != null;

  // "roller_type" field.
  String? _rollerType;
  String get rollerType => _rollerType ?? '';
  bool hasRollerType() => _rollerType != null;

  // "vibration" field.
  bool? _vibration;
  bool get vibration => _vibration ?? false;
  bool hasVibration() => _vibration != null;

  // "rate_hour" field.
  int? _rateHour;
  int get rateHour => _rateHour ?? 0;
  bool hasRateHour() => _rateHour != null;

  // "model_tehnik" field.
  String? _modelTehnik;
  String get modelTehnik => _modelTehnik ?? '';
  bool hasModelTehnik() => _modelTehnik != null;

  // "comision" field.
  int? _comision;
  int get comision => _comision ?? 0;
  bool hasComision() => _comision != null;

  void _initializeFields() {
    _mainImage = snapshotData['main_image'] as String?;
    _dopImage = getDataList(snapshotData['dop_image']);
    _discription = snapshotData['discription'] as String?;
    _sortBy = castToType<int>(snapshotData['sort_by']);
    _isShow = snapshotData['is_show'] as bool?;
    _rate = castToType<int>(snapshotData['rate']);
    _classTehnik = snapshotData['class_tehnik'] as String?;
    _typeTehnik = snapshotData['type_tehnik'] as String?;
    _kindTehnik = snapshotData['kind_tehnik'] as String?;
    _weightTons = castToType<double>(snapshotData['weight_tons']);
    _bladeWidth = castToType<double>(snapshotData['blade_width']);
    _drillingDepthCm = castToType<double>(snapshotData['drilling_depth_cm']);
    _liftingCapacityTons =
        castToType<double>(snapshotData['lifting_capacity_tons']);
    _boomLength = castToType<double>(snapshotData['boom_length']);
    _feedingHeightM = castToType<double>(snapshotData['feeding_height_m']);
    _layingWidth = castToType<double>(snapshotData['laying_width']);
    _productivityTph = castToType<double>(snapshotData['productivity_tph']);
    _feedingDistance = castToType<double>(snapshotData['feeding_distance']);
    _platformSize = castToType<double>(snapshotData['platform_size']);
    _productivityM3h = castToType<double>(snapshotData['productivity_m3h']);
    _tankCapacityM3 = castToType<double>(snapshotData['tank_capacity_m3']);
    _powerHpKw = castToType<double>(snapshotData['power_hp_kw']);
    _bucketVolumeM3 = castToType<double>(snapshotData['bucket_volume_m3']);
    _loadWeightMaterial =
        castToType<double>(snapshotData['load_weight_material']);
    _platformSizeM = castToType<double>(snapshotData['platform_size_m']);
    _bladeType = castToType<double>(snapshotData['blade_type']);
    _drillingDiameterMm =
        castToType<double>(snapshotData['drilling_diameter_mm']);
    _maxPressure = castToType<double>(snapshotData['max_pressure']);
    _rotationFrequency = castToType<double>(snapshotData['rotation_frequency']);
    _drillingDiameterCm =
        castToType<double>(snapshotData['drilling_diameter_cm']);
    _pileLengthM = castToType<double>(snapshotData['pile_length_m']);
    _pileWeightTons = castToType<double>(snapshotData['pile_weight_tons']);
    _dischargeHeightM = castToType<double>(snapshotData['discharge_height_m']);
    _pitCleaningDepthM =
        castToType<double>(snapshotData['pit_cleaning_depth_m']);
    _minMillingWidthMm =
        castToType<double>(snapshotData['min_milling_width_mm']);
    _maxMillingWidthMm =
        castToType<double>(snapshotData['max_milling_width_mm']);
    _millingDepthMm = castToType<double>(snapshotData['milling_depth_mm']);
    _workingWidth = castToType<double>(snapshotData['working_width']);
    _rollerType = snapshotData['roller_type'] as String?;
    _vibration = snapshotData['vibration'] as bool?;
    _rateHour = castToType<int>(snapshotData['rate_hour']);
    _modelTehnik = snapshotData['model_tehnik'] as String?;
    _comision = castToType<int>(snapshotData['comision']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('spravochnik_tekhnika');

  static Stream<SpravochnikTekhnikaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpravochnikTekhnikaRecord.fromSnapshot(s));

  static Future<SpravochnikTekhnikaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SpravochnikTekhnikaRecord.fromSnapshot(s));

  static SpravochnikTekhnikaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpravochnikTekhnikaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpravochnikTekhnikaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpravochnikTekhnikaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpravochnikTekhnikaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpravochnikTekhnikaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpravochnikTekhnikaRecordData({
  String? mainImage,
  String? discription,
  int? sortBy,
  bool? isShow,
  int? rate,
  String? classTehnik,
  String? typeTehnik,
  String? kindTehnik,
  double? weightTons,
  double? bladeWidth,
  double? drillingDepthCm,
  double? liftingCapacityTons,
  double? boomLength,
  double? feedingHeightM,
  double? layingWidth,
  double? productivityTph,
  double? feedingDistance,
  double? platformSize,
  double? productivityM3h,
  double? tankCapacityM3,
  double? powerHpKw,
  double? bucketVolumeM3,
  double? loadWeightMaterial,
  double? platformSizeM,
  double? bladeType,
  double? drillingDiameterMm,
  double? maxPressure,
  double? rotationFrequency,
  double? drillingDiameterCm,
  double? pileLengthM,
  double? pileWeightTons,
  double? dischargeHeightM,
  double? pitCleaningDepthM,
  double? minMillingWidthMm,
  double? maxMillingWidthMm,
  double? millingDepthMm,
  double? workingWidth,
  String? rollerType,
  bool? vibration,
  int? rateHour,
  String? modelTehnik,
  int? comision,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'main_image': mainImage,
      'discription': discription,
      'sort_by': sortBy,
      'is_show': isShow,
      'rate': rate,
      'class_tehnik': classTehnik,
      'type_tehnik': typeTehnik,
      'kind_tehnik': kindTehnik,
      'weight_tons': weightTons,
      'blade_width': bladeWidth,
      'drilling_depth_cm': drillingDepthCm,
      'lifting_capacity_tons': liftingCapacityTons,
      'boom_length': boomLength,
      'feeding_height_m': feedingHeightM,
      'laying_width': layingWidth,
      'productivity_tph': productivityTph,
      'feeding_distance': feedingDistance,
      'platform_size': platformSize,
      'productivity_m3h': productivityM3h,
      'tank_capacity_m3': tankCapacityM3,
      'power_hp_kw': powerHpKw,
      'bucket_volume_m3': bucketVolumeM3,
      'load_weight_material': loadWeightMaterial,
      'platform_size_m': platformSizeM,
      'blade_type': bladeType,
      'drilling_diameter_mm': drillingDiameterMm,
      'max_pressure': maxPressure,
      'rotation_frequency': rotationFrequency,
      'drilling_diameter_cm': drillingDiameterCm,
      'pile_length_m': pileLengthM,
      'pile_weight_tons': pileWeightTons,
      'discharge_height_m': dischargeHeightM,
      'pit_cleaning_depth_m': pitCleaningDepthM,
      'min_milling_width_mm': minMillingWidthMm,
      'max_milling_width_mm': maxMillingWidthMm,
      'milling_depth_mm': millingDepthMm,
      'working_width': workingWidth,
      'roller_type': rollerType,
      'vibration': vibration,
      'rate_hour': rateHour,
      'model_tehnik': modelTehnik,
      'comision': comision,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpravochnikTekhnikaRecordDocumentEquality
    implements Equality<SpravochnikTekhnikaRecord> {
  const SpravochnikTekhnikaRecordDocumentEquality();

  @override
  bool equals(SpravochnikTekhnikaRecord? e1, SpravochnikTekhnikaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.dopImage, e2?.dopImage) &&
        e1?.discription == e2?.discription &&
        e1?.sortBy == e2?.sortBy &&
        e1?.isShow == e2?.isShow &&
        e1?.rate == e2?.rate &&
        e1?.classTehnik == e2?.classTehnik &&
        e1?.typeTehnik == e2?.typeTehnik &&
        e1?.kindTehnik == e2?.kindTehnik &&
        e1?.weightTons == e2?.weightTons &&
        e1?.bladeWidth == e2?.bladeWidth &&
        e1?.drillingDepthCm == e2?.drillingDepthCm &&
        e1?.liftingCapacityTons == e2?.liftingCapacityTons &&
        e1?.boomLength == e2?.boomLength &&
        e1?.feedingHeightM == e2?.feedingHeightM &&
        e1?.layingWidth == e2?.layingWidth &&
        e1?.productivityTph == e2?.productivityTph &&
        e1?.feedingDistance == e2?.feedingDistance &&
        e1?.platformSize == e2?.platformSize &&
        e1?.productivityM3h == e2?.productivityM3h &&
        e1?.tankCapacityM3 == e2?.tankCapacityM3 &&
        e1?.powerHpKw == e2?.powerHpKw &&
        e1?.bucketVolumeM3 == e2?.bucketVolumeM3 &&
        e1?.loadWeightMaterial == e2?.loadWeightMaterial &&
        e1?.platformSizeM == e2?.platformSizeM &&
        e1?.bladeType == e2?.bladeType &&
        e1?.drillingDiameterMm == e2?.drillingDiameterMm &&
        e1?.maxPressure == e2?.maxPressure &&
        e1?.rotationFrequency == e2?.rotationFrequency &&
        e1?.drillingDiameterCm == e2?.drillingDiameterCm &&
        e1?.pileLengthM == e2?.pileLengthM &&
        e1?.pileWeightTons == e2?.pileWeightTons &&
        e1?.dischargeHeightM == e2?.dischargeHeightM &&
        e1?.pitCleaningDepthM == e2?.pitCleaningDepthM &&
        e1?.minMillingWidthMm == e2?.minMillingWidthMm &&
        e1?.maxMillingWidthMm == e2?.maxMillingWidthMm &&
        e1?.millingDepthMm == e2?.millingDepthMm &&
        e1?.workingWidth == e2?.workingWidth &&
        e1?.rollerType == e2?.rollerType &&
        e1?.vibration == e2?.vibration &&
        e1?.rateHour == e2?.rateHour &&
        e1?.modelTehnik == e2?.modelTehnik &&
        e1?.comision == e2?.comision;
  }

  @override
  int hash(SpravochnikTekhnikaRecord? e) => const ListEquality().hash([
        e?.mainImage,
        e?.dopImage,
        e?.discription,
        e?.sortBy,
        e?.isShow,
        e?.rate,
        e?.classTehnik,
        e?.typeTehnik,
        e?.kindTehnik,
        e?.weightTons,
        e?.bladeWidth,
        e?.drillingDepthCm,
        e?.liftingCapacityTons,
        e?.boomLength,
        e?.feedingHeightM,
        e?.layingWidth,
        e?.productivityTph,
        e?.feedingDistance,
        e?.platformSize,
        e?.productivityM3h,
        e?.tankCapacityM3,
        e?.powerHpKw,
        e?.bucketVolumeM3,
        e?.loadWeightMaterial,
        e?.platformSizeM,
        e?.bladeType,
        e?.drillingDiameterMm,
        e?.maxPressure,
        e?.rotationFrequency,
        e?.drillingDiameterCm,
        e?.pileLengthM,
        e?.pileWeightTons,
        e?.dischargeHeightM,
        e?.pitCleaningDepthM,
        e?.minMillingWidthMm,
        e?.maxMillingWidthMm,
        e?.millingDepthMm,
        e?.workingWidth,
        e?.rollerType,
        e?.vibration,
        e?.rateHour,
        e?.modelTehnik,
        e?.comision
      ]);

  @override
  bool isValidKey(Object? o) => o is SpravochnikTekhnikaRecord;
}
