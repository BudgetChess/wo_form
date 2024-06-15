// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wo_form_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WoFormNode _$WoFormNodeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'inputs':
      return InputsNode.fromJson(json);
    case 'valueBuilder':
      return ValueBuilderNode.fromJson(json);
    case 'valueListener':
      return ValueListenerNode.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'WoFormNode',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$WoFormNode {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)
        inputs,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)
        valueBuilder,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)
        valueListener,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InputsNode value) inputs,
    required TResult Function(ValueBuilderNode value) valueBuilder,
    required TResult Function(ValueListenerNode value) valueListener,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InputsNode value)? inputs,
    TResult? Function(ValueBuilderNode value)? valueBuilder,
    TResult? Function(ValueListenerNode value)? valueListener,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InputsNode value)? inputs,
    TResult Function(ValueBuilderNode value)? valueBuilder,
    TResult Function(ValueListenerNode value)? valueListener,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WoFormNodeCopyWith<WoFormNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WoFormNodeCopyWith<$Res> {
  factory $WoFormNodeCopyWith(
          WoFormNode value, $Res Function(WoFormNode) then) =
      _$WoFormNodeCopyWithImpl<$Res, WoFormNode>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$WoFormNodeCopyWithImpl<$Res, $Val extends WoFormNode>
    implements $WoFormNodeCopyWith<$Res> {
  _$WoFormNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputsNodeImplCopyWith<$Res>
    implements $WoFormNodeCopyWith<$Res> {
  factory _$$InputsNodeImplCopyWith(
          _$InputsNodeImpl value, $Res Function(_$InputsNodeImpl) then) =
      __$$InputsNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<String, dynamic>? unmodifiableValuesJson,
      @InputsListConverter() List<WoFormElementMixin> inputs,
      NodeExportType exportType,
      @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
      InputsNodeUiSettings uiSettings});

  $InputsNodeUiSettingsCopyWith<$Res> get uiSettings;
}

/// @nodoc
class __$$InputsNodeImplCopyWithImpl<$Res>
    extends _$WoFormNodeCopyWithImpl<$Res, _$InputsNodeImpl>
    implements _$$InputsNodeImplCopyWith<$Res> {
  __$$InputsNodeImplCopyWithImpl(
      _$InputsNodeImpl _value, $Res Function(_$InputsNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unmodifiableValuesJson = freezed,
    Object? inputs = null,
    Object? exportType = null,
    Object? uiSettings = null,
  }) {
    return _then(_$InputsNodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unmodifiableValuesJson: freezed == unmodifiableValuesJson
          ? _value._unmodifiableValuesJson
          : unmodifiableValuesJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      inputs: null == inputs
          ? _value._inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<WoFormElementMixin>,
      exportType: null == exportType
          ? _value.exportType
          : exportType // ignore: cast_nullable_to_non_nullable
              as NodeExportType,
      uiSettings: null == uiSettings
          ? _value.uiSettings
          : uiSettings // ignore: cast_nullable_to_non_nullable
              as InputsNodeUiSettings,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $InputsNodeUiSettingsCopyWith<$Res> get uiSettings {
    return $InputsNodeUiSettingsCopyWith<$Res>(_value.uiSettings, (value) {
      return _then(_value.copyWith(uiSettings: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$InputsNodeImpl extends InputsNode {
  const _$InputsNodeImpl(
      {required this.id,
      final Map<String, dynamic>? unmodifiableValuesJson,
      @InputsListConverter() final List<WoFormElementMixin> inputs = const [],
      this.exportType = NodeExportType.map,
      @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
      this.uiSettings = const InputsNodeUiSettings(),
      final String? $type})
      : _unmodifiableValuesJson = unmodifiableValuesJson,
        _inputs = inputs,
        $type = $type ?? 'inputs',
        super._();

  factory _$InputsNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputsNodeImplFromJson(json);

  @override
  final String id;
  final Map<String, dynamic>? _unmodifiableValuesJson;
  @override
  Map<String, dynamic>? get unmodifiableValuesJson {
    final value = _unmodifiableValuesJson;
    if (value == null) return null;
    if (_unmodifiableValuesJson is EqualUnmodifiableMapView)
      return _unmodifiableValuesJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<WoFormElementMixin> _inputs;
  @override
  @JsonKey()
  @InputsListConverter()
  List<WoFormElementMixin> get inputs {
    if (_inputs is EqualUnmodifiableListView) return _inputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputs);
  }

  @override
  @JsonKey()
  final NodeExportType exportType;
  @override
  @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
  final InputsNodeUiSettings uiSettings;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WoFormNode.inputs(id: $id, unmodifiableValuesJson: $unmodifiableValuesJson, inputs: $inputs, exportType: $exportType, uiSettings: $uiSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputsNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
                other._unmodifiableValuesJson, _unmodifiableValuesJson) &&
            const DeepCollectionEquality().equals(other._inputs, _inputs) &&
            (identical(other.exportType, exportType) ||
                other.exportType == exportType) &&
            (identical(other.uiSettings, uiSettings) ||
                other.uiSettings == uiSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_unmodifiableValuesJson),
      const DeepCollectionEquality().hash(_inputs),
      exportType,
      uiSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputsNodeImplCopyWith<_$InputsNodeImpl> get copyWith =>
      __$$InputsNodeImplCopyWithImpl<_$InputsNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)
        inputs,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)
        valueBuilder,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)
        valueListener,
  }) {
    return inputs(
        id, unmodifiableValuesJson, this.inputs, exportType, uiSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
  }) {
    return inputs?.call(
        id, unmodifiableValuesJson, this.inputs, exportType, uiSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
    required TResult orElse(),
  }) {
    if (inputs != null) {
      return inputs(
          id, unmodifiableValuesJson, this.inputs, exportType, uiSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InputsNode value) inputs,
    required TResult Function(ValueBuilderNode value) valueBuilder,
    required TResult Function(ValueListenerNode value) valueListener,
  }) {
    return inputs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InputsNode value)? inputs,
    TResult? Function(ValueBuilderNode value)? valueBuilder,
    TResult? Function(ValueListenerNode value)? valueListener,
  }) {
    return inputs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InputsNode value)? inputs,
    TResult Function(ValueBuilderNode value)? valueBuilder,
    TResult Function(ValueListenerNode value)? valueListener,
    required TResult orElse(),
  }) {
    if (inputs != null) {
      return inputs(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InputsNodeImplToJson(
      this,
    );
  }
}

abstract class InputsNode extends WoFormNode {
  const factory InputsNode(
      {required final String id,
      final Map<String, dynamic>? unmodifiableValuesJson,
      @InputsListConverter() final List<WoFormElementMixin> inputs,
      final NodeExportType exportType,
      @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
      final InputsNodeUiSettings uiSettings}) = _$InputsNodeImpl;
  const InputsNode._() : super._();

  factory InputsNode.fromJson(Map<String, dynamic> json) =
      _$InputsNodeImpl.fromJson;

  @override
  String get id;
  Map<String, dynamic>? get unmodifiableValuesJson;
  @InputsListConverter()
  List<WoFormElementMixin> get inputs;
  NodeExportType get exportType;
  @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
  InputsNodeUiSettings get uiSettings;
  @override
  @JsonKey(ignore: true)
  _$$InputsNodeImplCopyWith<_$InputsNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValueBuilderNodeImplCopyWith<$Res>
    implements $WoFormNodeCopyWith<$Res> {
  factory _$$ValueBuilderNodeImplCopyWith(_$ValueBuilderNodeImpl value,
          $Res Function(_$ValueBuilderNodeImpl) then) =
      __$$ValueBuilderNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String inputPath,
      @JsonKey(includeToJson: false, includeFromJson: false)
      WoFormElementMixin Function(String, Object?)? builder,
      Object? defaultValue});
}

/// @nodoc
class __$$ValueBuilderNodeImplCopyWithImpl<$Res>
    extends _$WoFormNodeCopyWithImpl<$Res, _$ValueBuilderNodeImpl>
    implements _$$ValueBuilderNodeImplCopyWith<$Res> {
  __$$ValueBuilderNodeImplCopyWithImpl(_$ValueBuilderNodeImpl _value,
      $Res Function(_$ValueBuilderNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? inputPath = null,
    Object? builder = freezed,
    Object? defaultValue = freezed,
  }) {
    return _then(_$ValueBuilderNodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      inputPath: null == inputPath
          ? _value.inputPath
          : inputPath // ignore: cast_nullable_to_non_nullable
              as String,
      builder: freezed == builder
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as WoFormElementMixin Function(String, Object?)?,
      defaultValue:
          freezed == defaultValue ? _value.defaultValue : defaultValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValueBuilderNodeImpl extends ValueBuilderNode {
  const _$ValueBuilderNodeImpl(
      {required this.id,
      required this.inputPath,
      @JsonKey(includeToJson: false, includeFromJson: false) this.builder,
      this.defaultValue,
      final String? $type})
      : assert(builder != null, 'ValueBuilderNode.builder cannot be null'),
        $type = $type ?? 'valueBuilder',
        super._();

  factory _$ValueBuilderNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValueBuilderNodeImplFromJson(json);

  @override
  final String id;
  @override
  final String inputPath;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final WoFormElementMixin Function(String, Object?)? builder;
  @override
  final Object? defaultValue;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WoFormNode.valueBuilder(id: $id, inputPath: $inputPath, builder: $builder, defaultValue: $defaultValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueBuilderNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inputPath, inputPath) ||
                other.inputPath == inputPath) &&
            (identical(other.builder, builder) || other.builder == builder) &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, inputPath, builder,
      const DeepCollectionEquality().hash(defaultValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueBuilderNodeImplCopyWith<_$ValueBuilderNodeImpl> get copyWith =>
      __$$ValueBuilderNodeImplCopyWithImpl<_$ValueBuilderNodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)
        inputs,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)
        valueBuilder,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)
        valueListener,
  }) {
    return valueBuilder(id, inputPath, builder, defaultValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
  }) {
    return valueBuilder?.call(id, inputPath, builder, defaultValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
    required TResult orElse(),
  }) {
    if (valueBuilder != null) {
      return valueBuilder(id, inputPath, builder, defaultValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InputsNode value) inputs,
    required TResult Function(ValueBuilderNode value) valueBuilder,
    required TResult Function(ValueListenerNode value) valueListener,
  }) {
    return valueBuilder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InputsNode value)? inputs,
    TResult? Function(ValueBuilderNode value)? valueBuilder,
    TResult? Function(ValueListenerNode value)? valueListener,
  }) {
    return valueBuilder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InputsNode value)? inputs,
    TResult Function(ValueBuilderNode value)? valueBuilder,
    TResult Function(ValueListenerNode value)? valueListener,
    required TResult orElse(),
  }) {
    if (valueBuilder != null) {
      return valueBuilder(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ValueBuilderNodeImplToJson(
      this,
    );
  }
}

abstract class ValueBuilderNode extends WoFormNode {
  const factory ValueBuilderNode(
      {required final String id,
      required final String inputPath,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final WoFormElementMixin Function(String, Object?)? builder,
      final Object? defaultValue}) = _$ValueBuilderNodeImpl;
  const ValueBuilderNode._() : super._();

  factory ValueBuilderNode.fromJson(Map<String, dynamic> json) =
      _$ValueBuilderNodeImpl.fromJson;

  @override
  String get id;
  String get inputPath;
  @JsonKey(includeToJson: false, includeFromJson: false)
  WoFormElementMixin Function(String, Object?)? get builder;
  Object? get defaultValue;
  @override
  @JsonKey(ignore: true)
  _$$ValueBuilderNodeImplCopyWith<_$ValueBuilderNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValueListenerNodeImplCopyWith<$Res>
    implements $WoFormNodeCopyWith<$Res> {
  factory _$$ValueListenerNodeImplCopyWith(_$ValueListenerNodeImpl value,
          $Res Function(_$ValueListenerNodeImpl) then) =
      __$$ValueListenerNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String inputPath,
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool Function(Object?, Object?)? listenWhen,
      @JsonKey(includeToJson: false, includeFromJson: false)
      void Function(BuildContext, String, Object?)? listener});
}

/// @nodoc
class __$$ValueListenerNodeImplCopyWithImpl<$Res>
    extends _$WoFormNodeCopyWithImpl<$Res, _$ValueListenerNodeImpl>
    implements _$$ValueListenerNodeImplCopyWith<$Res> {
  __$$ValueListenerNodeImplCopyWithImpl(_$ValueListenerNodeImpl _value,
      $Res Function(_$ValueListenerNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? inputPath = null,
    Object? listenWhen = freezed,
    Object? listener = freezed,
  }) {
    return _then(_$ValueListenerNodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      inputPath: null == inputPath
          ? _value.inputPath
          : inputPath // ignore: cast_nullable_to_non_nullable
              as String,
      listenWhen: freezed == listenWhen
          ? _value.listenWhen
          : listenWhen // ignore: cast_nullable_to_non_nullable
              as bool Function(Object?, Object?)?,
      listener: freezed == listener
          ? _value.listener
          : listener // ignore: cast_nullable_to_non_nullable
              as void Function(BuildContext, String, Object?)?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValueListenerNodeImpl extends ValueListenerNode {
  const _$ValueListenerNodeImpl(
      {required this.id,
      required this.inputPath,
      @JsonKey(includeToJson: false, includeFromJson: false) this.listenWhen,
      @JsonKey(includeToJson: false, includeFromJson: false) this.listener,
      final String? $type})
      : assert(listener != null, 'ValueListenerNode.listener cannot be null'),
        $type = $type ?? 'valueListener',
        super._();

  factory _$ValueListenerNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValueListenerNodeImplFromJson(json);

  @override
  final String id;
  @override
  final String inputPath;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool Function(Object?, Object?)? listenWhen;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final void Function(BuildContext, String, Object?)? listener;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WoFormNode.valueListener(id: $id, inputPath: $inputPath, listenWhen: $listenWhen, listener: $listener)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueListenerNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inputPath, inputPath) ||
                other.inputPath == inputPath) &&
            (identical(other.listenWhen, listenWhen) ||
                other.listenWhen == listenWhen) &&
            (identical(other.listener, listener) ||
                other.listener == listener));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, inputPath, listenWhen, listener);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueListenerNodeImplCopyWith<_$ValueListenerNodeImpl> get copyWith =>
      __$$ValueListenerNodeImplCopyWithImpl<_$ValueListenerNodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)
        inputs,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)
        valueBuilder,
    required TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)
        valueListener,
  }) {
    return valueListener(id, inputPath, listenWhen, listener);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult? Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
  }) {
    return valueListener?.call(id, inputPath, listenWhen, listener);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            Map<String, dynamic>? unmodifiableValuesJson,
            @InputsListConverter() List<WoFormElementMixin> inputs,
            NodeExportType exportType,
            @JsonKey(toJson: InputsNodeUiSettings.staticToJson)
            InputsNodeUiSettings uiSettings)?
        inputs,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            WoFormElementMixin Function(String, Object?)? builder,
            Object? defaultValue)?
        valueBuilder,
    TResult Function(
            String id,
            String inputPath,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool Function(Object?, Object?)? listenWhen,
            @JsonKey(includeToJson: false, includeFromJson: false)
            void Function(BuildContext, String, Object?)? listener)?
        valueListener,
    required TResult orElse(),
  }) {
    if (valueListener != null) {
      return valueListener(id, inputPath, listenWhen, listener);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InputsNode value) inputs,
    required TResult Function(ValueBuilderNode value) valueBuilder,
    required TResult Function(ValueListenerNode value) valueListener,
  }) {
    return valueListener(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InputsNode value)? inputs,
    TResult? Function(ValueBuilderNode value)? valueBuilder,
    TResult? Function(ValueListenerNode value)? valueListener,
  }) {
    return valueListener?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InputsNode value)? inputs,
    TResult Function(ValueBuilderNode value)? valueBuilder,
    TResult Function(ValueListenerNode value)? valueListener,
    required TResult orElse(),
  }) {
    if (valueListener != null) {
      return valueListener(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ValueListenerNodeImplToJson(
      this,
    );
  }
}

abstract class ValueListenerNode extends WoFormNode {
  const factory ValueListenerNode(
          {required final String id,
          required final String inputPath,
          @JsonKey(includeToJson: false, includeFromJson: false)
          final bool Function(Object?, Object?)? listenWhen,
          @JsonKey(includeToJson: false, includeFromJson: false)
          final void Function(BuildContext, String, Object?)? listener}) =
      _$ValueListenerNodeImpl;
  const ValueListenerNode._() : super._();

  factory ValueListenerNode.fromJson(Map<String, dynamic> json) =
      _$ValueListenerNodeImpl.fromJson;

  @override
  String get id;
  String get inputPath;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool Function(Object?, Object?)? get listenWhen;
  @JsonKey(includeToJson: false, includeFromJson: false)
  void Function(BuildContext, String, Object?)? get listener;
  @override
  @JsonKey(ignore: true)
  _$$ValueListenerNodeImplCopyWith<_$ValueListenerNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}