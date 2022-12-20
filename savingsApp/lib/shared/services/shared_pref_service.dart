import 'dart:convert';

import 'package:raundtable/shared/models/registration/rt_user.dart';
import 'package:raundtable/shared/models/table/rt_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const _kRtUserKey = 'kRtUser';

  static const _kRtTableCreate = 'kRtTableCreate';

  /// to share [RtUser] model across different modules universally without state management
  Future<void> cacheCurrentUser(RtUser user) async {
    final sharedPref = await SharedPreferences.getInstance();
    var userJson = user.toJson();

    userJson['dob'] = user.dob.toIso8601String();

    await sharedPref.setString(_kRtUserKey, jsonEncode(userJson));
  }

  /// easy way to get currently logged in `cached` user with no state management
  Future<RtUser?> getCurrentUser() async {
    final sharedPref = await SharedPreferences.getInstance();

    final _cs = sharedPref.getString(_kRtUserKey);

    if (_cs == null) {
      return null;
    }

    // fix date
    var _decoded = jsonDecode(_cs) as Map<String, dynamic>;

    var _dobIso = _decoded['dob'];

    _decoded['dob'] = DateTime.parse(_dobIso);

    return RtUser.fromJson(_decoded);
  }

  Future<void> cacheCurrentCreatedTable(RtTable rtTable) async {
    final sharedPref = await SharedPreferences.getInstance();
    var tableJson = rtTable.toJson();

    tableJson['startDate'] = rtTable.startDate.toIso8601String();

    await sharedPref.setString(_kRtTableCreate, jsonEncode(tableJson));
  }

  Future<RtTable?> getCachedTableCreate() async {
    final sharedPref = await SharedPreferences.getInstance();

    final _cs = sharedPref.getString(_kRtTableCreate);

    if (_cs == null) {
      return null;
    }

    // fix date
    var _decoded = jsonDecode(_cs) as Map<String, dynamic>;

    var _dobIso = _decoded['startDate'];

    _decoded['startDate'] = DateTime.parse(_dobIso);

    return RtTable.fromJson(_decoded);
  }
}
