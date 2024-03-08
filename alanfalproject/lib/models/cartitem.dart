class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const PRODUCT_ID = "productId";
  static const PRICE = "totalprice";
  static const SIZE = "doorsize";
  static const LOCKTYPE = "locktype";
  static const DOORDALFA = "doordalfa";
  static const WINDOWHEIGHT = "windowheight";
  static const WINDOWWIDTH = "windowwidth";
  static const WDALFATYPE = "wdalfatype";
  static const WMOTORTYPE = "wmotortype";
  static const COLOR = "color";
  static const NOTES = "notes";

  String _id;
  String _name;
  String _image;
  String _productId;
  String _size;
  String _locktype;
  String _doordalfa;
  String _windowheight;
  String _windowwidth;
  String _wdalfatype;
  String _wmotortype;
  String _color;
  String _notes;


  double _price;

  //  getters
  String get id => _id;

  String get name => _name;

  String get image => _image;

  String get productId => _productId;

  String get size => _size;
//
  String get locktype => _locktype;

  String get doordalfa => _doordalfa;
//
  String get windowheight => _windowheight;

  String get windowwidth => _windowwidth;

  String get wdalfatype => _wdalfatype;

  String get wmotortype => _wmotortype;

  String get color => _color;

  double get price => _price;

  String get notes => _notes;



  CartItemModel.fromMap(Map data){
    _id = data[ID];
    _name =  data[NAME];
    _image =  data[IMAGE];
    _productId = data[PRODUCT_ID];
    _price = data[PRICE];
    _size = data[SIZE];
    _locktype = data[LOCKTYPE];
    _doordalfa = data[DOORDALFA];
    _windowheight = data[WINDOWHEIGHT];
    _windowwidth = data[WINDOWWIDTH];
    _wdalfatype = data[WDALFATYPE];
    _wmotortype = data[WMOTORTYPE];
    _color = data[COLOR];
    _notes = data[NOTES];
  }

  Map toMap() => {
    ID: _id,
    IMAGE: _image,
    NAME: _name,
    PRODUCT_ID: _productId,
    PRICE: _price,
    SIZE: _size,
    LOCKTYPE: _locktype,
    DOORDALFA: _doordalfa,
    WINDOWHEIGHT: _windowheight,
    WINDOWWIDTH: _windowwidth,
    WDALFATYPE: _wdalfatype,
    WMOTORTYPE: _wmotortype,
    COLOR: _color,
    NOTES: _notes
  };
}