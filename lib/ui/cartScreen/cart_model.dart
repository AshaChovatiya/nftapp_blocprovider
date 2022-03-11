class CartCard {
  String? _image;
  String? _name;
  String? _eth;
  String? _creator;

  CartCard({String? image, String? name, String? eth, String? creator}) {
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (eth != null) {
      this._eth = eth;
    }
    if (creator != null) {
      this._creator = creator;
    }
  }

  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get eth => _eth;
  set eth(String? eth) => _eth = eth;
  String? get creator => _creator;
  set creator(String? creator) => _creator = creator;

  CartCard.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _name = json['name'];
    _eth = json['eth'];
    _creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = this._image;
    data['name'] = this._name;
    data['eth'] = this._eth;
    data['creator'] = this._creator;
    return data;
  }
}
