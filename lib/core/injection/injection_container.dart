/// Contenedor de inyección de dependencias
/// 
/// Registra y resuelve dependencias usando get_it
/// Siguiendo Clean Architecture, las dependencias se registran
/// desde las capas externas hacia las internas

// TODO: Agregar dependencia get_it en pubspec.yaml
// import 'package:get_it/get_it.dart';
//
// final getIt = GetIt.instance;
//
// /// Inicializa el contenedor de dependencias
// void init() {
//   // Data Sources
//   getIt.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSourceImpl(getIt()),
//   );
//   
//   getIt.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSourceImpl(getIt()),
//   );
//   
//   // Repositories
//   getIt.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(
//       remoteDataSource: getIt(),
//       localDataSource: getIt(),
//     ),
//   );
//   
//   // Use Cases
//   getIt.registerLazySingleton(() => LoginUser(getIt()));
//   
//   // Providers
//   getIt.registerFactory(() => AuthProvider(
//     loginUser: getIt(),
//   ));
// }

