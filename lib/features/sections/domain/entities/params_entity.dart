class ParamsEntity {
  final String? sort;
  final ParamsExtrasEntity? extras;

  const ParamsEntity({this.sort, this.extras});
}

class ParamsExtrasEntity {
  final List<ParamFilterEntity> filters;

  const ParamsExtrasEntity({required this.filters});
}

class ParamFilterEntity {
  final String? type;
  final dynamic value;

  const ParamFilterEntity({required this.type, required this.value});
}
