class DataParamsEntity {
  final String? sort;
  final DataParamsExtrasEntity? extras;

  const DataParamsEntity({this.sort, this.extras});
}

class DataParamsExtrasEntity {
  final List<ParamFilterEntity> filters;

  const DataParamsExtrasEntity({required this.filters});
}

class ParamFilterEntity {
  final String? type;
  final dynamic value;

  const ParamFilterEntity({required this.type, required this.value});
}
