# Estructura del Proyecto IntegralClass Go

Esta carpeta contiene todo el código fuente de la aplicación Flutter organizado según **Clean Architecture** con enfoque por **features**.

## Estructura General

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── core/                        # Funcionalidades transversales
│   ├── constants/              # Constantes globales
│   ├── errors/                 # Manejo de errores (Failures y Exceptions)
│   ├── injection/              # Inyección de dependencias (get_it)
│   ├── network/                # Configuración de red (API client)
│   ├── theme/                  # Tema y estilos (Design System)
│   ├── utils/                  # Utilidades generales
│   └── widgets/                # Widgets reutilizables
│
├── features/                    # Módulos funcionales
│   ├── auth/                   # Autenticación y Perfil
│   ├── dashboard/              # Dashboard Principal
│   ├── practice/               # Práctica por Temas
│   ├── daily_evaluation/       # Evaluaciones Diarias
│   ├── mock_exam/              # Simulacros Virtuales
│   ├── gamification/           # Gamificación y Progreso
│   ├── versus/                 # Versus (Retos)
│   ├── ranking/                # Ranking
│   ├── forum/                  # Comunidad Académica (Foro)
│   ├── notifications/          # Notificaciones y Dato del Día
│   └── settings/               # Configuración y Privacidad
│
└── routes/                      # Configuración de navegación
```

## Organización por Feature

Cada feature sigue la misma estructura con tres capas:

### Domain Layer (Lógica de Negocio)
- `entities/`: Entidades puras de negocio
- `repositories/`: Interfaces de repositorios (contratos)
- `usecases/`: Casos de uso (acciones específicas)

### Data Layer (Acceso a Datos)
- `datasources/`: Fuentes de datos (remote y local)
- `models/`: Modelos de datos (DTOs) con fromJson/toJson
- `repositories/`: Implementaciones de repositorios

### Presentation Layer (UI)
- `providers/`: State management (Provider pattern)
- `screens/`: Pantallas completas
- `widgets/`: Widgets específicos del feature

## Convenciones

- **Archivos**: snake_case (ej: `auth_repository.dart`)
- **Clases**: PascalCase (ej: `AuthRepository`)
- **Features**: snake_case (ej: `daily_evaluation`)
- **Un archivo = una clase** (principio general)

## Estado del Proyecto

Esta es la **estructura base inicial**. Los archivos están creados con comentarios y placeholders. El desarrollo de cada feature se realizará siguiendo esta arquitectura.

Para más detalles, consulta:
- `docs/ARCHITECTURE.md` - Arquitectura completa del proyecto
- `docs/DEVELOPMENT_GUIDELINES.md` - Guías de desarrollo

