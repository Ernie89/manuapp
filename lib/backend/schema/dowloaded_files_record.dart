import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DowloadedFilesRecord extends FirestoreRecord {
  DowloadedFilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "FileName" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  bool hasFileName() => _fileName != null;

  // "DownloadURL" field.
  String? _downloadURL;
  String get downloadURL => _downloadURL ?? '';
  bool hasDownloadURL() => _downloadURL != null;

  // "UploadTimestamp" field.
  DateTime? _uploadTimestamp;
  DateTime? get uploadTimestamp => _uploadTimestamp;
  bool hasUploadTimestamp() => _uploadTimestamp != null;

  // "FileType" field.
  String? _fileType;
  String get fileType => _fileType ?? '';
  bool hasFileType() => _fileType != null;

  // "SoundFile" field.
  String? _soundFile;
  String get soundFile => _soundFile ?? '';
  bool hasSoundFile() => _soundFile != null;

  // "DocumentURL" field.
  String? _documentURL;
  String get documentURL => _documentURL ?? '';
  bool hasDocumentURL() => _documentURL != null;

  void _initializeFields() {
    _fileName = snapshotData['FileName'] as String?;
    _downloadURL = snapshotData['DownloadURL'] as String?;
    _uploadTimestamp = snapshotData['UploadTimestamp'] as DateTime?;
    _fileType = snapshotData['FileType'] as String?;
    _soundFile = snapshotData['SoundFile'] as String?;
    _documentURL = snapshotData['DocumentURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DowloadedFiles');

  static Stream<DowloadedFilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DowloadedFilesRecord.fromSnapshot(s));

  static Future<DowloadedFilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DowloadedFilesRecord.fromSnapshot(s));

  static DowloadedFilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DowloadedFilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DowloadedFilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DowloadedFilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DowloadedFilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DowloadedFilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDowloadedFilesRecordData({
  String? fileName,
  String? downloadURL,
  DateTime? uploadTimestamp,
  String? fileType,
  String? soundFile,
  String? documentURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FileName': fileName,
      'DownloadURL': downloadURL,
      'UploadTimestamp': uploadTimestamp,
      'FileType': fileType,
      'SoundFile': soundFile,
      'DocumentURL': documentURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class DowloadedFilesRecordDocumentEquality
    implements Equality<DowloadedFilesRecord> {
  const DowloadedFilesRecordDocumentEquality();

  @override
  bool equals(DowloadedFilesRecord? e1, DowloadedFilesRecord? e2) {
    return e1?.fileName == e2?.fileName &&
        e1?.downloadURL == e2?.downloadURL &&
        e1?.uploadTimestamp == e2?.uploadTimestamp &&
        e1?.fileType == e2?.fileType &&
        e1?.soundFile == e2?.soundFile &&
        e1?.documentURL == e2?.documentURL;
  }

  @override
  int hash(DowloadedFilesRecord? e) => const ListEquality().hash([
        e?.fileName,
        e?.downloadURL,
        e?.uploadTimestamp,
        e?.fileType,
        e?.soundFile,
        e?.documentURL
      ]);

  @override
  bool isValidKey(Object? o) => o is DowloadedFilesRecord;
}
