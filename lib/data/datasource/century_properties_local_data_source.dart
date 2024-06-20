import 'dart:convert';
import '../../core/constant/string.dart';
import '../model/project_model.dart';
import '../model/unit_model.dart';
import '../model/user_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CenturyPropertiesLocalDataSource {
  Future<List<UnitModel>> getCacheUnit(String projectID);
  Future<List<ProjectModel>> getCacheProject();
  UserModel getCacheUser();
  Future<bool> logOutUser();
  Future<void> cacheUnitList(
      {@required String key, @required List<UnitModel> units});
  Future<void> cacheUser({@required UserModel user});
  Future<void> cacheProjects({@required List<ProjectModel> projects});
}

class CenturyPropertiesLocalDataSourceImpl
    implements CenturyPropertiesLocalDataSource {
  final SharedPreferences _shared;

  CenturyPropertiesLocalDataSourceImpl(this._shared);
  @override
  Future<List<UnitModel>> getCacheUnit(String projectID) async {
    final cached = _shared.getStringList(projectID);
    final unitList = <UnitModel>[];
    if (cached != null) {
      cached.forEach((unitString) =>
          unitList.add(UnitModel.fromJson(json.decode(unitString))));
      return unitList;
    }
    return null;
  }

  @override
  Future<void> cacheUnitList({String key, List<UnitModel> units}) async {
    final unitStringList = <String>[];
    units.forEach((unit) => unitStringList.add(json.encode(unit.toJson())));

    _shared.setStringList(key, unitStringList);
  }

  @override
  Future<void> cacheUser({UserModel user}) async =>
      _shared.setString(USER_KEY, user.toJson());

  @override
  UserModel getCacheUser() {
    final _user = UserModel.fromJson(_shared.getString(USER_KEY));
    return _user;
  }

  @override
  Future<bool> logOutUser() async {
    return await _shared.remove(USER_KEY);
  }

  @override
  Future<void> cacheProjects({List<ProjectModel> projects}) async {
    final projectStringList = <String>[];
    projects.forEach(
        (project) => projectStringList.add(json.encode(project.toJson())));

    _shared.setStringList(PROJECTS_KEY, projectStringList);
  }

  @override
  Future<List<ProjectModel>> getCacheProject() async {
    final cached = _shared.getStringList(PROJECTS_KEY);
    final projectList = <ProjectModel>[];
    if (cached != null) {
      cached.forEach((projectString) =>
          projectList.add(ProjectModel.fromJson(json.decode(projectString))));
      return projectList;
    }
    return null;
  }
}
