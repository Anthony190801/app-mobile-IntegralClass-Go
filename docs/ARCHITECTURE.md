# Arquitectura del Software - INTEGRALCLASS GO

Este documento describe la arquitectura del software de la aplicación móvil INTEGRALCLASS GO, basada en Clean Architecture y el patrón MVVM.

---

## 1. Introducción

### 1.1 Objetivo

La arquitectura del proyecto está diseñada para:
- **Separación de responsabilidades**: Cada capa tiene un propósito claro y definido
- **Testabilidad**: Facilita las pruebas unitarias e integración
- **Mantenibilidad**: Código organizado y fácil de mantener
- **Escalabilidad**: Permite agregar nuevas funcionalidades sin afectar código existente
- **Independencia**: Las capas internas no dependen de frameworks o librerías externas

### 1.2 Principios Arquitectónicos

- **Clean Architecture**: Separación en capas con dependencias unidireccionales
- **SOLID**: Principios de diseño orientado a objetos
- **DRY**: Don't Repeat Yourself
- **Feature-based**: Organización por funcionalidades, no por tipo de archivo
- **MVVM**: Model-View-ViewModel para la capa de presentación

---

## 2. Clean Architecture

### 2.1 Estructura de Capas

La arquitectura se organiza en tres capas principales:

```
┌─────────────────────────────────────────┐
│         PRESENTATION LAYER              │
│  (UI, ViewModels, Widgets, State)      │
└────────────────┬────────────────────────┘
                 │ Depends on
┌────────────────▼────────────────────────┐
│          DOMAIN LAYER                   │
│  (Entities, Use Cases, Repositories)   │
└────────────────┬────────────────────────┘
                 │ Depends on
┌────────────────▼────────────────────────┐
│           DATA LAYER                    │
│  (API, Local Storage, Models, Cache)   │
└─────────────────────────────────────────┘
```

### 2.2 Regla de Dependencias

**Las dependencias apuntan hacia adentro:**
- Presentation depende de Domain
- Domain NO depende de Presentation ni Data
- Data depende de Domain

**Domain es independiente** de frameworks, UI y fuentes de datos externas.

---

## 3. Estructura de Carpetas

### 3.1 Organización General

```
lib/
├── main.dart
├── core/                           # Funcionalidades transversales
│   ├── constants/                  # Constantes de la aplicación
│   ├── errors/                     # Manejo de errores
│   ├── network/                    # Configuración de red
│   ├── theme/                      # Tema y estilos
│   ├── utils/                      # Utilidades generales
│   └── widgets/                    # Widgets reutilizables
│
├── features/                       # Módulos funcionales
│   ├── auth/                       # Módulo de autenticación
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── dashboard/                  # Dashboard principal
│   ├── practice/                   # Práctica por temas
│   ├── daily_evaluation/           # Evaluaciones diarias
│   ├── mock_exam/                  # Simulacros virtuales
│   ├── gamification/               # Gamificación y progreso
│   ├── versus/                     # Versus (Retos)
│   ├── ranking/                    # Ranking
│   ├── forum/                      # Comunidad académica
│   ├── notifications/              # Notificaciones
│   └── settings/                   # Configuración
│
└── routes/                         # Configuración de navegación
```

### 3.2 Organización por Feature

Cada feature sigue la misma estructura interna:

```
feature_name/
├── data/                           # Capa de datos
│   ├── datasources/                # Fuentes de datos (API, Local)
│   │   ├── remote_datasource.dart
│   │   └── local_datasource.dart
│   ├── models/                     # Modelos de datos (DTOs)
│   │   └── feature_model.dart
│   └── repositories/               # Implementación de repositorios
│       └── feature_repository_impl.dart
│
├── domain/                         # Capa de dominio
│   ├── entities/                   # Entidades de negocio
│   │   └── feature_entity.dart
│   ├── repositories/               # Interfaces de repositorios
│   │   └── feature_repository.dart
│   └── usecases/                   # Casos de uso
│       ├── get_feature_data.dart
│       └── update_feature_data.dart
│
└── presentation/                   # Capa de presentación
    ├── providers/                  # State management (Provider/Bloc)
    │   └── feature_provider.dart
    ├── screens/                    # Pantallas
    │   ├── feature_list_screen.dart
    │   └── feature_detail_screen.dart
    └── widgets/                    # Widgets específicos del feature
        └── feature_card.dart
```

---

## 4. Descripción de Capas

### 4.1 Domain Layer (Capa de Dominio)

**Responsabilidad**: Contiene la lógica de negocio pura, independiente de frameworks.

#### 4.1.1 Entities
- Representan objetos de negocio
- Sin dependencias externas
- Inmutables cuando sea posible
- Ejemplo: `User`, `Question`, `Exam`, `Achievement`

```dart
// Ejemplo de Entity
class User {
  final String id;
  final String name;
  final String email;
  final int level;
  final int xp;
  
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.level,
    required this.xp,
  });
}
```

#### 4.1.2 Use Cases
- Representan acciones específicas del usuario
- Un caso de uso = una acción
- Ejecutan lógica de negocio
- Ejemplo: `LoginUser`, `GetDailyEvaluation`, `SubmitAnswer`

```dart
// Ejemplo de Use Case
class LoginUser {
  final AuthRepository repository;
  
  LoginUser(this.repository);
  
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}
```

#### 4.1.3 Repository Interfaces
- Definen contratos para acceso a datos
- Implementados en la capa Data
- Permiten inversión de dependencias

```dart
// Ejemplo de Repository Interface
abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getCurrentUser();
}
```

### 4.2 Data Layer (Capa de Datos)

**Responsabilidad**: Implementa el acceso a datos (API, base de datos local, cache).

#### 4.2.1 Data Sources
- **Remote Data Source**: Consumo de API REST
- **Local Data Source**: Almacenamiento local (SharedPreferences, Hive, SQLite)
- Retornan modelos de datos (DTOs)

```dart
// Ejemplo de Remote Data Source
abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;
  
  AuthRemoteDataSourceImpl(this.apiClient);
  
  @override
  Future<UserModel> login(String email, String password) async {
    final response = await apiClient.post('/auth/login', {
      'email': email,
      'password': password,
    });
    return UserModel.fromJson(response);
  }
}
```

#### 4.2.2 Models (DTOs)
- Representan datos de la API o almacenamiento
- Extienden o mapean a Entities
- Incluyen métodos `fromJson` y `toJson`

```dart
// Ejemplo de Model
class UserModel extends User {
  UserModel({
    required String id,
    required String name,
    required String email,
    required int level,
    required int xp,
  }) : super(
    id: id,
    name: name,
    email: email,
    level: level,
    xp: xp,
  );
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      level: json['level'],
      xp: json['xp'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'level': level,
      'xp': xp,
    };
  }
}
```

#### 4.2.3 Repository Implementations
- Implementan interfaces de Domain
- Orquestan Data Sources (remote y local)
- Manejan cache y sincronización
- Mapean Models a Entities

```dart
// Ejemplo de Repository Implementation
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
```

### 4.3 Presentation Layer (Capa de Presentación)

**Responsabilidad**: Maneja la UI y la interacción con el usuario.

#### 4.3.1 ViewModels / Providers
- Contienen lógica de presentación
- Se comunican con Use Cases
- Gestionan estado de UI
- NO conocen detalles de widgets

```dart
// Ejemplo con Provider
class AuthProvider extends ChangeNotifier {
  final LoginUser loginUser;
  final GetCurrentUser getCurrentUser;
  
  User? _user;
  bool _isLoading = false;
  String? _error;
  
  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  AuthProvider({
    required this.loginUser,
    required this.getCurrentUser,
  });
  
  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    final result = await loginUser(LoginParams(email: email, password: password));
    
    result.fold(
      (failure) => _error = failure.message,
      (user) => _user = user,
    );
    
    _isLoading = false;
    notifyListeners();
  }
}
```

#### 4.3.2 Screens / Views
- Widgets de Flutter que representan pantallas completas
- Consumen ViewModels/Providers
- Manejadores de eventos de usuario
- Reactivos al estado

```dart
// Ejemplo de Screen
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (authProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          
          if (authProvider.error != null) {
            return Center(child: Text(authProvider.error!));
          }
          
          return LoginForm();
        },
      ),
    );
  }
}
```

#### 4.3.3 Widgets
- Componentes reutilizables específicos del feature
- Presentan datos
- Manejan eventos simples
- Pueden tener su propio estado local

---

## 5. Patrón MVVM

### 5.1 Componentes del MVVM

- **Model**: Entities de Domain Layer
- **View**: Screens y Widgets de Presentation Layer
- **ViewModel**: Providers/State Managers de Presentation Layer

### 5.2 Flujo de Datos

```
User Action → View → ViewModel → Use Case → Repository → Data Source
                                                              ↓
User Interface ← View ← ViewModel ← Use Case ← Repository ← Data
```

1. Usuario interactúa con la View
2. View notifica a ViewModel
3. ViewModel ejecuta Use Case apropiado
4. Use Case llama al Repository
5. Repository obtiene datos de Data Source
6. Datos fluyen de vuelta transformándose en cada capa
7. ViewModel actualiza estado
8. View se reconstruye automáticamente

---

## 6. Gestión de Estado

### 6.1 Opción: Provider

- **Ventajas**: Simple, oficial de Flutter, buena para proyectos medianos
- **Uso**: State management principal

### 6.2 Opción Alternativa: BLoC

- **Ventajas**: Separación clara, testable, buena para proyectos grandes
- **Uso**: Si el proyecto crece en complejidad

### 6.3 Estado Local vs Global

- **Estado Local**: `StatefulWidget` para widgets simples
- **Estado de Feature**: Provider/BLoC específico del feature
- **Estado Global**: Provider/BLoC compartido en `core/`

---

## 7. Manejo de Errores

### 7.1 Jerarquía de Excepciones

```dart
// Domain Layer
abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure() : super('Error del servidor');
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Sin conexión a internet');
}

class CacheFailure extends Failure {
  CacheFailure() : super('Error de almacenamiento local');
}
```

### 7.2 Uso de Either (dartz)

- `Either<Failure, Success>` para operaciones que pueden fallar
- Left = Error (Failure)
- Right = Éxito (datos)

```dart
Future<Either<Failure, User>> getUser() async {
  try {
    final user = await repository.getUser();
    return Right(user);
  } catch (e) {
    return Left(ServerFailure());
  }
}
```

---

## 8. Inyección de Dependencias

### 8.1 Librería: get_it

- Registro de dependencias como singleton o factory
- Resolución automática de dependencias

### 8.2 Configuración

```dart
// lib/core/injection/injection_container.dart
final getIt = GetIt.instance;

void init() {
  // Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );
  
  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );
  
  // Use Cases
  getIt.registerLazySingleton(() => LoginUser(getIt()));
  
  // Providers
  getIt.registerFactory(() => AuthProvider(
    loginUser: getIt(),
    getCurrentUser: getIt(),
  ));
}
```

---

## 9. Navegación

### 9.1 Opción: go_router

- Routing declarativo
- Deep linking
- Navegación type-safe

### 9.2 Estructura de Rutas

```dart
// lib/routes/app_router.dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => DashboardScreen(),
    ),
    // ... más rutas
  ],
);
```

---

## 10. Networking

### 10.1 HTTP Client

- **Librería**: `dio` o `http`
- **Interceptors**: Para autenticación, logging, manejo de errores

### 10.2 Configuración

```dart
// lib/core/network/api_client.dart
class ApiClient {
  final Dio dio;
  
  ApiClient() : dio = Dio(BaseOptions(
    baseUrl: 'https://api.integralclassgo.com',
    headers: {'Content-Type': 'application/json'},
  )) {
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(ErrorInterceptor());
  }
}
```

---

## 11. Almacenamiento Local

### 11.1 Opciones

- **SharedPreferences**: Para datos simples (tokens, preferencias)
- **Hive**: Para objetos complejos y cache
- **SQLite**: Para datos relacionales complejos (si es necesario)

### 11.2 Cache Strategy

- Cache de datos frecuentemente accedidos
- Invalidación de cache según reglas de negocio
- Sincronización con servidor

---

## 12. Testing

### 12.1 Estrategia

- **Unit Tests**: Use Cases, ViewModels, Utilidades
- **Widget Tests**: Widgets y Screens
- **Integration Tests**: Flujos completos de usuario

### 12.2 Estructura de Tests

```
test/
├── unit/
│   ├── domain/
│   │   └── usecases/
│   ├── data/
│   │   └── repositories/
│   └── presentation/
│       └── providers/
├── widget/
│   └── presentation/
│       └── widgets/
└── integration/
    └── flows/
```

---

## 13. Dependencias Principales

### 13.1 Producción

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.0.0
  # O bloc: ^8.0.0
  
  # Dependency Injection
  get_it: ^7.0.0
  
  # Networking
  dio: ^5.0.0
  
  # Local Storage
  shared_preferences: ^2.0.0
  hive: ^2.0.0
  
  # Routing
  go_router: ^12.0.0
  
  # Functional Programming
  dartz: ^0.10.0
  
  # Utilities
  equatable: ^2.0.0
  intl: ^0.18.0
```

### 13.2 Desarrollo

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  mockito: ^5.0.0
  build_runner: ^2.0.0
```

---

## 14. Convenciones y Mejores Prácticas

### 14.1 Nomenclatura

- **Archivos**: snake_case (ej: `auth_repository.dart`)
- **Clases**: PascalCase (ej: `AuthRepository`)
- **Variables/Funciones**: camelCase (ej: `getUserData`)
- **Constantes**: camelCase con `k` prefix (ej: `kApiBaseUrl`)

### 14.2 Organización de Código

- Un archivo = una clase (principio general)
- Imports ordenados: Flutter → Packages → Proyecto
- Documentación en código complejo

### 14.3 Flujo de Trabajo

1. Definir Entities en Domain
2. Definir Repository Interfaces
3. Implementar Use Cases
4. Implementar Data Sources y Models
5. Implementar Repository
6. Crear ViewModels/Providers
7. Crear UI (Screens y Widgets)

---

## 15. Diagramas

### 15.1 Flujo de Autenticación

```
LoginScreen → AuthProvider → LoginUser (UseCase) 
                                    ↓
                            AuthRepository
                                    ↓
                    ┌───────────────┴───────────────┐
                    ↓                               ↓
        AuthRemoteDataSource            AuthLocalDataSource
                    ↓                               ↓
                API Call                    Cache Token/User
```

### 15.2 Flujo de Obtención de Datos

```
Screen → Provider → UseCase → Repository Interface
                                ↓
                        Repository Implementation
                                ↓
                ┌───────────────┴───────────────┐
                ↓                               ↓
        Remote DataSource              Local DataSource
                ↓                               ↓
            API Call                      Cache/DB
                ↓                               ↓
            Model ←─────────────────── Model
                ↓
            Entity
                ↓
            Provider State
                ↓
            UI Update
```

---

## 16. Escalabilidad

### 16.1 Agregar Nueva Feature

1. Crear carpeta `features/new_feature/`
2. Seguir estructura de carpetas estándar
3. Implementar capas: Domain → Data → Presentation
4. Registrar dependencias en injection container
5. Agregar rutas de navegación

### 16.2 Modificar Feature Existente

- Cambios en Domain afectan Data y Presentation
- Cambios en Data solo afectan Presentation
- Mantener interfaces estables

---

## 17. Documentación de Código

- Comentarios en código complejo
- Documentación de funciones públicas
- README en cada feature si es necesario
- Diagramas de flujo para lógica compleja

---

**Versión**: 1.0.0  
**Última actualización**: 2024  
**Autor**: Equipo de Desarrollo INTEGRALCLASS GO

