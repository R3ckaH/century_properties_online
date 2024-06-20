import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel(
      {this.projectId,
      this.projectName,
      this.projectDescription,
      this.url,
      this.bannerUrl})
      : super(
            projectDescription: projectDescription,
            projectId: projectId,
            projectName: projectName,
            url: url,
            bannerUrl: bannerUrl);

  final String projectId;
  final String projectName;
  final String projectDescription;
  final String url;
  final String bannerUrl;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        projectId: json["Project_ID"],
        projectName: json["Project_Name"],
        projectDescription: json["Project_Description"],
        url: json["URL"],
        bannerUrl: json["Banner_URL"],
      );

  Map<String, dynamic> toJson() => {
        "Project_ID": projectId,
        "Project_Name": projectName,
        "Project_Description": projectDescription,
        "URL": url,
        "Banner_URL": bannerUrl
      };
}
