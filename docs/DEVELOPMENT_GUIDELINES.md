# Guías de Desarrollo - IntegralClass Go

Este documento establece las convenciones, estándares y mejores prácticas para el desarrollo del proyecto IntegralClass Go.

---

## 1. Introducción

### 1.1 Propósito

Este documento tiene como objetivo:
- Establecer estándares de código consistentes
- Guiar a los desarrolladores en la implementación
- Asegurar calidad y mantenibilidad del código
- Facilitar la colaboración en equipo

### 1.2 Alcance

Cubre:
- Convenciones de código Dart/Flutter
- Estructura de archivos y carpetas
- Patrones de diseño a seguir
- Procesos de desarrollo
- Herramientas y configuraciones

---

## 2. Configuración del Entorno de Desarrollo

### 2.1 Requisitos

- **Flutter SDK**: 3.10.4 o superior
- **Dart SDK**: Incluido con Flutter
- **IDE**: Android Studio, VS Code, o IntelliJ IDEA
- **Herramientas**:
  - Git (control de versiones)
  - Flutter CLI
  - Dart formatter

### 2.2 Configuración Inicial

```bash
# Clonar repositorio
git clone <repository-url>

# Navegar al proyecto
cd app_flutter_tesis

# Obtener dependencias
flutter pub get

# Ejecutar análisis
flutter analyze

# Formatear código
dart format .
```

### 2.3 Extensiones Recomendadas (VS Code)

- **Dart** (flutter.dart-code)
- **Flutter** (flutter.flutter)
- **Flutter Widget Snippets** (alexisvt.flutter-snippets)
- **Error Lens** (usernamehw.errorlens)
- **Pubspec Assist** (jeroen-meijer.pubspec-assist)

---

## 3. Convenciones de Código

### 3.1 Nomenclatura

#### Archivos y Carpetas
- **Archivos Dart**: `snake_case.dart`
  - Ejemplo: `auth_repository.dart`, `user_profile_screen.dart`
- **Carpetas**: `snake_case`
  - Ejemplo: `data_sources/`, `use_cases/`

#### Clases
- **PascalCase**: `class AuthRepository { }`
- **Abstract Classes**: Prefijo opcional `Base` o `Abstract`
  - Ejemplo: `abstract class BaseRepository { }`

#### Variables y Funciones
- **camelCase**: `getUserData()`, `currentUser`
- **Constantes**: `camelCase` con prefijo `k` o `UPPER_SNAKE_CASE`
  - Ejemplo: `const kApiBaseUrl = '...'` o `const API_BASE_URL = '...'`
- **Variables privadas**: Prefijo `_`
  - Ejemplo: `String _token;`

#### Enums
- **PascalCase** para el nombre del enum
- **camelCase** para los valores
```dart
enum UserRole {
  student,
  admin,
  moderator,
}
```

### 3.2 Formato de Código

#### Indentación
- **2 espacios** (no tabs)
- Configurar editor para usar espacios

#### Líneas
- Máximo **100 caracteres** por línea
- Ajustar automáticamente con formatter

#### Espaciado
- Línea en blanco entre funciones/métodos
- Línea en blanco entre secciones lógicas
- No espacios al final de líneas

#### Llaves
- Estilo **K&R** (llave de apertura en la misma línea)
```dart
if (condition) {
  // código
} else {
  // código
}
```

### 3.3 Imports

#### Orden
1. Imports de Flutter/Dart SDK
2. Imports de paquetes externos
3. Imports relativos del proyecto
4. Imports de la misma feature

#### Agrupación
```dart
// Flutter/Dart
import 'package:flutter/material.dart';
import 'dart:async';

// Paquetes externos
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

// Proyecto
import 'package:app_flutter_tesis/core/theme/app_colors.dart';
import 'package:app_flutter_tesis/features/auth/domain/entities/user.dart';

// Misma feature
import 'auth_repository.dart';
```

#### Eliminar Imports No Usados
- Ejecutar `dart fix --apply` regularmente

### 3.4 Comentarios

#### Documentación
- Usar `///` para documentación de API pública
- Usar `//` para comentarios inline

```dart
/// Autentica un usuario con email y contraseña.
/// 
/// Retorna [User] si las credenciales son válidas.
/// Lanza [AuthException] si las credenciales son incorrectas.
Future<User> login(String email, String password) async {
  // Validar formato de email
  if (!isValidEmail(email)) {
    throw AuthException('Email inválido');
  }
  // ... resto del código
}
```

#### Evitar
- Comentarios obvios que repiten el código
- Código comentado (eliminar o usar Git)

---

## 4. Estructura de Archivos

### 4.1 Organización por Feature

Cada feature debe seguir esta estructura:

```
feature_name/
├── data/
│   ├── datasources/
│   │   ├── feature_remote_datasource.dart
│   │   └── feature_local_datasource.dart
│   ├── models/
│   │   └── feature_model.dart
│   └── repositories/
│       └── feature_repository_impl.dart
│
├── domain/
│   ├── entities/
│   │   └── feature_entity.dart
│   ├── repositories/
│   │   └── feature_repository.dart
│   └── usecases/
│       ├── get_feature.dart
│       └── update_feature.dart
│
└── presentation/
    ├── providers/
    │   └── feature_provider.dart
    ├── screens/
    │   └── feature_screen.dart
    └── widgets/
        └── feature_widget.dart
```

### 4.2 Naming de Archivos

- **Data Sources**: `{feature}_remote_datasource.dart`, `{feature}_local_datasource.dart`
- **Models**: `{feature}_model.dart`
- **Repositories**: `{feature}_repository.dart` (interface), `{feature}_repository_impl.dart`
- **Entities**: `{feature}_entity.dart` o nombre específico (`user.dart`, `question.dart`)
- **Use Cases**: Verbo + sustantivo (`get_user.dart`, `submit_answer.dart`)
- **Providers**: `{feature}_provider.dart`
- **Screens**: `{feature}_screen.dart` o nombre descriptivo (`login_screen.dart`)
- **Widgets**: Nombre descriptivo (`user_card.dart`, `question_item.dart`)

---

## 5. Patrones de Diseño

### 5.1 Repository Pattern

- **Interface en Domain**, implementación en Data
- Un repositorio por agregado o entidad principal
- Métodos asíncronos retornan `Future<Either<Failure, T>>`

```dart
// Domain
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, void>> updateUser(User user);
}

// Data
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  
  // Implementación...
}
```

### 5.2 Use Case Pattern

- **Un caso de uso = una acción específica**
- Nombre descriptivo (verbo + sustantivo)
- Parámetros encapsulados en clase si son múltiples

```dart
class GetUser {
  final UserRepository repository;
  
  GetUser(this.repository);
  
  Future<Either<Failure, User>> call(String userId) async {
    return await repository.getUser(userId);
  }
}

// O con parámetros
class LoginUser {
  final AuthRepository repository;
  
  LoginUser(this.repository);
  
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;
  
  LoginParams({required this.email, required this.password});
}
```

### 5.3 Provider Pattern (State Management)

- **Un Provider por feature o funcionalidad relacionada**
- Mantener estado mínimo necesario
- Notificar cambios solo cuando sea necesario

```dart
class FeatureProvider extends ChangeNotifier {
  final GetFeatureData getFeatureData;
  
  bool _isLoading = false;
  FeatureData? _data;
  String? _error;
  
  bool get isLoading => _isLoading;
  FeatureData? get data => _data;
  String? get error => _error;
  
  FeatureProvider(this.getFeatureData);
  
  Future<void> loadData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    final result = await getFeatureData();
    
    result.fold(
      (failure) => _error = failure.message,
      (data) => _data = data,
    );
    
    _isLoading = false;
    notifyListeners();
  }
}
```

---

## 6. Manejo de Errores

### 6.1 Tipos de Errores

```dart
// Domain Layer
abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([String? message]) : super(message ?? 'Error del servidor');
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Sin conexión a internet');
}

class CacheFailure extends Failure {
  CacheFailure() : super('Error de almacenamiento local');
}

class ValidationFailure extends Failure {
  ValidationFailure(String message) : super(message);
}
```

### 6.2 Uso de Either

```dart
import 'package:dartz/dartz.dart';

Future<Either<Failure, User>> getUser() async {
  try {
    final user = await repository.getUser();
    return Right(user);
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } on NetworkException {
    return Left(NetworkFailure());
  } catch (e) {
    return Left(UnknownFailure());
  }
}
```

### 6.3 Manejo en UI

```dart
Consumer<FeatureProvider>(
  builder: (context, provider, child) {
    if (provider.isLoading) {
      return LoadingWidget();
    }
    
    if (provider.error != null) {
      return ErrorWidget(message: provider.error!);
    }
    
    if (provider.data != null) {
      return DataWidget(data: provider.data!);
    }
    
    return EmptyWidget();
  },
)
```

---

## 7. Testing

### 7.1 Estructura de Tests

```
test/
├── unit/
│   ├── domain/
│   │   └── usecases/
│   │       └── get_user_test.dart
│   ├── data/
│   │   └── repositories/
│   │       └── user_repository_impl_test.dart
│   └── presentation/
│       └── providers/
│           └── user_provider_test.dart
│
├── widget/
│   └── presentation/
│       └── widgets/
│           └── user_card_test.dart
│
└── integration/
    └── flows/
        └── login_flow_test.dart
```

### 7.2 Convenciones de Testing

- **Nombres descriptivos**: `test('should return user when id is valid')`
- **AAA Pattern**: Arrange, Act, Assert
- **Mocks**: Usar `mockito` para dependencias

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUser useCase;
  late MockUserRepository mockRepository;
  
  setUp(() {
    mockRepository = MockUserRepository();
    useCase = GetUser(mockRepository);
  });
  
  test('should return user from repository', () async {
    // Arrange
    final tUser = User(id: '1', name: 'Test');
    when(mockRepository.getUser('1')).thenAnswer((_) async => Right(tUser));
    
    // Act
    final result = await useCase('1');
    
    // Assert
    expect(result, Right(tUser));
    verify(mockRepository.getUser('1')).called(1);
  });
}
```

### 7.3 Ejecutar Tests

```bash
# Todos los tests
flutter test

# Tests específicos
flutter test test/unit/domain/usecases/get_user_test.dart

# Con cobertura
flutter test --coverage
```

---

## 8. Git Workflow

### 8.1 Branches

- **main**: Código en producción/estable
- **develop**: Código en desarrollo
- **feature/feature-name**: Nueva funcionalidad
- **bugfix/bug-name**: Corrección de bugs
- **hotfix/hotfix-name**: Corrección urgente

### 8.2 Commits

#### Formato
```
tipo(scope): descripción breve

Descripción detallada (opcional)

- Bullet point 1
- Bullet point 2
```

#### Tipos
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Documentación
- `style`: Formato, espaciado
- `refactor`: Refactorización
- `test`: Tests
- `chore`: Tareas de mantenimiento

#### Ejemplos
```
feat(auth): agregar funcionalidad de login

Implementa autenticación con email y contraseña.
Incluye validación de campos y manejo de errores.

- Agrega AuthProvider
- Agrega LoginScreen
- Implementa AuthRepository

fix(dashboard): corregir cálculo de XP

Corrige bug donde el XP no se actualizaba correctamente
después de completar una práctica.
```

### 8.3 Pull Requests

- **Título claro y descriptivo**
- **Descripción** que explique qué y por qué
- **Revisión de código** antes de merge
- **Tests pasando** antes de merge

---

## 9. Performance

### 9.1 Mejores Prácticas

#### Widgets
- Usar `const` constructors cuando sea posible
- Evitar reconstrucciones innecesarias
- Usar `ListView.builder` para listas largas
- Lazy loading de imágenes

```dart
// ✅ Bueno
const Text('Hola');

// ❌ Malo
Text('Hola');

// ✅ Bueno
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemWidget(items[index]),
);

// ❌ Malo
Column(
  children: items.map((item) => ItemWidget(item)).toList(),
);
```

#### Estado
- Notificar solo cuando cambie el estado relevante
- Evitar notificaciones excesivas

```dart
// ✅ Bueno
void updateName(String newName) {
  if (_name != newName) {
    _name = newName;
    notifyListeners();
  }
}

// ❌ Malo
void updateName(String newName) {
  _name = newName;
  notifyListeners(); // Siempre notifica, incluso si no cambió
}
```

### 9.2 Optimización de Imágenes

- Usar formatos optimizados (WebP cuando sea posible)
- Tamaños apropiados para diferentes densidades
- Lazy loading

---

## 10. Seguridad

### 10.1 Manejo de Credenciales

- **Nunca** hardcodear credenciales en el código
- Usar variables de entorno o archivos de configuración (no versionados)
- Almacenar tokens de forma segura (flutter_secure_storage)

```dart
// ✅ Usar secure storage
final storage = FlutterSecureStorage();
await storage.write(key: 'token', value: token);

// ❌ Nunca usar SharedPreferences para tokens sensibles
// await prefs.setString('token', token); // No seguro
```

### 10.2 Validación de Inputs

- Validar inputs del usuario en frontend
- Validar también en backend (nunca confiar solo en frontend)
- Sanitizar datos antes de enviar

```dart
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email es requerido';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Email inválido';
  }
  return null;
}
```

### 10.3 HTTPS

- **Siempre** usar HTTPS para comunicación con API
- Validar certificados SSL

---

## 11. Accesibilidad

### 11.1 Semántica

- Usar `Semantics` widget cuando sea necesario
- Agregar labels descriptivos

```dart
ElevatedButton(
  onPressed: () {},
  child: Text('Guardar'),
  // Agregar semántica para lectores de pantalla
  // Flutter lo hace automáticamente en muchos casos
)
```

### 11.2 Contraste

- Seguir Design System para contraste adecuado
- Probar con herramientas de accesibilidad

### 11.3 Tamaños Táctiles

- Mínimo 44x44px para elementos interactivos
- Espaciado adecuado entre botones

---

## 12. Documentación

### 12.1 Comentarios en Código

- Documentar funciones públicas complejas
- Explicar "por qué", no "qué" (el código explica el qué)

### 12.2 README por Feature

- Si un feature es complejo, agregar README.md dentro de la carpeta del feature
- Documentar decisiones arquitectónicas importantes

---

## 13. Herramientas de Calidad

### 13.1 Linter

- Usar `flutter_lints` configurado en `analysis_options.yaml`
- Ejecutar regularmente: `flutter analyze`

### 13.2 Formatter

- Ejecutar antes de commit: `dart format .`
- Configurar formatter automático en IDE

### 13.3 CI/CD (Futuro)

- Ejecutar tests automáticamente
- Validar formato de código
- Análisis estático

---

## 14. Checklist de Desarrollo

Antes de hacer commit, verificar:

- [ ] Código formateado (`dart format .`)
- [ ] Sin errores de análisis (`flutter analyze`)
- [ ] Tests pasando (`flutter test`)
- [ ] Sin imports no usados
- [ ] Documentación actualizada si es necesario
- [ ] Commits con mensajes descriptivos
- [ ] Código sigue convenciones del proyecto

---

## 15. Recursos y Referencias

### 15.1 Documentación Oficial

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

### 15.2 Arquitectura

- [Clean Architecture - Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Reso Coder - Flutter Clean Architecture](https://resocoder.com/flutter-clean-architecture-tdd/)

### 15.3 Mejores Prácticas

- [Flutter Best Practices](https://flutter.dev/docs/development/ui/best-practices)

---

**Versión**: 1.0.0  
**Última actualización**: 2024  
**Autor**: Equipo de Desarrollo IntegralClass Go

