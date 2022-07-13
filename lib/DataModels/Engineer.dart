// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class Engineer extends Model {
  int _id;
  String _name;
  int _shiftsWorked;

  Engineer(this._id, this._name, this._shiftsWorked);

  int get id => _id;

  set id(int id) {
    _id = id;
    notifyListeners();
  }

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  int get shiftsWorked => _shiftsWorked;

  set shiftsWorked(int shiftsWorked) {
    _shiftsWorked = shiftsWorked;
    notifyListeners();
  }
}
