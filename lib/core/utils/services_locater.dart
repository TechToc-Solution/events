import 'package:dio/dio.dart';
import 'package:events/core/shared/repos/token_repo/token_repo.dart';
import 'package:events/core/shared/repos/token_repo/token_repo_iplm.dart';
import 'package:events/features/group_details/data/repo/group_repo.dart';
import 'package:events/features/group_details/data/repo/group_repo_iplm.dart';
import 'package:events/features/group_details/presentation/view_model/get_group_details/get_group_details_cubit.dart';
import 'package:events/features/home/data/repo/home/home.dart';
import 'package:events/features/home/data/repo/home/home_repo_iplm.dart';
import 'package:get_it/get_it.dart';
import '../Api_services/api_services.dart';

final getit = GetIt.instance;

void setupLocatorServices() {
  // init Dio
  getit.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        receiveTimeout: Duration(minutes: 1),
      ),
    ),
  );
  // init API Service
  getit.registerLazySingleton<ApiServices>(() => ApiServices(getit.get<Dio>()));

  getit.registerSingleton<TokenRepo>(TokenRepoIplm(getit.get<ApiServices>()));
  getit.registerSingleton<HomeRepo>(HomeRepoIplm(getit.get<ApiServices>()));
  getit.registerSingleton<GroupRepo>(GroupRepoIplm(apiServices: getit.get<ApiServices>()));

  getit.registerFactory<GetGroupDetailsCubit>(() => GetGroupDetailsCubit(getit.get<GroupRepo>()));
}
