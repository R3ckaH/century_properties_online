import 'package:century_mobile/core/call/usecase.dart';
import 'package:century_mobile/core/error/failure.dart';
import 'package:century_mobile/domain/repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetLinkPDF implements UseCase<String, GetLinkPDFParams> {
  final CenturyPropertiesRepository _repo;

  GetLinkPDF(this._repo);

  @override
  Future<Either<Failure, String>> call(GetLinkPDFParams params) async =>
      await _repo.getLinkPDF(
          baseURL: params.baseURL,
          projectID: params.projectID,
          unitID: params.unitID,
          forex: params.forex,
          termId: params.termId,
          parkingName: params.parkingName,
          dateReserve: params.dateReserve,
          isForeign: params.isForeign,
          storage: params.storage,
          project: params.project,
          ffCode: params.ffCode,
          unitPriceWithVAT: params.unitPriceWithVAT,
          totalPrice: params.totalPrice,
          totalFfPrice: params.totalFfPrice,
          parkingID: params.parkingID,
          userName: params.userName);
}

class GetLinkPDFParams extends Equatable {
  final String baseURL;
  final String projectID;
  final String unitID;
  final String forex;
  final int termId;
  final String parkingName;
  final DateTime dateReserve;
  final bool isForeign;
  final String storage;
  final String project;
  final String ffCode;
  final double unitPriceWithVAT;
  final double totalPrice;
  final double totalFfPrice;
  final int parkingID;
  final String userName;

  GetLinkPDFParams(
      {this.baseURL,
      this.projectID,
      this.unitID,
      this.forex,
      this.termId,
      this.parkingName,
      this.dateReserve,
      this.isForeign,
      this.storage,
      this.project,
      this.ffCode,
      this.unitPriceWithVAT,
      this.totalPrice,
      this.totalFfPrice,
      this.parkingID,
      this.userName});

  @override
  List<Object> get props => [
        baseURL,
        projectID,
        unitID,
        forex,
        termId,
        parkingName,
        dateReserve,
        isForeign,
        storage,
        project,
        ffCode,
        unitPriceWithVAT,
        totalPrice,
        totalFfPrice,
        parkingID,
        userName
      ];
}
