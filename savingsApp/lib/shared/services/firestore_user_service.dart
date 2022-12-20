import 'dart:async';
import 'dart:developer';

import 'package:raundtable/constants/firestore_path.dart';
import 'package:raundtable/shared/libs/index.dart';
import 'package:raundtable/shared/models/registration/rt_user.dart';

class FirestoreUserService {
  FirestoreUserService({required this.uid});

  /// current logged in user id
  final String uid;

  final _service = FirestoreService.instance;

  Future<RtUser?> addRtUser(RtUser raundTableUser) async {
    try {
      // check if user exist already
      final isUser = await getRtUserByMobileFuture(raundTableUser.phoneNumber);

      if (isUser == null) {
        await _service.setData(
          path: FirestorePath.user(uid),
          data: raundTableUser.toJson(),
        );

        return raundTableUser;
      }

      return isUser;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> checkRtUser() async {
    try {
      final cu = await _service.getData(path: FirestorePath.user(uid));

      return cu.exists;
    } catch (e) {
      return null;
    }
  }

  /// get rtUser by mobile number
  Future<RtUser?> getRtUserByMobileFuture(String mobile) async {
    try {
      final query = _service
          .singleFilterDataQuery(
              collection: FirestorePath.users,
              field: 'phoneNumber',
              query: mobile)
          .withConverter<RtUser>(
            fromFirestore: (snapshot, _) => RtUser.fromJson(snapshot.data()!),
            toFirestore: (rtuser, _) => rtuser.toJson(),
          );

      final cu = await query.get();

      log('[QUERY-USER] size: ${cu.size} | data: ${cu.docs.first.data()}');
      if (cu.docs.isNotEmpty) {
        return cu.docs.first.data();
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  /// get passed RT user, if null, get current user from id passed in constructor
  Future<RtUser?> getRtUserFuture({String? userId}) async {
    try {
      final cu =
          await _service.getData(path: FirestorePath.user(userId ??= uid));

      if (cu.exists) {
        return RtUser.fromFirestore(cu);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Stream<RtUser> getRtUserStream(String? userId) => _service.documentStream(
        path: FirestorePath.user(userId ??= uid),
        builder: (data, documentId) => RtUser.fromJson(data!),
      );

  Future<RtUser?> updateUser(RtUser raundTableUser) async {
    try {
      await _service.setData(
        path: FirestorePath.user(uid),
        data: raundTableUser.toJson(),
        merge: true,
      );
      return raundTableUser;
    } catch (e) {
      return null;
    }
  }
}
