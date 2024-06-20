import '../repositories/century_properties_repository.dart';

class Logout {
  final CenturyPropertiesRepository _repo;

  Logout(this._repo);

  Future<bool> call() => _repo.logOut();
}
