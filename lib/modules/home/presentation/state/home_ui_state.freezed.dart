// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeUiState {
  int get startCountDown => throw _privateConstructorUsedError;
  bool get hasMonitoringStarted => throw _privateConstructorUsedError;
  List<SessionShot> get sessionShots => throw _privateConstructorUsedError;
  MonitoringState get monitoringState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeUiStateCopyWith<HomeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUiStateCopyWith<$Res> {
  factory $HomeUiStateCopyWith(
          HomeUiState value, $Res Function(HomeUiState) then) =
      _$HomeUiStateCopyWithImpl<$Res, HomeUiState>;
  @useResult
  $Res call(
      {int startCountDown,
      bool hasMonitoringStarted,
      List<SessionShot> sessionShots,
      MonitoringState monitoringState});
}

/// @nodoc
class _$HomeUiStateCopyWithImpl<$Res, $Val extends HomeUiState>
    implements $HomeUiStateCopyWith<$Res> {
  _$HomeUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startCountDown = null,
    Object? hasMonitoringStarted = null,
    Object? sessionShots = null,
    Object? monitoringState = null,
  }) {
    return _then(_value.copyWith(
      startCountDown: null == startCountDown
          ? _value.startCountDown
          : startCountDown // ignore: cast_nullable_to_non_nullable
              as int,
      hasMonitoringStarted: null == hasMonitoringStarted
          ? _value.hasMonitoringStarted
          : hasMonitoringStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionShots: null == sessionShots
          ? _value.sessionShots
          : sessionShots // ignore: cast_nullable_to_non_nullable
              as List<SessionShot>,
      monitoringState: null == monitoringState
          ? _value.monitoringState
          : monitoringState // ignore: cast_nullable_to_non_nullable
              as MonitoringState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeUiStateImplCopyWith<$Res>
    implements $HomeUiStateCopyWith<$Res> {
  factory _$$HomeUiStateImplCopyWith(
          _$HomeUiStateImpl value, $Res Function(_$HomeUiStateImpl) then) =
      __$$HomeUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int startCountDown,
      bool hasMonitoringStarted,
      List<SessionShot> sessionShots,
      MonitoringState monitoringState});
}

/// @nodoc
class __$$HomeUiStateImplCopyWithImpl<$Res>
    extends _$HomeUiStateCopyWithImpl<$Res, _$HomeUiStateImpl>
    implements _$$HomeUiStateImplCopyWith<$Res> {
  __$$HomeUiStateImplCopyWithImpl(
      _$HomeUiStateImpl _value, $Res Function(_$HomeUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startCountDown = null,
    Object? hasMonitoringStarted = null,
    Object? sessionShots = null,
    Object? monitoringState = null,
  }) {
    return _then(_$HomeUiStateImpl(
      startCountDown: null == startCountDown
          ? _value.startCountDown
          : startCountDown // ignore: cast_nullable_to_non_nullable
              as int,
      hasMonitoringStarted: null == hasMonitoringStarted
          ? _value.hasMonitoringStarted
          : hasMonitoringStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionShots: null == sessionShots
          ? _value._sessionShots
          : sessionShots // ignore: cast_nullable_to_non_nullable
              as List<SessionShot>,
      monitoringState: null == monitoringState
          ? _value.monitoringState
          : monitoringState // ignore: cast_nullable_to_non_nullable
              as MonitoringState,
    ));
  }
}

/// @nodoc

class _$HomeUiStateImpl implements _HomeUiState {
  _$HomeUiStateImpl(
      {this.startCountDown = 5,
      this.hasMonitoringStarted = false,
      final List<SessionShot> sessionShots = const [],
      this.monitoringState = const IdleMonitoringState()})
      : _sessionShots = sessionShots;

  @override
  @JsonKey()
  final int startCountDown;
  @override
  @JsonKey()
  final bool hasMonitoringStarted;
  final List<SessionShot> _sessionShots;
  @override
  @JsonKey()
  List<SessionShot> get sessionShots {
    if (_sessionShots is EqualUnmodifiableListView) return _sessionShots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessionShots);
  }

  @override
  @JsonKey()
  final MonitoringState monitoringState;

  @override
  String toString() {
    return 'HomeUiState(startCountDown: $startCountDown, hasMonitoringStarted: $hasMonitoringStarted, sessionShots: $sessionShots, monitoringState: $monitoringState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeUiStateImpl &&
            (identical(other.startCountDown, startCountDown) ||
                other.startCountDown == startCountDown) &&
            (identical(other.hasMonitoringStarted, hasMonitoringStarted) ||
                other.hasMonitoringStarted == hasMonitoringStarted) &&
            const DeepCollectionEquality()
                .equals(other._sessionShots, _sessionShots) &&
            (identical(other.monitoringState, monitoringState) ||
                other.monitoringState == monitoringState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startCountDown,
      hasMonitoringStarted,
      const DeepCollectionEquality().hash(_sessionShots),
      monitoringState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeUiStateImplCopyWith<_$HomeUiStateImpl> get copyWith =>
      __$$HomeUiStateImplCopyWithImpl<_$HomeUiStateImpl>(this, _$identity);
}

abstract class _HomeUiState implements HomeUiState {
  factory _HomeUiState(
      {final int startCountDown,
      final bool hasMonitoringStarted,
      final List<SessionShot> sessionShots,
      final MonitoringState monitoringState}) = _$HomeUiStateImpl;

  @override
  int get startCountDown;
  @override
  bool get hasMonitoringStarted;
  @override
  List<SessionShot> get sessionShots;
  @override
  MonitoringState get monitoringState;
  @override
  @JsonKey(ignore: true)
  _$$HomeUiStateImplCopyWith<_$HomeUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
