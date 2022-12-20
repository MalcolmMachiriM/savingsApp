import 'dart:async';

import 'package:raundtable/constants/firestore_path.dart';
import 'package:raundtable/shared/libs/index.dart';
import 'package:raundtable/shared/models/table/rt_table.dart';

class FirestoreTableService {
  FirestoreTableService({required this.uid});

  /// current user uid
  final String uid;

  final _service = FirestoreService.instance;

  Future<RtTable?> addTable(RtTable table) async {
    try {
      final String tableNumber = await _service.addData(
        collectionName: FirestorePath.tables,
        data: table.toJson(),
      );

      return table.copyWith(number: tableNumber);
    } catch (e) {
      return null;
    }
  }

  Future<RtTable> updateTable(RtTable table) async {
    try {
      await _service.setData(
        path: FirestorePath.table(table.number),
        data: table.toJson(),
        merge: true,
      );

      return table;
    } catch (e) {
      return table;
    }
  }
}
