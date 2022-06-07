// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'json_api_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlaceholderClientTearOff {
  const _$PlaceholderClientTearOff();

  _Login login(String name, String password) {
    return _Login(
      name,
      password,
    );
  }

  _GetAllDoctors getAllDoctors() {
    return const _GetAllDoctors();
  }

  _GetUser getUser(String username) {
    return _GetUser(
      username,
    );
  }

  _EditUser editUser(Map<String, dynamic> data) {
    return _EditUser(
      data,
    );
  }
}

/// @nodoc
const $PlaceholderClient = _$PlaceholderClientTearOff();

/// @nodoc
mixin _$PlaceholderClient {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String password) login,
    required TResult Function() getAllDoctors,
    required TResult Function(String username) getUser,
    required TResult Function(Map<String, dynamic> data) editUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetAllDoctors value) getAllDoctors,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_EditUser value) editUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceholderClientCopyWith<$Res> {
  factory $PlaceholderClientCopyWith(
          PlaceholderClient value, $Res Function(PlaceholderClient) then) =
      _$PlaceholderClientCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaceholderClientCopyWithImpl<$Res>
    implements $PlaceholderClientCopyWith<$Res> {
  _$PlaceholderClientCopyWithImpl(this._value, this._then);

  final PlaceholderClient _value;
  // ignore: unused_field
  final $Res Function(PlaceholderClient) _then;
}

/// @nodoc
abstract class _$LoginCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) then) =
      __$LoginCopyWithImpl<$Res>;
  $Res call({String name, String password});
}

/// @nodoc
class __$LoginCopyWithImpl<$Res> extends _$PlaceholderClientCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(_Login _value, $Res Function(_Login) _then)
      : super(_value, (v) => _then(v as _Login));

  @override
  _Login get _value => super._value as _Login;

  @override
  $Res call({
    Object? name = freezed,
    Object? password = freezed,
  }) {
    return _then(_Login(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Login extends _Login {
  const _$_Login(this.name, this.password) : super._();

  @override
  final String name;
  @override
  final String password;

  @override
  String toString() {
    return 'PlaceholderClient.login(name: $name, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Login &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$LoginCopyWith<_Login> get copyWith =>
      __$LoginCopyWithImpl<_Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String password) login,
    required TResult Function() getAllDoctors,
    required TResult Function(String username) getUser,
    required TResult Function(Map<String, dynamic> data) editUser,
  }) {
    return login(name, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
  }) {
    return login?.call(name, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(name, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetAllDoctors value) getAllDoctors,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_EditUser value) editUser,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login extends PlaceholderClient {
  const factory _Login(String name, String password) = _$_Login;
  const _Login._() : super._();

  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoginCopyWith<_Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetAllDoctorsCopyWith<$Res> {
  factory _$GetAllDoctorsCopyWith(
          _GetAllDoctors value, $Res Function(_GetAllDoctors) then) =
      __$GetAllDoctorsCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetAllDoctorsCopyWithImpl<$Res>
    extends _$PlaceholderClientCopyWithImpl<$Res>
    implements _$GetAllDoctorsCopyWith<$Res> {
  __$GetAllDoctorsCopyWithImpl(
      _GetAllDoctors _value, $Res Function(_GetAllDoctors) _then)
      : super(_value, (v) => _then(v as _GetAllDoctors));

  @override
  _GetAllDoctors get _value => super._value as _GetAllDoctors;
}

/// @nodoc

class _$_GetAllDoctors extends _GetAllDoctors {
  const _$_GetAllDoctors() : super._();

  @override
  String toString() {
    return 'PlaceholderClient.getAllDoctors()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetAllDoctors);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String password) login,
    required TResult Function() getAllDoctors,
    required TResult Function(String username) getUser,
    required TResult Function(Map<String, dynamic> data) editUser,
  }) {
    return getAllDoctors();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
  }) {
    return getAllDoctors?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
    required TResult orElse(),
  }) {
    if (getAllDoctors != null) {
      return getAllDoctors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetAllDoctors value) getAllDoctors,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_EditUser value) editUser,
  }) {
    return getAllDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
  }) {
    return getAllDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
    required TResult orElse(),
  }) {
    if (getAllDoctors != null) {
      return getAllDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetAllDoctors extends PlaceholderClient {
  const factory _GetAllDoctors() = _$_GetAllDoctors;
  const _GetAllDoctors._() : super._();
}

/// @nodoc
abstract class _$GetUserCopyWith<$Res> {
  factory _$GetUserCopyWith(_GetUser value, $Res Function(_GetUser) then) =
      __$GetUserCopyWithImpl<$Res>;
  $Res call({String username});
}

/// @nodoc
class __$GetUserCopyWithImpl<$Res> extends _$PlaceholderClientCopyWithImpl<$Res>
    implements _$GetUserCopyWith<$Res> {
  __$GetUserCopyWithImpl(_GetUser _value, $Res Function(_GetUser) _then)
      : super(_value, (v) => _then(v as _GetUser));

  @override
  _GetUser get _value => super._value as _GetUser;

  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_GetUser(
      username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetUser extends _GetUser {
  const _$_GetUser(this.username) : super._();

  @override
  final String username;

  @override
  String toString() {
    return 'PlaceholderClient.getUser(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetUser &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$GetUserCopyWith<_GetUser> get copyWith =>
      __$GetUserCopyWithImpl<_GetUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String password) login,
    required TResult Function() getAllDoctors,
    required TResult Function(String username) getUser,
    required TResult Function(Map<String, dynamic> data) editUser,
  }) {
    return getUser(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
  }) {
    return getUser?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetAllDoctors value) getAllDoctors,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_EditUser value) editUser,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser extends PlaceholderClient {
  const factory _GetUser(String username) = _$_GetUser;
  const _GetUser._() : super._();

  String get username => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GetUserCopyWith<_GetUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EditUserCopyWith<$Res> {
  factory _$EditUserCopyWith(_EditUser value, $Res Function(_EditUser) then) =
      __$EditUserCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$EditUserCopyWithImpl<$Res>
    extends _$PlaceholderClientCopyWithImpl<$Res>
    implements _$EditUserCopyWith<$Res> {
  __$EditUserCopyWithImpl(_EditUser _value, $Res Function(_EditUser) _then)
      : super(_value, (v) => _then(v as _EditUser));

  @override
  _EditUser get _value => super._value as _EditUser;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_EditUser(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_EditUser extends _EditUser {
  const _$_EditUser(this.data) : super._();

  @override
  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'PlaceholderClient.editUser(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditUser &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$EditUserCopyWith<_EditUser> get copyWith =>
      __$EditUserCopyWithImpl<_EditUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String password) login,
    required TResult Function() getAllDoctors,
    required TResult Function(String username) getUser,
    required TResult Function(Map<String, dynamic> data) editUser,
  }) {
    return editUser(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
  }) {
    return editUser?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    TResult Function()? getAllDoctors,
    TResult Function(String username)? getUser,
    TResult Function(Map<String, dynamic> data)? editUser,
    required TResult orElse(),
  }) {
    if (editUser != null) {
      return editUser(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetAllDoctors value) getAllDoctors,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_EditUser value) editUser,
  }) {
    return editUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
  }) {
    return editUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetAllDoctors value)? getAllDoctors,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_EditUser value)? editUser,
    required TResult orElse(),
  }) {
    if (editUser != null) {
      return editUser(this);
    }
    return orElse();
  }
}

abstract class _EditUser extends PlaceholderClient {
  const factory _EditUser(Map<String, dynamic> data) = _$_EditUser;
  const _EditUser._() : super._();

  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$EditUserCopyWith<_EditUser> get copyWith =>
      throw _privateConstructorUsedError;
}
