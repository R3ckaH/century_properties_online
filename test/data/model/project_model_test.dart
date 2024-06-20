import 'package:century_mobile/data/model/project_model.dart';
import 'package:century_mobile/domain/entities/project.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tModel = ProjectModel(
      projectDescription: 'lorem',
      projectId: '1',
      projectName: 'Lorem',
      url: 'htttps://loremipsum');

  test('Should check if the Project model is a subclass of Project', () async {
    expect(tModel, isA<Project>());
  });
}
