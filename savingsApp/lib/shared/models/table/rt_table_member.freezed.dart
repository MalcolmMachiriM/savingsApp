// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rt_table_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RtTableMember _$RtTableMemberFromJson(Map<String, dynamic> json) {
  return _RtTableMember.fromJson(json);
}

/// @nodoc
class _$RtTableMemberTearOff {
  const _$RtTableMemberTearOff();

  _RtTableMember call(
      {required String memberID,
      required String name,
      int? index,
      bool inviteSent = false}) {
    return _RtTableMember(
      memberID: memberID,
      name: name,
      index: index,
      inviteSent: inviteSent,
    );
  }

  RtTableMember fromJson(Map<String, Object?> json) {
    return RtTableMember.fromJson(json);
  }
}

/// @nodoc
const $RtTableMember = _$RtTableMemberTearOff();

/// @nodoc
mixin _$RtTableMember {
  String get memberID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// queue list number, receiving order
  int? get index => throw _privateConstructorUsedError;
  bool get inviteSent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RtTableMemberCopyWith<RtTableMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtTableMemberCopyWith<$Res> {
  factory $RtTableMemberCopyWith(
          RtTableMember value, $Res Function(RtTableMember) then) =
      _$RtTableMemberCopyWithImpl<$Res>;
  $Res call({String memberID, String name, int? index, bool inviteSent});
}

/// @nodoc
class _$RtTableMemberCopyWithImpl<$Res>
    implements $RtTableMemberCopyWith<$Res> {
  _$RtTableMemberCopyWithImpl(this._value, this._then);

  final RtTableMember _value;
  // ignore: unused_field
  final $Res Function(RtTableMember) _then;

  @override
  $Res call({
    Object? memberID = freezed,
    Object? name = freezed,
    Object? index = freezed,
    Object? inviteSent = freezed,
  }) {
    return _then(_value.copyWith(
      memberID: memberID == freezed
          ? _value.memberID
          : memberID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteSent: inviteSent == freezed
          ? _value.inviteSent
          : inviteSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RtTableMemberCopyWith<$Res>
    implements $RtTableMemberCopyWith<$Res> {
  factory _$RtTableMemberCopyWith(
          _RtTableMember value, $Res Function(_RtTableMember) then) =
      __$RtTableMemberCopyWithImpl<$Res>;
  @override
  $Res call({String memberID, String name, int? index, bool inviteSent});
}

/// @nodoc
class __$RtTableMemberCopyWithImpl<$Res>
    extends _$RtTableMemberCopyWithImpl<$Res>
    implements _$RtTableMemberCopyWith<$Res> {
  __$RtTableMemberCopyWithImpl(
      _RtTableMember _value, $Res Function(_RtTableMember) _then)
      : super(_value, (v) => _then(v as _RtTableMember));

  @override
  _RtTableMember get _value => super._value as _RtTableMember;

  @override
  $Res call({
    Object? memberID = freezed,
    Object? name = freezed,
    Object? index = freezed,
    Object? inviteSent = freezed,
  }) {
    return _then(_RtTableMember(
      memberID: memberID == freezed
          ? _value.memberID
          : memberID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      inviteSent: inviteSent == freezed
          ? _value.inviteSent
          : inviteSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RtTableMember extends _RtTableMember {
  _$_RtTableMember(
      {required this.memberID,
      required this.name,
      this.index,
      this.inviteSent = false})
      : super._();

  factory _$_RtTableMember.fromJson(Map<String, dynamic> json) =>
      _$$_RtTableMemberFromJson(json);

  @override
  final String memberID;
  @override
  final String name;
  @override

  /// queue list number, receiving order
  final int? index;
  @JsonKey()
  @override
  final bool inviteSent;

  @override
  String toString() {
    return 'RtTableMember(memberID: $memberID, name: $name, index: $index, inviteSent: $inviteSent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RtTableMember &&
            const DeepCollectionEquality().equals(other.memberID, memberID) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality()
                .equals(other.inviteSent, inviteSent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(memberID),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(inviteSent));

  @JsonKey(ignore: true)
  @override
  _$RtTableMemberCopyWith<_RtTableMember> get copyWith =>
      __$RtTableMemberCopyWithImpl<_RtTableMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RtTableMemberToJson(this);
  }
}

abstract class _RtTableMember extends RtTableMember {
  factory _RtTableMember(
      {required String memberID,
      required String name,
      int? index,
      bool inviteSent}) = _$_RtTableMember;
  _RtTableMember._() : super._();

  factory _RtTableMember.fromJson(Map<String, dynamic> json) =
      _$_RtTableMember.fromJson;

  @override
  String get memberID;
  @override
  String get name;
  @override

  /// queue list number, receiving order
  int? get index;
  @override
  bool get inviteSent;
  @override
  @JsonKey(ignore: true)
  _$RtTableMemberCopyWith<_RtTableMember> get copyWith =>
      throw _privateConstructorUsedError;
}
