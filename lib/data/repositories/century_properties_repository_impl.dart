import 'package:century_mobile/domain/entities/building.dart';
import 'package:century_mobile/domain/entities/parking_building.dart';
import 'package:century_mobile/domain/entities/parking_level.dart';
import 'package:century_mobile/domain/entities/parking_slot.dart';
import 'package:century_mobile/domain/entities/payment_option.dart';
import 'package:century_mobile/domain/entities/payment_schedule.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/inclusion.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/unit.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/century_properties_repository.dart';
import '../datasource/century_properties_local_data_source.dart';
import '../datasource/century_properties_remote_data_source.dart';

class CenturyPropertiesRepositoryImpl implements CenturyPropertiesRepository {
  final CenturyPropertiesRemoteDataSource _remote;
  final CenturyPropertiesLocalDataSource _local;

  CenturyPropertiesRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<Failure, User>> login(
      {String username, String password}) async {
    try {
      final _user = await _remote.login(username: username, password: password);
      await _local.cacheUser(user: _user);
      return Right(_user);
    } on LoginException catch (e) {
      return Left(LoginFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    try {
      final _projects = await _remote.fetchProjects();
      return Right(_projects);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<UnitEntity>>> getUnits({String projectID}) async {
    try {
      final _units = await _remote.fetchUnits(projectID: projectID);
      return Right(_units);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('$e'));
    }
  }

  @override
  Future<Either<Failure, List<UnitEntity>>> getBuildingsItem(
      String building) async {
    try {
      final _units = await _remote.fetchUnits(building: building);
      return Right(_units);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('$e'));
    }
  }

  @override
  bool isLoggedIn() {
    try {
      return _local.getCacheUser() != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<Failure, List<Inclusion>>> getSpecs({String unitID}) async {
    try {
      final _specs = await _remote.fetchSpecs(unitID: unitID);
      return Right(_specs);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('UNEXPECTED ERROR'));
    }
  }

  @override
  User getUser() {
    final _user = _local.getCacheUser();

    return _user;
  }

  @override
  Future<bool> logOut() async => await _local.logOutUser();

  @override
  Future<Either<Failure, List<Building>>> getBuildings(
      {String projectId}) async {
    try {
      final _buildings = await _remote.fetchBuildings(projectId: projectId);
      return Right(_buildings);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('UNEXPECTED ERROR'));
    }
  }

  @override
  Future<Either<Failure, List<ParkingBuilding>>> getParkingBuildings(
      {String projectID}) async {
    try {
      final _parkingBuildings =
          await _remote.fetchParkingBuildings(projectId: projectID);
      return Right(_parkingBuildings);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ParkingLevel>>> getParkingLevels(
      {String building}) async {
    try {
      final _parkingLevels =
          await _remote.fetchParkingLevels(building: building);
      return Right(_parkingLevels);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ParkingSlot>>> getParkingSlots(
      {String building, String floorName}) async {
    try {
      final _parkingSlots = await _remote.fetchParkingSlots(
          building: building, floorName: floorName);

/*      print('TEST START');
      print(_parkingSlots);
      print('TEST END');*/
      return Right(_parkingSlots);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<PaymentOption>>> getPaymentOptions(
      {String baseURL,
      String projectID,
      String unitID,
      String tag,
      String ch,
      String ffCode,
      bool isForeign,
      String parkingID}) async {
/*    print('TEST START');
    final _paymentOptions = await _remote.fetchPaymentOptions(baseURL : baseURL, projectID: projectID, unitID: unitID, tag: tag, ch: ch, ffCode: ffCode, isForeign: isForeign, parkingID: parkingID);
    print('TEST $baseURL');*/

    try {
      final _paymentOptions = await _remote.fetchPaymentOptions(
          baseURL: baseURL,
          projectID: projectID,
          unitID: unitID,
          tag: tag,
          ch: ch,
          ffCode: ffCode,
          isForeign: isForeign,
          parkingID: parkingID);
      return Right(_paymentOptions);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
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
      String userName}) async {
/*    print('TEST START');
    final _paymentOptions = await _remote.fetchPaymentOptions(baseURL : baseURL, projectID: projectID, unitID: unitID, tag: tag, ch: ch, ffCode: ffCode, isForeign: isForeign, parkingID: parkingID);
    print('TEST $baseURL');*/

    try {
      final _paymentSchedules = await _remote.fetchPaymentSchedules(
        baseURL: baseURL,
        projectID: projectID,
        unitID: unitID,
        forex: forex,
        termId: termId,
        parkingName: parkingName,
        dateReserve: dateReserve,
        isForeign: isForeign,
        storage: storage,
        project: project,
        ffCode: ffCode,
        unitPriceWithVAT: unitPriceWithVAT,
        totalPrice: totalPrice,
        totalFfPrice: totalFfPrice,
        parkingID: parkingID,
        userName: userName,
      );
      return Right(_paymentSchedules);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
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
      String userName}) async {
/*    print('TEST START');
    final _paymentOptions = await _remote.fetchPaymentOptions(baseURL : baseURL, projectID: projectID, unitID: unitID, tag: tag, ch: ch, ffCode: ffCode, isForeign: isForeign, parkingID: parkingID);
    print('TEST $baseURL');*/

    try {
      final _paymentSchedules = await _remote.fetchLinkPDF(
        baseURL: baseURL,
        projectID: projectID,
        unitID: unitID,
        forex: forex,
        termId: termId,
        parkingName: parkingName,
        dateReserve: dateReserve,
        isForeign: isForeign,
        storage: storage,
        project: project,
        ffCode: ffCode,
        unitPriceWithVAT: unitPriceWithVAT,
        totalPrice: totalPrice,
        totalFfPrice: totalFfPrice,
        parkingID: parkingID,
        userName: userName,
      );
      return Right(_paymentSchedules);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.message));
    }
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
    await _remote.uploadPaymentInfo(
        agentEmail: agentEmail,
        email: email,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        mobileNumber: mobileNumber,
        proofOfPayment: proofOfPayment,
        scheduleURL: scheduleURL,
        validId: validId);
  }
}
