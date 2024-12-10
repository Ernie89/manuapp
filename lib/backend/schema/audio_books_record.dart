import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioBooksRecord extends FirestoreRecord {
  AudioBooksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "AudioFile" field.
  String? _audioFile;
  String get audioFile => _audioFile ?? '';
  bool hasAudioFile() => _audioFile != null;

  // "ImageCover" field.
  String? _imageCover;
  String get imageCover => _imageCover ?? '';
  bool hasImageCover() => _imageCover != null;

  // "Audiobook_Title" field.
  String? _audiobookTitle;
  String get audiobookTitle => _audiobookTitle ?? '';
  bool hasAudiobookTitle() => _audiobookTitle != null;

  // "Sprog" field.
  String? _sprog;
  String get sprog => _sprog ?? '';
  bool hasSprog() => _sprog != null;

  // "DownloadURL" field.
  String? _downloadURL;
  String get downloadURL => _downloadURL ?? '';
  bool hasDownloadURL() => _downloadURL != null;

  // "FileName" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  bool hasFileName() => _fileName != null;

  void _initializeFields() {
    _audioFile = snapshotData['AudioFile'] as String?;
    _imageCover = snapshotData['ImageCover'] as String?;
    _audiobookTitle = snapshotData['Audiobook_Title'] as String?;
    _sprog = snapshotData['Sprog'] as String?;
    _downloadURL = snapshotData['DownloadURL'] as String?;
    _fileName = snapshotData['FileName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AudioBooks');

  static Stream<AudioBooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioBooksRecord.fromSnapshot(s));

  static Future<AudioBooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioBooksRecord.fromSnapshot(s));

  static AudioBooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioBooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioBooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioBooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioBooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioBooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioBooksRecordData({
  String? audioFile,
  String? imageCover,
  String? audiobookTitle,
  String? sprog,
  String? downloadURL,
  String? fileName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AudioFile': audioFile,
      'ImageCover': imageCover,
      'Audiobook_Title': audiobookTitle,
      'Sprog': sprog,
      'DownloadURL': downloadURL,
      'FileName': fileName,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioBooksRecordDocumentEquality implements Equality<AudioBooksRecord> {
  const AudioBooksRecordDocumentEquality();

  @override
  bool equals(AudioBooksRecord? e1, AudioBooksRecord? e2) {
    return e1?.audioFile == e2?.audioFile &&
        e1?.imageCover == e2?.imageCover &&
        e1?.audiobookTitle == e2?.audiobookTitle &&
        e1?.sprog == e2?.sprog &&
        e1?.downloadURL == e2?.downloadURL &&
        e1?.fileName == e2?.fileName;
  }

  @override
  int hash(AudioBooksRecord? e) => const ListEquality().hash([
        e?.audioFile,
        e?.imageCover,
        e?.audiobookTitle,
        e?.sprog,
        e?.downloadURL,
        e?.fileName
      ]);

  @override
  bool isValidKey(Object? o) => o is AudioBooksRecord;
}
