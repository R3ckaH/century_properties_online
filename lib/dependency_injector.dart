import 'package:century_mobile/domain/usecases/get_buildings.dart';
import 'package:century_mobile/domain/usecases/get_buildings_item.dart';
import 'package:century_mobile/domain/usecases/get_link_pdf.dart';
import 'package:century_mobile/domain/usecases/get_parking_buildings.dart';
import 'package:century_mobile/domain/usecases/get_parking_levels.dart';
import 'package:century_mobile/domain/usecases/get_parking_slots.dart';
import 'package:century_mobile/domain/usecases/get_payment_options.dart';
import 'package:century_mobile/domain/usecases/get_payment_schedules.dart';
import 'package:century_mobile/domain/usecases/upload_payment_info.dart';
import 'package:century_mobile/presentation/cubit/building/building_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_building/parking_building_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_level/parking_level_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_slot/parking_slot_cubit.dart';
import 'package:century_mobile/presentation/cubit/payment_option/payment_option_cubit.dart';
import 'package:century_mobile/presentation/cubit/payment_schedule/payment_schedule_cubit.dart';
import 'package:century_mobile/presentation/cubit/payment_upload/payment_upload_cubit.dart';
import 'package:century_mobile/presentation/cubit/pdf_link/pdflink_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/century_properties_local_data_source.dart';
import 'data/datasource/century_properties_remote_data_source.dart';
import 'data/repositories/century_properties_repository_impl.dart';
import 'domain/repositories/century_properties_repository.dart';
import 'domain/usecases/get_projects.dart';
import 'domain/usecases/get_specs.dart';
import 'domain/usecases/get_units.dart';
import 'domain/usecases/get_user.dart';
import 'domain/usecases/is_logged_in.dart';
import 'domain/usecases/log_out.dart';
import 'domain/usecases/login.dart';
import 'presentation/cubit/authentication/authentication_cubit.dart';
import 'presentation/cubit/inclusion/inclusion_cubit.dart';
import 'presentation/cubit/login/login_cubit.dart';
import 'presentation/cubit/project/project_cubit.dart';
import 'presentation/cubit/unit/unit_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => ProjectCubit(sl()));
  sl.registerFactory(() => UnitCubit(sl(), sl()));
  sl.registerFactory(() => AuthenticationCubit(sl(), sl(), sl()));
  sl.registerFactory(() => InclusionCubit(sl()));
  sl.registerFactory(() => BuildingCubit(sl()));
  sl.registerFactory(() => ParkingBuildingCubit(sl()));
  sl.registerFactory(() => ParkingLevelCubit(sl()));
  sl.registerFactory(() => ParkingSlotCubit(sl()));
  sl.registerFactory(() => PaymentOptionCubit(sl()));
  sl.registerFactory(() => PaymentScheduleCubit(sl()));
  sl.registerFactory(() => PdflinkCubit(sl()));
  sl.registerFactory(() => PaymentUploadCubit(sl()));

  sl.registerLazySingleton(() => IsLoggedIn(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => GetProjects(sl()));
  sl.registerLazySingleton(() => GetUnits(sl()));
  sl.registerLazySingleton(() => GetSpecs(sl()));
  sl.registerLazySingleton(() => GetBuildings(sl()));
  sl.registerLazySingleton(() => GetBuildingsItem(sl()));
  sl.registerLazySingleton(() => GetParkingBuildings(sl()));
  sl.registerLazySingleton(() => GetParkingLevels(sl()));
  sl.registerLazySingleton(() => GetParkingSlots(sl()));
  sl.registerLazySingleton(() => GetPaymentOptions(sl()));
  sl.registerLazySingleton(() => GetPaymentSchedules(sl()));
  sl.registerLazySingleton(() => GetLinkPDF(sl()));
  sl.registerLazySingleton(() => UploadPaymentInfo(sl()));

  sl.registerLazySingleton<CenturyPropertiesRepository>(
      () => CenturyPropertiesRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<CenturyPropertiesRemoteDataSource>(
      () => CenturyPropertiesRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<CenturyPropertiesLocalDataSource>(
      () => CenturyPropertiesLocalDataSourceImpl(sl()));

  final sharedPref = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => sharedPref);
}
