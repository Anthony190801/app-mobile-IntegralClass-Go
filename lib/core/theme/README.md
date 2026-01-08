# Design System - IntegralClass Go

Este directorio contiene la implementación completa del Design System de la aplicación IntegralClass Go.

## Archivos

- **app_colors.dart**: Paleta completa de colores corporativos
- **app_text_styles.dart**: Estilos tipográficos según el Design System
- **app_spacing.dart**: Sistema de espaciado basado en 8px
- **app_theme.dart**: Configuración completa del ThemeData de Flutter
- **theme.dart**: Exportación centralizada

## Uso

### Importar el tema completo

```dart
import 'package:app_flutter_tesis/core/theme/theme.dart';
```

### Usar colores

```dart
Container(
  color: AppColors.primaryBlue,
  child: Text(
    'Texto',
    style: TextStyle(color: AppColors.textPrimary),
  ),
)
```

### Usar estilos de texto

```dart
Text(
  'Título',
  style: AppTextStyles.headlineLarge,
)

Text(
  'Cuerpo de texto',
  style: AppTextStyles.bodyMedium,
)
```

### Usar espaciado

```dart
Padding(
  padding: const EdgeInsets.all(AppSpacing.md),
  child: Widget(),
)
```

### Usar el tema en MaterialApp

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  // ...
)
```

## Componentes disponibles

Los widgets reutilizables están en `core/widgets/`:
- `AppButton` - Botones personalizados
- `AppCard` - Cards según Design System
- `AppProgressBar` - Barras de progreso

Ver `../widgets/README.md` para más detalles sobre los widgets.

