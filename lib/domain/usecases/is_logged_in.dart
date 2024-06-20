import '../repositories/century_properties_repository.dart';

class IsLoggedIn {
  final CenturyPropertiesRepository _repo;

  IsLoggedIn(this._repo);

  bool call() => _repo.isLoggedIn();
}
