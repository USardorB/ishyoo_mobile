// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'base_result.dart';

class PaginationMapper extends ClassMapperBase<Pagination> {
  PaginationMapper._();

  static PaginationMapper? _instance;
  static PaginationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaginationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Pagination';

  static int _$total(Pagination v) => v.total;
  static const Field<Pagination, int> _f$total = Field(
    'total',
    _$total,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<Pagination> fields = const {#total: _f$total};

  static Pagination _instantiate(DecodingData data) {
    return Pagination(total: data.dec(_f$total));
  }

  @override
  final Function instantiate = _instantiate;

  static Pagination fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Pagination>(map);
  }

  static Pagination fromJson(String json) {
    return ensureInitialized().decodeJson<Pagination>(json);
  }
}

mixin PaginationMappable {
  String toJson() {
    return PaginationMapper.ensureInitialized().encodeJson<Pagination>(
      this as Pagination,
    );
  }

  Map<String, dynamic> toMap() {
    return PaginationMapper.ensureInitialized().encodeMap<Pagination>(
      this as Pagination,
    );
  }

  PaginationCopyWith<Pagination, Pagination, Pagination> get copyWith =>
      _PaginationCopyWithImpl<Pagination, Pagination>(
        this as Pagination,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PaginationMapper.ensureInitialized().stringifyValue(
      this as Pagination,
    );
  }

  @override
  bool operator ==(Object other) {
    return PaginationMapper.ensureInitialized().equalsValue(
      this as Pagination,
      other,
    );
  }

  @override
  int get hashCode {
    return PaginationMapper.ensureInitialized().hashValue(this as Pagination);
  }
}

extension PaginationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Pagination, $Out> {
  PaginationCopyWith<$R, Pagination, $Out> get $asPagination =>
      $base.as((v, t, t2) => _PaginationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaginationCopyWith<$R, $In extends Pagination, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? total});
  PaginationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PaginationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Pagination, $Out>
    implements PaginationCopyWith<$R, Pagination, $Out> {
  _PaginationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Pagination> $mapper =
      PaginationMapper.ensureInitialized();
  @override
  $R call({int? total}) =>
      $apply(FieldCopyWithData({if (total != null) #total: total}));
  @override
  Pagination $make(CopyWithData data) =>
      Pagination(total: data.get(#total, or: $value.total));

  @override
  PaginationCopyWith<$R2, Pagination, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PaginationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BaseResultMapper extends ClassMapperBase<BaseResult> {
  BaseResultMapper._();

  static BaseResultMapper? _instance;
  static BaseResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseResultMapper._());
      PaginationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BaseResult';
  @override
  Function get typeFactory =>
      <T>(f) => f<BaseResult<T>>();

  static bool _$success(BaseResult v) => v.success;
  static const Field<BaseResult, bool> _f$success = Field('success', _$success);
  static String? _$message(BaseResult v) => v.message;
  static const Field<BaseResult, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static dynamic _$data(BaseResult v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<BaseResult, dynamic> _f$data = Field(
    'data',
    _$data,
    opt: true,
    arg: _arg$data,
  );
  static Pagination? _$pagination(BaseResult v) => v.pagination;
  static const Field<BaseResult, Pagination> _f$pagination = Field(
    'pagination',
    _$pagination,
    opt: true,
  );

  @override
  final MappableFields<BaseResult> fields = const {
    #success: _f$success,
    #message: _f$message,
    #data: _f$data,
    #pagination: _f$pagination,
  };

  static BaseResult<T> _instantiate<T>(DecodingData data) {
    return BaseResult(
      success: data.dec(_f$success),
      message: data.dec(_f$message),
      data: data.dec(_f$data),
      pagination: data.dec(_f$pagination),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BaseResult<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BaseResult<T>>(map);
  }

  static BaseResult<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<BaseResult<T>>(json);
  }
}

mixin BaseResultMappable<T> {
  String toJson() {
    return BaseResultMapper.ensureInitialized().encodeJson<BaseResult<T>>(
      this as BaseResult<T>,
    );
  }

  Map<String, dynamic> toMap() {
    return BaseResultMapper.ensureInitialized().encodeMap<BaseResult<T>>(
      this as BaseResult<T>,
    );
  }

  BaseResultCopyWith<BaseResult<T>, BaseResult<T>, BaseResult<T>, T>
  get copyWith => _BaseResultCopyWithImpl<BaseResult<T>, BaseResult<T>, T>(
    this as BaseResult<T>,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return BaseResultMapper.ensureInitialized().stringifyValue(
      this as BaseResult<T>,
    );
  }

  @override
  bool operator ==(Object other) {
    return BaseResultMapper.ensureInitialized().equalsValue(
      this as BaseResult<T>,
      other,
    );
  }

  @override
  int get hashCode {
    return BaseResultMapper.ensureInitialized().hashValue(
      this as BaseResult<T>,
    );
  }
}

extension BaseResultValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, BaseResult<T>, $Out> {
  BaseResultCopyWith<$R, BaseResult<T>, $Out, T> get $asBaseResult =>
      $base.as((v, t, t2) => _BaseResultCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class BaseResultCopyWith<$R, $In extends BaseResult<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  PaginationCopyWith<$R, Pagination, Pagination>? get pagination;
  $R call({bool? success, String? message, T? data, Pagination? pagination});
  BaseResultCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BaseResultCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, BaseResult<T>, $Out>
    implements BaseResultCopyWith<$R, BaseResult<T>, $Out, T> {
  _BaseResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BaseResult> $mapper =
      BaseResultMapper.ensureInitialized();
  @override
  PaginationCopyWith<$R, Pagination, Pagination>? get pagination =>
      $value.pagination?.copyWith.$chain((v) => call(pagination: v));
  @override
  $R call({
    bool? success,
    Object? message = $none,
    Object? data = $none,
    Object? pagination = $none,
  }) => $apply(
    FieldCopyWithData({
      if (success != null) #success: success,
      if (message != $none) #message: message,
      if (data != $none) #data: data,
      if (pagination != $none) #pagination: pagination,
    }),
  );
  @override
  BaseResult<T> $make(CopyWithData data) => BaseResult(
    success: data.get(#success, or: $value.success),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    pagination: data.get(#pagination, or: $value.pagination),
  );

  @override
  BaseResultCopyWith<$R2, BaseResult<T>, $Out2, T> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BaseResultCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

