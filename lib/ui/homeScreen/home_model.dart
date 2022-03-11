class TrendingCard {
  String? _creator;
  String? _eth;
  String? _image;
  String? _name;
  String? _owner;

  TrendingCard(
      {String? creator,
      String? eth,
      String? image,
      String? name,
      String? owner}) {
    if (creator != null) {
      this._creator = creator;
    }
    if (eth != null) {
      this._eth = eth;
    }
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (owner != null) {
      this._owner = owner;
    }
  }

  String? get creator => _creator;
  set creator(String? creator) => _creator = creator;
  String? get eth => _eth;
  set eth(String? eth) => _eth = eth;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get owner => _owner;
  set owner(String? owner) => _owner = owner;

  TrendingCard.fromJson(Map<String, dynamic> json) {
    _creator = json['creator'];
    _eth = json['eth'];
    _image = json['image'];
    _name = json['name'];
    _owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creator'] = this._creator;
    data['eth'] = this._eth;
    data['image'] = this._image;
    data['name'] = this._name;
    data['owner'] = this._owner;
    return data;
  }
}

class RecentCard {
  String? image;
  String? name;
  String? creator;
  String? eth;

  RecentCard({this.image, this.name, this.creator, this.eth});

  RecentCard.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    creator = json['creator'];
    eth = json['eth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['creator'] = this.creator;
    data['eth'] = this.eth;
    return data;
  }
}
