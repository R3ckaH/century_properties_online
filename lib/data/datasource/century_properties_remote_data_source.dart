import 'dart:convert';

import 'package:century_mobile/core/global_variables.dart';
import 'package:century_mobile/data/model/building_model.dart';
import 'package:century_mobile/data/model/parking_building_model.dart';
import 'package:century_mobile/data/model/parking_level_model.dart';
import 'package:century_mobile/data/model/parking_slot_model.dart';
import 'package:century_mobile/data/model/payment_option_model.dart';
import 'package:century_mobile/data/model/payment_schedule.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../core/constant/string.dart';
import '../../core/error/exception.dart';
import '../model/inclusion_model.dart';
import '../model/project_model.dart';
import '../model/unit_model.dart';
import '../model/user_model.dart';
import 'package:intl/intl.dart';

abstract class CenturyPropertiesRemoteDataSource {
  Future<UserModel> login(
      {@required String username, @required String password});

  Future<List<ProjectModel>> fetchProjects();

  Future<List<UnitModel>> fetchUnits({String projectID, String building});
  Future<List<InclusionModel>> fetchSpecs({@required String unitID});
  Future<List<BuildingModel>> fetchBuildings({@required String projectId});
  Future<void> uploadPaymentInfo(
      {String firstName,
      String middleName,
      String scheduleURL,
      String lastName,
      String email,
      String mobileNumber,
      String agentEmail,
      String validId,
      String proofOfPayment});
  Future<List<ParkingBuildingModel>> fetchParkingBuildings(
      {@required String projectId});
  Future<List<ParkingLevelModel>> fetchParkingLevels({String building});
  Future<List<ParkingSlotModel>> fetchParkingSlots(
      {String building, String floorName});
  Future<List<PaymentOptionModel>> fetchPaymentOptions(
      {String baseURL,
      String projectID,
      String unitID,
      String tag,
      String ch,
      String ffCode,
      bool isForeign,
      String parkingID});

  Future<List<PaymentScheduleModel>> fetchPaymentSchedules(
      {String baseURL,
      String projectID,
      String unitID,
      String forex,
      int termId,
      String parkingName,
      DateTime dateReserve,
      bool isForeign,
      String storage,
      String project,
      String ffCode,
      double unitPriceWithVAT,
      double totalPrice,
      double totalFfPrice,
      int parkingID,
      String userName});
  Future<String> fetchLinkPDF(
      {String baseURL,
      String projectID,
      String unitID,
      String forex,
      int termId,
      String parkingName,
      DateTime dateReserve,
      bool isForeign,
      String storage,
      String project,
      String ffCode,
      double unitPriceWithVAT,
      double totalPrice,
      double totalFfPrice,
      int parkingID,
      String userName});
}

class CenturyPropertiesRemoteDataSourceImpl
    implements CenturyPropertiesRemoteDataSource {
  final http.Client _client;

  CenturyPropertiesRemoteDataSourceImpl(this._client);

  @override
  Future<UserModel> login({String username, String password}) async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_Login?un=$username&pw=$password&accessToken=$API_KEY';
    Response postResponse = await _client.post(url);

    Response getResponse = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    return json.decode(postResponse.body)
        ? UserModel.fromJson(getResponse.body)
        : throw LoginException(json.decode(getResponse.body)['message']);
  }

  @override
  Future<List<ProjectModel>> fetchProjects() async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_Projects?accessToken=$API_KEY';
    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    final projectList = json.decode(response.body);

    List<ProjectModel> _projects = [];

    projectList.forEach((map) => _projects.add(ProjectModel.fromJson(map)));

    return response.statusCode == 200
        ? _projects
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<List<UnitModel>> fetchUnits(
      {String projectID, String building}) async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_Inventory?accessToken=$API_KEY';
    final bUrl =
        'https://api.centurypropertiesonline.com/api/Century_Inventory?building=$building&accessToken=$API_KEY';
    Response response = await _client.get(
      building == null ? url : bUrl,
      headers: {'Content-Type': 'application/json'},
    );

    final unitList = json.decode(response.body);
    List<UnitModel> _units = [];

    unitList.forEach((map) => _units.add(UnitModel.fromJson(map)));

    if (building == null) {
      List<UnitModel> filtered = projectID == 'All'
          ? _units
          : _units.where((unit) => unit.projectId.contains(projectID)).toList();

      return response.statusCode == 200
          ? filtered
          : throw ServerException('SERVER MAINTENANCE');
    } else {
      return response.statusCode == 200
          ? _units
          : throw ServerException('SERVER MAINTENANCE');
    }
  }

  @override
  Future<List<InclusionModel>> fetchSpecs({String unitID}) async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_UnitDeliverables?unitID=$unitID&accessToken=$API_KEY';
    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    final specList = json.decode(response.body);

    List<InclusionModel> _specs = [];

    specList.forEach((map) => _specs.add(InclusionModel.fromJson(map)));

    return response.statusCode == 200
        ? _specs
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<List<BuildingModel>> fetchBuildings({String projectId}) async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_Buildings?project=$projectId&accessToken=$API_KEY';
    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    final specList = json.decode(response.body);

    List<BuildingModel> _specs = [];

    specList.forEach((map) => _specs.add(BuildingModel.fromJson(map)));
    return response.statusCode == 200
        ? _specs
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<List<ParkingBuildingModel>> fetchParkingBuildings(
      {String projectId}) async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_ParkingBuildings?projectID=$projectId&accessToken=$API_KEY';

    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    print(url);
    print(response.statusCode);
    print(response.body);

    final specList = json.decode(response.body);

    List<ParkingBuildingModel> _specs = [];

    specList.forEach((map) => _specs.add(ParkingBuildingModel.fromJson(map)));
    return response.statusCode == 200 || response.statusCode == 201
        ? _specs
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<List<ParkingLevelModel>> fetchParkingLevels({String building}) async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_ParkingLevels?building=$building&accessToken=$API_KEY';

    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    print(url);
    print(response.statusCode);
    print(response.body);
    final specList = json.decode(response.body);

    List<ParkingLevelModel> _specs = [];

    specList.forEach((map) => _specs.add(ParkingLevelModel.fromJson(map)));
    return response.statusCode == 200 || response.statusCode == 201
        ? _specs
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<List<ParkingSlotModel>> fetchParkingSlots(
      {String building, String floorName}) async {
    final url =
        'https://api.centurypropertiesonline.com/api/Century_ParkingSlots?building=$building&floor_name=$floorName&accessToken=$API_KEY';

    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    final specList = json.decode(response.body);

    print(url);
    print(response.statusCode);
    print(response.body);

    List<ParkingSlotModel> _specs = [];

    specList.forEach((map) => _specs.add(ParkingSlotModel.fromJson(map)));
    print(_specs);

    return response.statusCode == 200 || response.statusCode == 201
        ? _specs
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<List<PaymentOptionModel>> fetchPaymentOptions(
      {String baseURL,
      String projectID,
      String unitID,
      String tag,
      String ch,
      String ffCode,
      bool isForeign,
      String parkingID}) async {
    if (parkingID == null) parkingID = '0';

    final url =
        '${baseURL}Project_ID=$projectID&Unit_ID=$unitID&Tag=$tag&ch=$ch&ffcode=$ffCode&isForeign=$isForeign&parkingID=$parkingID&accessToken=$API_KEY';

    print(url);
    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    final specList = json.decode(response.body);

    print(url);
    print(response.statusCode);
    print(response.body);

    List<PaymentOptionModel> _specs = [];

    specList.forEach((map) => _specs.add(PaymentOptionModel.fromJson(map)));
    print(_specs);

    return response.statusCode == 200 || response.statusCode == 201
        ? _specs
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<List<PaymentScheduleModel>> fetchPaymentSchedules(
      {String baseURL,
      String projectID,
      String unitID,
      String forex,
      int termId,
      String parkingName,
      DateTime dateReserve,
      bool isForeign,
      String storage,
      String project,
      String ffCode,
      double unitPriceWithVAT,
      double totalPrice,
      double totalFfPrice,
      int parkingID,
      String userName}) async {

    String formattedDate = DateFormat('MM-dd-yyyy').format(dateReserve);
    GLOBAL_APISCHEDULE_URL = '';

    final url =
        '${baseURL}Project_ID=$projectID&Unit_ID=$unitID&Forex=$forex&PaymentTermID=$termId&Park=$parkingName&DateRes=$formattedDate&Foreign=$isForeign&storage=$storage&project=$project&validfandf=$ffCode&pricewithvat=$unitPriceWithVAT&totalprice=$totalPrice&totalffprice=$totalFfPrice&parkid=$parkingID&userID=$userName&accessToken=$API_KEY';

    GLOBAL_APISCHEDULE_URL = url;


    print(url);

    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    final specList = json.decode(response.body)['Schedule'];

    print('SPECLIST HERE $specList');

    List<PaymentScheduleModel> _specs = [];

    specList.forEach((map) => _specs.add(PaymentScheduleModel.fromJson(map)));
    print(_specs);

    return response.statusCode == 200 || response.statusCode == 201
        ? _specs
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<String> fetchLinkPDF(
      {String baseURL,
      String projectID,
      String unitID,
      String forex,
      int termId,
      String parkingName,
      DateTime dateReserve,
      bool isForeign,
      String storage,
      String project,
      String ffCode,
      double unitPriceWithVAT,
      double totalPrice,
      double totalFfPrice,
      int parkingID,
      String userName}) async {

    String formattedDate = DateFormat('MM-dd-yyyy').format(dateReserve);

    final url =
        '${baseURL}Project_ID=$projectID&Unit_ID=$unitID&Forex=$forex&PaymentTermID=$termId&Park=$parkingName&DateRes=$formattedDate&Foreign=$isForeign&storage=$storage&project=$project&validfandf=$ffCode&pricewithvat=$unitPriceWithVAT&totalprice=$totalPrice&totalffprice=$totalFfPrice&parkid=$parkingID&userID=$userName&accessToken=$API_KEY&generatePDF=true';
    Response response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    final linkPDF = json.decode(response.body)['PDF_Link'];
    print(linkPDF);
    return response.statusCode == 200 || response.statusCode == 201
        ? linkPDF
        : throw ServerException('SERVER MAINTENANCE');
  }

  @override
  Future<void> uploadPaymentInfo(
      {String firstName,
      String middleName,
      String lastName,
      String email,
      String mobileNumber,
      String agentEmail,
      String validId,
      String scheduleURL,
      String proofOfPayment}) async {

    String url = 'https://api.centurypropertiesonline.com/api/Century_HoldingDetails';


    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['buyer_fname'] = firstName;
    request.fields['buyer_mname'] = middleName;
    request.fields['buyer_lname'] = lastName;
    request.fields['buyer_email'] = email;
    request.fields['buyer_mobileno'] = mobileNumber;
    request.fields['agent_email'] = agentEmail;
    request.fields['APISchedule_URL'] = GLOBAL_APISCHEDULE_URL;
    request.fields['userID'] = GLOBAL_USERNAME;
    request.fields['accessToken'] = API_KEY;

    request.files.add(
        await http.MultipartFile.fromPath(
        'valid_id', validId,)
    );

    request.files.add(await http.MultipartFile.fromPath(
        'rf_payment', proofOfPayment)
    );


    var res = await request.send();
    print(res.statusCode);
    print(res.reasonPhrase);

  }
}
