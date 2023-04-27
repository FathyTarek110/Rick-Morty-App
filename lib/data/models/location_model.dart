class LocationModel {
  LocationModel({
    required this.info,
    required this.results,
  });
  late final Info info;
  late final List<Results> results;

  LocationModel.fromJson(Map<String, dynamic> json){
    info = Info.fromJson(json['info']);
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['info'] = info.toJson();
    data['results'] = results.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });
  late final int count;
  late final int pages;
  late final String next;
  late final Null prev;

  Info.fromJson(Map<String, dynamic> json){
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}

class Results {
  Results({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String type;
  late final String dimension;
  late final List<String> residents;
  late final String url;
  late final String created;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = List.castFrom<dynamic, String>(json['residents']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['dimension'] = dimension;
    data['residents'] = residents;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}