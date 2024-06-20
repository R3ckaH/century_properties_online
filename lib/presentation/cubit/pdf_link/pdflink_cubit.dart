import 'package:bloc/bloc.dart';
import 'package:century_mobile/domain/usecases/get_link_pdf.dart';
import 'package:equatable/equatable.dart';

part 'pdflink_state.dart';

class PdflinkCubit extends Cubit<PdflinkState> {
  PdflinkCubit(this._getLinkPDF) : super(PdflinkInitial());
  final GetLinkPDF _getLinkPDF;
  void loadInitialData(
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
    emit(PdflinkLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherPaymentScheduleListOrFailure =
        await _getLinkPDF(GetLinkPDFParams(
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
    ));

    _eitherPaymentScheduleListOrFailure.fold(
      (error) => emit(PdflinkError(error.toString())),
      (link) => emit(PdflinkLoaded(link)),
    );
  }
}
