// ignore_for_file: overridden_fields, annotate_overrides

import '../../domain/entities/types.dart';

class TypeModel extends TypePokemon {
  String name;
  // ignore: annotate_overrides
  String url;

  TypeModel({
    this.name = '',
    this.url = '',
  }) : super(name: name, url: url);

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json['type']['name'],
      url: json['type']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  String? get getUrlType {
    return url;
  }

  set setUrlType(String? url) {
    url = url;
  }
}
