import '../entities/user.dart';
import '../repositories/century_properties_repository.dart';

class GetUser {
  final CenturyPropertiesRepository _repo;

  GetUser(this._repo);
  User call() => _repo.getUser();
}
