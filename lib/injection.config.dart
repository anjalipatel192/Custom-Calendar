// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'app_router.dart' as _i313;
import 'application/calender/calender_bloc.dart' as _i753;
import 'domain/repositories/calendar_repository.dart' as _i916;
import 'infrastructure/datasources/calendar_local_data_source.dart' as _i818;
import 'infrastructure/repositories/calendar_repository_impl.dart' as _i535;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i313.AppRouter>(() => _i313.AppRouter());
    gh.lazySingleton<_i818.CalendarLocalDataSource>(
      () => _i818.CalendarLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i916.CalendarRepository>(
      () => _i535.CalendarRepositoryImpl(gh<_i818.CalendarLocalDataSource>()),
    );
    gh.factory<_i753.CalenderBloc>(
      () => _i753.CalenderBloc(gh<_i916.CalendarRepository>()),
    );
    return this;
  }
}
