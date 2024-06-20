import 'package:century_mobile/domain/entities/building.dart';
import 'package:century_mobile/domain/entities/parking_building.dart';
import 'package:century_mobile/domain/entities/parking_level.dart';
import 'package:century_mobile/domain/entities/parking_slot.dart';
import 'package:century_mobile/domain/entities/payment_option.dart';
import 'package:century_mobile/domain/entities/payment_schedule.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../entities/inclusion.dart';
import '../entities/project.dart';
import '../entities/unit.dart';
import '../entities/user.dart';

abstract class CenturyPropertiesRepository {
  Future<Either<Failure, User>> login(
      {@required String username, @required String password});

  Future<Either<Failure, List<Project>>> getProjects();

  Future<Either<Failure, List<UnitEntity>>> getUnits({String projectID});

  Future<Either<Failure, List<Inclusion>>> getSpecs({@required String unitID});

  Future<Either<Failure, List<Building>>> getBuildings(
      {@required String projectId});
  Future<Either<Failure, List<UnitEntity>>> getBuildingsItem(String building);
  bool isLoggedIn();

  Future<void> uploadPaymentInfo(
      {String firstName,
      String middleName,
      String lastName,
      String email,
      String mobileNumber,
      String agentEmail,
      String validId,
      String scheduleURL,
      String proofOfPayment});

  Future<bool> logOut();

  User getUser();

  Future<Either<Failure, List<ParkingBuilding>>> getParkingBuildings(
      {@required String projectID});

  Future<Either<Failure, List<ParkingLevel>>> getParkingLevels(
      {String building});

  Future<Either<Failure, List<ParkingSlot>>> getParkingSlots(
      {String building, String floorName});

  Future<Either<Failure, List<PaymentOption>>> getPaymentOptions(
      {String baseURL,
      String projectID,
      String unitID,
      String tag,
      String ch,
      String ffCode,
      bool isForeign,
      String parkingID});

  Future<Either<Failure, List<PaymentSchedule>>> getPaymentSchedule(
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
  Future<Either<Failure, String>> getLinkPDF(
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
