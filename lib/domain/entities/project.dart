import 'package:equatable/equatable.dart';

class Project extends Equatable {
  Project(
      {this.projectId,
      this.projectName,
      this.projectDescription,
      this.url,
      this.bannerUrl});

  final String projectId;
  final String projectName;
  final String projectDescription;
  final String url;
  final String bannerUrl;

  @override
  List<Object> get props => [projectId];
}
