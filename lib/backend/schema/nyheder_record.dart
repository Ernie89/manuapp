import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NyhederRecord extends FirestoreRecord {
  NyhederRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Titel" field.
  String? _titel;
  String get titel => _titel ?? '';
  bool hasTitel() => _titel != null;

  // "Indhold" field.
  String? _indhold;
  String get indhold => _indhold ?? '';
  bool hasIndhold() => _indhold != null;

  // "Billede" field.
  String? _billede;
  String get billede => _billede ?? '';
  bool hasBillede() => _billede != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _titel = snapshotData['Titel'] as String?;
    _indhold = snapshotData['Indhold'] as String?;
    _billede = snapshotData['Billede'] as String?;
    _video = snapshotData['Video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Nyheder');

  static Stream<NyhederRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NyhederRecord.fromSnapshot(s));

  static Future<NyhederRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NyhederRecord.fromSnapshot(s));

  static NyhederRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NyhederRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NyhederRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NyhederRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NyhederRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NyhederRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNyhederRecordData({
  String? titel,
  String? indhold,
  String? billede,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titel': titel,
      'Indhold': indhold,
      'Billede': billede,
      'Video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class NyhederRecordDocumentEquality implements Equality<NyhederRecord> {
  const NyhederRecordDocumentEquality();

  @override
  bool equals(NyhederRecord? e1, NyhederRecord? e2) {
    return e1?.titel == e2?.titel &&
        e1?.indhold == e2?.indhold &&
        e1?.billede == e2?.billede &&
        e1?.video == e2?.video;
  }

  @override
  int hash(NyhederRecord? e) =>
      const ListEquality().hash([e?.titel, e?.indhold, e?.billede, e?.video]);

  @override
  bool isValidKey(Object? o) => o is NyhederRecord;
}
