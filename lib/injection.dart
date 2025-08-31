import 'package:custom_calender/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureDependencies() {
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  // Register your dependencies here
}
