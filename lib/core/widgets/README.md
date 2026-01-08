# Widgets Reutilizables - IntegralClass Go

Este directorio contiene widgets reutilizables que siguen el Design System de la aplicación.

## Widgets Disponibles

### AppButton

Botón personalizado con diferentes variantes según el Design System.

```dart
// Botón primario
AppButton(
  text: 'Guardar',
  onPressed: () {},
  type: AppButtonType.primary,
)

// Botón secundario (outlined)
AppButton(
  text: 'Cancelar',
  onPressed: () {},
  type: AppButtonType.secondary,
)

// Botón de texto
AppButton(
  text: 'Más información',
  onPressed: () {},
  type: AppButtonType.text,
)

// Botón de éxito
AppButton(
  text: 'Completar',
  onPressed: () {},
  type: AppButtonType.success,
)

// Botón con icono y loading
AppButton(
  text: 'Iniciar sesión',
  onPressed: () {},
  icon: Icons.login,
  isLoading: true,
  isFullWidth: true,
)
```

### AppCard

Card personalizado con variantes estándar y elevada.

```dart
// Card estándar
AppCard.standard(
  child: Text('Contenido'),
)

// Card elevada (interactiva)
AppCard.elevated(
  onTap: () {},
  child: Text('Contenido clickeable'),
)

// Card personalizada
AppCard(
  child: Text('Contenido'),
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(horizontal: 16),
  isElevated: true,
)
```

### AppProgressBar

Barra de progreso personalizada para XP, niveles, etc.

```dart
// Barra de progreso estándar
AppProgressBar.standard(
  progress: 0.65, // 0.0 a 1.0
  label: 'Progreso',
  showPercentage: true,
)

// Barra de progreso para XP
AppProgressBar.xp(
  progress: 0.75,
  label: 'XP hasta próximo nivel',
)

// Barra personalizada
AppProgressBar(
  progress: 0.5,
  height: 12,
  backgroundColor: Colors.grey[200],
  progressColor: Colors.blue,
)
```

## Importar

```dart
import 'package:app_flutter_tesis/core/widgets/widgets.dart';
```

O importar individualmente:

```dart
import 'package:app_flutter_tesis/core/widgets/app_button.dart';
```

