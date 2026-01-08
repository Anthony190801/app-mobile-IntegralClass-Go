# Sistema de Diseño - IntegralClass Go

Este documento define el sistema de diseño visual de la aplicación IntegralClass Go, estableciendo estándares de colores, tipografía, espaciado, componentes y principios de diseño.

---

## 1. Filosofía de Diseño

### 1.1 Principios Fundamentales

1. **Claridad y Legibilidad**: Priorizar la legibilidad para sesiones prolongadas de estudio.
2. **Modernidad**: Interfaz contemporánea que resuene con usuarios jóvenes.
3. **Minimalismo**: Diseño limpio sin elementos innecesarios que distraigan del contenido.
4. **Educativo**: Estética que transmita profesionalismo y enfoque académico.
5. **Motivacional**: Elementos visuales que inspiren y motiven el estudio continuo.

### 1.2 Objetivos de Usuario

- Reducir la fatiga visual en sesiones largas
- Facilitar la comprensión rápida de información
- Crear una experiencia positiva y motivadora
- Mantener la atención en el contenido académico

---

## 2. Paleta de Colores

### 2.1 Colores Corporativos

#### Azul Principal
- **Hex**: `#334A8F`
- **RGB**: `51, 74, 143`
- **Uso**: Color primario, botones principales, acentos importantes, headers
- **Aplicación**: Navegación principal, CTAs, elementos destacados

#### Azul Secundario
- **Hex**: `#3C478C`
- **RGB**: `60, 71, 140`
- **Uso**: Variación del azul principal, elementos secundarios, fondos sutiles
- **Aplicación**: Cards, secciones secundarias, estados hover

#### Verde Acento
- **Hex**: `#06A45B`
- **RGB**: `6, 164, 91`
- **Uso**: Éxito, respuestas correctas, logros, validaciones positivas
- **Aplicación**: Feedback positivo, badges de logro, indicadores de éxito

### 2.2 Colores Extendidos

#### Colores de Estado

**Éxito (Success)**
- Primary: `#06A45B` (Verde acento)
- Light: `#4CD494`
- Dark: `#048A4A`

**Error (Error)**
- Primary: `#E53935`
- Light: `#FF6B6B`
- Dark: `#C62828`

**Advertencia (Warning)**
- Primary: `#FFB300`
- Light: `#FFD54F`
- Dark: `#F57C00`

**Información (Info)**
- Primary: `#2196F3`
- Light: `#64B5F6`
- Dark: `#1976D2`

#### Escala de Grises

**Fondos y Superficies**
- Background Primary: `#FFFFFF`
- Background Secondary: `#F5F7FA`
- Background Tertiary: `#EDF0F4`
- Surface: `#FFFFFF`
- Surface Elevated: `#FFFFFF` (con sombra)

**Texto**
- Text Primary: `#1A1A1A`
- Text Secondary: `#6B7280`
- Text Tertiary: `#9CA3AF`
- Text Disabled: `#D1D5DB`
- Text Inverse: `#FFFFFF`

**Bordes y Divisores**
- Border Light: `#E5E7EB`
- Border Medium: `#D1D5DB`
- Border Dark: `#9CA3AF`

### 2.3 Colores de Gamificación

**XP y Progreso**
- XP Bar: `#06A45B` (verde acento)
- Level Badge: `#334A8F` (azul principal)

**Rachas y Logros**
- Streak Active: `#FFB300` (amarillo)
- Streak Inactive: `#D1D5DB` (gris)
- Achievement Unlocked: `#FFD700` (dorado)
- Achievement Locked: `#9CA3AF` (gris)

**Rankings**
- Top 1: `#FFD700` (dorado)
- Top 3: `#C0C0C0` (plata)
- Top 10: `#CD7F32` (bronce)

### 2.4 Colores de Preguntas y Respuestas

**Respuestas**
- Correcta: `#06A45B` (verde)
- Incorrecta: `#E53935` (rojo)
- Marcada: `#FFB300` (amarillo)
- Sin responder: `#E5E7EB` (gris claro)

**Estados de Pregunta**
- Actual: `#334A8F` (azul principal, borde destacado)
- Respondida: `#D1F2EB` (verde muy claro)
- Por revisar: `#FFF3CD` (amarillo muy claro)
- Sin responder: Transparente

---

## 3. Tipografía

### 3.1 Familia de Fuentes

**Fuente Principal**: Roboto (Material Design)
- **Alternativa**: System Default (San Francisco en iOS, Roboto en Android)
- **Razón**: Excelente legibilidad, amplia compatibilidad, profesional

### 3.2 Escala Tipográfica

#### Display (Títulos Grandes)
- **Display Large**: 57px / 64px line height / Bold
- **Display Medium**: 45px / 52px line height / Bold
- **Display Small**: 36px / 44px line height / Bold

#### Headline (Títulos)
- **Headline Large**: 32px / 40px line height / Bold
- **Headline Medium**: 28px / 36px line height / SemiBold
- **Headline Small**: 24px / 32px line height / SemiBold

#### Title (Subtítulos)
- **Title Large**: 22px / 28px line height / Medium
- **Title Medium**: 16px / 24px line height / Medium
- **Title Small**: 14px / 20px line height / Medium

#### Body (Texto Principal)
- **Body Large**: 16px / 24px line height / Regular
- **Body Medium**: 14px / 20px line height / Regular
- **Body Small**: 12px / 16px line height / Regular

#### Label (Etiquetas)
- **Label Large**: 14px / 20px line height / Medium
- **Label Medium**: 12px / 16px line height / Medium
- **Label Small**: 11px / 16px line height / Medium

### 3.3 Uso de Tipografía

- **Títulos de pantalla**: Headline Medium o Large
- **Títulos de sección**: Title Large o Medium
- **Texto de contenido**: Body Medium o Large
- **Etiquetas y captions**: Label Medium o Small
- **Números y estadísticas**: Font con números tabulares para alineación

### 3.4 Legibilidad

- **Contraste mínimo**: 4.5:1 para texto normal, 3:1 para texto grande
- **Espaciado entre líneas**: Mínimo 1.5x el tamaño de fuente
- **Longitud de línea**: Máximo 75 caracteres para bloques de texto

---

## 4. Espaciado y Layout

### 4.1 Sistema de Espaciado

Base: **8px** (unidad fundamental)

- **xs**: 4px (0.5x)
- **sm**: 8px (1x)
- **md**: 16px (2x)
- **lg**: 24px (3x)
- **xl**: 32px (4x)
- **2xl**: 48px (6x)
- **3xl**: 64px (8x)

### 4.2 Grid System

- **Padding de pantalla**: 16px (md) en móviles, 24px (lg) en tablets
- **Espaciado entre secciones**: 24px (lg) o 32px (xl)
- **Espaciado entre elementos relacionados**: 8px (sm) o 16px (md)
- **Espaciado entre elementos no relacionados**: 16px (md) o 24px (lg)

### 4.3 Breakpoints (Para tablets/landscape)

- **Mobile**: < 600px
- **Tablet**: 600px - 960px
- **Desktop** (si aplica): > 960px

### 4.4 Bordes y Radio

- **Radio pequeño**: 4px (para badges, chips pequeños)
- **Radio medio**: 8px (para botones, cards pequeñas)
- **Radio grande**: 12px (para cards grandes, modals)
- **Radio completo**: 999px (para pills, avatares circulares)

---

## 5. Componentes de UI

### 5.1 Botones

#### Botón Primario
- **Background**: Azul principal (`#334A8F`)
- **Texto**: Blanco
- **Padding**: 12px vertical, 24px horizontal
- **Radio**: 8px
- **Altura mínima**: 48px
- **Estados**: Normal, Hover (elevación), Pressed (más oscuro), Disabled (opacidad 0.5)

#### Botón Secundario
- **Background**: Transparente
- **Borde**: 1px sólido azul principal
- **Texto**: Azul principal
- **Padding**: 12px vertical, 24px horizontal
- **Radio**: 8px

#### Botón de Texto
- **Background**: Transparente
- **Texto**: Azul principal
- **Padding**: 8px vertical, 16px horizontal

#### Botón de Éxito
- **Background**: Verde acento (`#06A45B`)
- **Texto**: Blanco
- Usar para acciones de confirmación, completar

### 5.2 Cards

#### Card Estándar
- **Background**: Blanco
- **Padding**: 16px
- **Radio**: 12px
- **Sombra**: Elevación suave (elevation 2)
- **Borde**: Opcional, `#E5E7EB` si se requiere

#### Card Elevada (Interactiva)
- **Elevación**: Mayor (elevation 4)
- **Efecto hover**: Aumento de elevación
- Uso: Cards clickeables, elementos interactivos

### 5.3 Inputs y Formularios

#### Text Field
- **Borde**: 1px sólido `#D1D5DB`
- **Radio**: 8px
- **Padding**: 12px horizontal, 14px vertical
- **Altura**: 48px
- **Estado Focus**: Borde azul principal, 2px
- **Estado Error**: Borde rojo, mensaje de error debajo
- **Label**: Encima del campo, 14px, color texto secundario
- **Placeholder**: Color texto terciario

#### Checkbox
- **Tamaño**: 24x24px
- **Checked**: Azul principal con checkmark blanco
- **Unchecked**: Borde gris, fondo transparente

#### Radio Button
- **Tamaño**: 24x24px
- **Checked**: Azul principal con punto blanco
- **Unchecked**: Borde gris, fondo transparente

### 5.4 Navegación

#### Bottom Navigation Bar
- **Background**: Blanco
- **Altura**: 56px + safe area
- **Ícono**: 24x24px, color gris cuando inactivo, azul principal cuando activo
- **Texto**: Label Small debajo del ícono

#### App Bar
- **Background**: Azul principal o blanco según contexto
- **Altura**: 56px + safe area
- **Título**: Headline Small, color según background
- **Íconos**: 24x24px

#### Drawer (Menú lateral)
- **Background**: Blanco
- **Ancho**: 280px
- **Header**: Foto de perfil, nombre, nivel
- **Items**: Padding 16px, altura 48px

### 5.5 Feedback Visual

#### Snackbar (Notificaciones temporales)
- **Background**: Gris oscuro (`#1A1A1A`) con opacidad 0.9
- **Texto**: Blanco
- **Padding**: 16px
- **Radio**: 4px
- **Duración**: 3-4 segundos

#### Toast de Éxito
- **Background**: Verde acento
- **Ícono**: Checkmark blanco

#### Toast de Error
- **Background**: Rojo (`#E53935`)
- **Ícono**: X o alerta blanca

#### Loading Indicators
- **Circular**: Azul principal
- **Linear**: Azul principal, en top de pantalla o en botones

### 5.6 Badges y Chips

#### Badge (Notificaciones)
- **Background**: Rojo (`#E53935`)
- **Tamaño**: 20x20px
- **Texto**: Blanco, 12px, bold
- **Posición**: Top-right del ícono

#### Chip (Etiquetas)
- **Background**: `#EDF0F4`
- **Texto**: Texto secundario
- **Padding**: 6px horizontal, 4px vertical
- **Radio**: 16px (pill shape)

#### Badge de Logro
- **Background**: Dorado cuando desbloqueado, gris cuando bloqueado
- **Tamaño**: 48x48px
- **Ícono**: Centrado

### 5.7 Barras de Progreso

#### Progress Bar (XP, Nivel)
- **Background**: `#EDF0F4`
- **Fill**: Verde acento (`#06A45B`)
- **Altura**: 8px (estándar), 12px (prominente)
- **Radio**: 4px (pill shape)
- **Animación**: Transición suave al actualizar

#### Linear Progress (Carga)
- **Background**: `#EDF0F4`
- **Fill**: Azul principal
- **Animación**: Indeterminada con animación

---

## 6. Iconografía

### 6.1 Biblioteca de Íconos

- **Fuente principal**: Material Icons
- **Tamaño estándar**: 24x24px
- **Tamaño pequeño**: 20x20px
- **Tamaño grande**: 32x32px
- **Color**: Sigue esquema de colores del sistema

### 6.2 Uso de Íconos

- **Íconos de navegación**: 24px, color según estado (activo/inactivo)
- **Íconos de acción**: 24px, color azul principal o gris según importancia
- **Íconos decorativos**: 32px o más, color según contexto
- **Íconos de estado**: 20px, color según significado (verde/rojo/amarillo)

---

## 7. Animaciones y Transiciones

### 7.1 Principios

- **Duración**: Corta (200-300ms) para interacciones, media (300-500ms) para transiciones
- **Curva**: Ease-in-out para la mayoría, ease-out para entradas, ease-in para salidas
- **Propósito**: Guiar la atención, proporcionar feedback, mejorar UX sin distraer

### 7.2 Animaciones Comunes

#### Transición de Pantallas
- **Duración**: 300ms
- **Curva**: Ease-in-out
- **Efecto**: Slide horizontal o fade

#### Hover/Touch Feedback
- **Duración**: 150ms
- **Efecto**: Cambio de elevación o escala (1.0 → 1.02)

#### Loading
- **Duración**: Variable
- **Efecto**: Rotación continua o pulse

#### Subir de Nivel / Logro Desbloqueado
- **Duración**: 500-800ms
- **Efecto**: Escala + fade, con confetti (opcional)

### 7.3 Micro-interacciones

- **Botones**: Elevación al presionar
- **Cards**: Sutil elevación al hover/touch
- **Inputs**: Animación de label al focus
- **Switches/Toggles**: Animación suave de transición

---

## 8. Imágenes y Assets

### 8.1 Imágenes de Perfil

- **Tamaño**: 64x64px (lista), 96x96px (detalle), 128x128px (perfil completo)
- **Formato**: Circular con borde blanco de 2px
- **Placeholder**: Avatar con iniciales, color azul principal

### 8.2 Ilustraciones

- **Estilo**: Moderno, educativo, amigable
- **Formato**: SVG preferido, PNG para imágenes complejas
- **Uso**: Empty states, onboarding, ilustraciones decorativas

### 8.3 Logos y Marcas

- **Logo principal**: Usar colores corporativos
- **Tamaños**: Múltiples tamaños para diferentes contextos
- **Fondo**: Versiones para fondo claro y oscuro

---

## 9. Accesibilidad

### 9.1 Contraste

- Cumplir con WCAG 2.1 nivel AA mínimo
- Texto normal: Contraste 4.5:1
- Texto grande: Contraste 3:1

### 9.2 Tamaños Táctiles

- **Área mínima**: 44x44px para elementos interactivos
- **Espaciado**: Mínimo 8px entre elementos clickeables

### 9.3 Lectores de Pantalla

- Etiquetas descriptivas para todos los elementos interactivos
- Orden lógico de navegación
- Estados anunciados (loading, error, éxito)

### 9.4 Modo Oscuro (Opcional, Futuro)

- Si se implementa, mantener contraste adecuado
- Adaptar colores corporativos a versión oscura
- Preferencia del usuario guardada

---

## 10. Guías de Implementación en Flutter

### 10.1 Archivos de Configuración

```dart
// lib/core/theme/app_colors.dart
// lib/core/theme/app_text_styles.dart
// lib/core/theme/app_spacing.dart
// lib/core/theme/app_theme.dart
```

### 10.2 Uso de Tema

- Usar `ThemeData` de Flutter
- Extender con custom colors y text styles
- Acceder mediante `Theme.of(context)`

### 10.3 Componentes Reutilizables

- Crear widgets reutilizables para botones, cards, inputs
- Mantener consistencia en toda la app
- Documentar props y uso

---

## 11. Ejemplos Visuales

### 11.1 Pantalla de Dashboard

- Header con nivel y XP prominente
- Cards con sombras sutiles
- Colores de gamificación destacados
- Espaciado generoso entre secciones

### 11.2 Pantalla de Preguntas

- Pregunta con tipografía clara y legible
- Opciones de respuesta con suficiente espaciado
- Feedback visual inmediato (verde/rojo)
- Botones de navegación claros

### 11.3 Pantalla de Ranking

- Top 3 con colores especiales (dorado, plata, bronce)
- Lista clara con información relevante
- Posición del usuario destacada
- Filtros y búsqueda accesibles

---

## 12. Recursos y Referencias

- Material Design Guidelines: https://material.io/design
- Flutter Material Components: https://flutter.dev/docs/development/ui/widgets/material
- WCAG 2.1: https://www.w3.org/WAI/WCAG21/quickref/

---

**Versión**: 1.0.0  
**Última actualización**: 2024  
**Autor**: Equipo de Diseño IntegralClass Go

