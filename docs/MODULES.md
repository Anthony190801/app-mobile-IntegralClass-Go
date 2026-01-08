# Módulos Funcionales - INTEGRALCLASS GO

Este documento describe en detalle los 11 módulos funcionales que componen la aplicación móvil INTEGRALCLASS GO.

---

## Índice de Módulos

1. [Autenticación y Perfil](#1-autenticación-y-perfil)
2. [Dashboard Principal](#2-dashboard-principal)
3. [Práctica por Temas](#3-práctica-por-temas)
4. [Evaluaciones Diarias](#4-evaluaciones-diarias)
5. [Simulacros Virtuales](#5-simulacros-virtuales)
6. [Gamificación y Progreso](#6-gamificación-y-progreso)
7. [Versus (Retos)](#7-versus-retos)
8. [Ranking](#8-ranking)
9. [Comunidad Académica (Foro)](#9-comunidad-académica-foro)
10. [Notificaciones y Dato del Día](#10-notificaciones-y-dato-del-día)
11. [Configuración y Privacidad](#11-configuración-y-privacidad)

---

## 1. Autenticación y Perfil

### 1.1 Descripción General

Este módulo gestiona la identidad del usuario, permitiendo el acceso seguro a la aplicación y la personalización de su perfil académico.

### 1.2 Funcionalidades Principales

#### 1.2.1 Login
- **Autenticación con email/username y contraseña**
- Validación de campos en tiempo real
- Recordar sesión (opcional)
- Integración con JWT para tokens de autenticación
- Manejo de errores (credenciales incorrectas, cuenta bloqueada, etc.)

#### 1.2.2 Registro
- Formulario de registro con validaciones
- Campos: nombres, apellidos, email, username, contraseña, confirmación de contraseña
- Aceptación de términos y condiciones
- Verificación de email (opcional)
- Mensajes de validación claros

#### 1.2.3 Recuperación de Contraseña
- Solicitud de recuperación mediante email
- Flujo: Email → Código de verificación → Nueva contraseña
- Validación de códigos con expiración temporal
- Confirmación de cambio exitoso

#### 1.2.4 Visualización de Perfil
- Información personal: nombres, apellidos, foto de perfil, email, username
- Información académica: nivel actual, XP total, racha de días, fecha de registro
- Estadísticas resumidas: total de preguntas respondidas, porcentaje de aciertos
- Logros destacados (badges)

#### 1.2.5 Edición de Perfil
- Modificación de información personal (nombres, apellidos)
- Cambio de foto de perfil (selección de imagen, recorte)
- Cambio de email (con verificación)
- Cambio de contraseña (requiere contraseña actual)
- Guardado de cambios con confirmación

### 1.3 Casos de Uso

- **CU-AUT-001**: Usuario inicia sesión con credenciales válidas
- **CU-AUT-002**: Usuario recupera su contraseña olvidada
- **CU-AUT-003**: Usuario visualiza su perfil completo
- **CU-AUT-004**: Usuario edita información de su perfil
- **CU-AUT-005**: Usuario cambia su contraseña desde el perfil

### 1.4 Diseño de Pantallas

- Login Screen
- Register Screen
- Forgot Password Screen
- Profile View Screen
- Profile Edit Screen
- Change Password Screen

---

## 2. Dashboard Principal

### 2.1 Descripción General

El dashboard es la pantalla principal de la aplicación, proporcionando un resumen visual del progreso del estudiante y acceso rápido a las funcionalidades principales.

### 2.2 Funcionalidades Principales

#### 2.2.1 Resumen de Progreso
- **Tarjeta de Nivel**: Nivel actual, XP actual, XP necesario para siguiente nivel, barra de progreso
- **Estadísticas del Día**: Preguntas respondidas hoy, XP ganado hoy, tiempo de estudio
- **Racha de Estudio**: Días consecutivos de estudio activo
- **Logros Recientes**: Últimos badges o logros desbloqueados

#### 2.2.2 Accesos Rápidos
- Botones de acceso directo a:
  - Práctica por Temas
  - Evaluación Diaria
  - Simulacros
  - Versus
  - Foro
  - Ranking

#### 2.2.3 Actividad Reciente
- Últimas prácticas realizadas
- Resultados recientes de evaluaciones
- Participaciones en Versus
- Publicaciones en el foro

#### 2.2.4 Métricas Visuales
- Gráficos de progreso semanal/mensual
- Distribución de aciertos por curso
- Tendencias de rendimiento

#### 2.2.5 Notificaciones y Alertas
- Evaluación diaria disponible
- Nuevos logros desbloqueados
- Retos pendientes
- Mensajes de la comunidad

### 2.3 Casos de Uso

- **CU-DASH-001**: Usuario visualiza su resumen de progreso al abrir la app
- **CU-DASH-002**: Usuario accede rápidamente a un módulo desde el dashboard
- **CU-DASH-003**: Usuario revisa su actividad reciente
- **CU-DASH-004**: Usuario visualiza gráficos de su progreso

### 2.4 Diseño de Pantallas

- Main Dashboard Screen
- Progress Details Screen (modal o pantalla completa)

---

## 3. Práctica por Temas

### 3.1 Descripción General

Permite a los estudiantes practicar preguntas organizadas por curso académico, tema específico y nivel de dificultad, con retroalimentación inmediata.

### 3.2 Funcionalidades Principales

#### 3.2.1 Selección de Parámetros
- **Curso**: Matemática, Física, Química, Razonamiento Verbal, Razonamiento Matemático, etc.
- **Tema**: Subcategorías dentro del curso seleccionado
- **Dificultad**: Fácil, Medio, Difícil
- **Cantidad de preguntas**: Opciones predefinidas (5, 10, 15, 20)

#### 3.2.2 Resolución de Preguntas
- Interfaz clara con pregunta y opciones de respuesta
- Navegación entre preguntas (anterior/siguiente)
- Indicador de progreso (pregunta X de Y)
- Opción para marcar pregunta y revisar después
- Contador de tiempo (opcional, no limitante)

#### 3.2.3 Retroalimentación Inmediata
- Al seleccionar respuesta: indicación visual de correcto/incorrecto
- Explicación breve de la respuesta correcta
- Opción para ver explicación detallada
- Registro de aciertos y errores

#### 3.2.4 Resultados de Práctica
- Resumen al finalizar: total de aciertos, errores, porcentaje
- Desglose por pregunta con respuestas correctas/incorrectas
- XP ganado según desempeño
- Tiempo total de la práctica
- Opción para revisar preguntas incorrectas

#### 3.2.5 Historial de Prácticas
- Lista de prácticas realizadas con fecha y resultado
- Filtros por curso, tema, fecha
- Estadísticas acumuladas por tema

### 3.3 Casos de Uso

- **CU-PRAC-001**: Usuario selecciona curso, tema y dificultad para practicar
- **CU-PRAC-002**: Usuario resuelve preguntas y recibe retroalimentación inmediata
- **CU-PRAC-003**: Usuario revisa resultados al finalizar la práctica
- **CU-PRAC-004**: Usuario consulta historial de prácticas anteriores

### 3.4 Diseño de Pantallas

- Practice Selection Screen
- Question Solving Screen
- Question Feedback Screen (modal)
- Practice Results Screen
- Practice History Screen

---

## 4. Evaluaciones Diarias

### 4.1 Descripción General

Sistema de mini evaluaciones diarias con tiempo limitado, diseñadas para mantener la práctica constante del estudiante.

### 4.2 Funcionalidades Principales

#### 4.2.1 Disponibilidad Diaria
- Una evaluación disponible por día
- Reset diario (generalmente a medianoche)
- Notificación cuando la evaluación está disponible
- Indicador visual de disponibilidad

#### 4.2.2 Configuración de Evaluación
- Número de preguntas fijas (ej: 10 preguntas)
- Tiempo límite total (ej: 15 minutos)
- Preguntas de diferentes cursos (mixtas)
- Dificultad variada

#### 4.2.3 Interfaz de Evaluación
- Cronómetro visible y prominente
- Advertencia cuando queda poco tiempo
- No se puede cambiar respuesta una vez seleccionada (o con penalización)
- Bloqueo automático al finalizar tiempo
- Progreso visual (barra o indicador)

#### 4.2.4 Resultados Inmediatos
- Calificación inmediata al finalizar
- Desglose de respuestas correctas/incorrectas
- Comparación con días anteriores
- XP bonus por completar evaluación diaria
- Bonificación por racha de días consecutivos

#### 4.2.5 Historial de Evaluaciones Diarias
- Calendario con resultados de días anteriores
- Gráfico de tendencia de desempeño
- Estadísticas de asistencia (días completados)

### 4.3 Casos de Uso

- **CU-EVAL-001**: Usuario inicia la evaluación diaria disponible
- **CU-EVAL-002**: Usuario completa evaluación dentro del tiempo límite
- **CU-EVAL-003**: Usuario visualiza resultados inmediatos
- **CU-EVAL-004**: Usuario revisa su historial de evaluaciones diarias

### 4.4 Diseño de Pantallas

- Daily Evaluation Screen
- Evaluation Timer Screen
- Daily Results Screen
- Daily History Screen

---

## 5. Simulacros Virtuales

### 5.1 Descripción General

Exámenes completos que simulan los exámenes de admisión universitarios, con estructura, tiempo y formato similares a los exámenes reales.

### 5.2 Funcionalidades Principales

#### 5.2.1 Tipos de Simulacros
- Simulacros completos (todas las áreas)
- Simulacros por área específica
- Simulacros cronometrados (tiempo real)
- Simulacros de práctica (sin límite de tiempo)

#### 5.2.2 Estructura del Simulacro
- Número total de preguntas (ej: 100 preguntas)
- Tiempo límite realista (ej: 3 horas)
- Organización por secciones/áreas
- Preguntas de diferentes niveles de dificultad

#### 5.2.3 Interfaz del Simulacro
- Cronómetro principal visible
- Navegación entre secciones
- Lista de preguntas con estado (respondida, marcada, sin responder)
- Opción para marcar preguntas para revisión
- Guardado automático de respuestas
- Advertencias de tiempo (30 min, 15 min, 5 min restantes)

#### 5.2.4 Finalización y Resultados
- Resumen automático al finalizar tiempo
- Confirmación antes de entregar
- Resultado detallado con:
  - Puntaje total
  - Puntaje por área/curso
  - Posición en ranking del simulacro
  - Comparación con intentos anteriores
  - Análisis de fortalezas y debilidades

#### 5.2.5 Historial de Simulacros
- Lista de simulacros realizados
- Mejor puntaje logrado
- Progreso a lo largo del tiempo
- Estadísticas comparativas

### 5.3 Casos de Uso

- **CU-SIM-001**: Usuario inicia un simulacro completo
- **CU-SIM-002**: Usuario completa simulacro dentro del tiempo límite
- **CU-SIM-003**: Usuario visualiza resultados detallados del simulacro
- **CU-SIM-004**: Usuario compara su desempeño entre simulacros

### 5.4 Diseño de Pantallas

- Mock Exam Selection Screen
- Mock Exam Instructions Screen
- Mock Exam Solving Screen
- Mock Exam Results Screen
- Mock Exam History Screen

---

## 6. Gamificación y Progreso

### 6.1 Descripción General

Sistema de gamificación que motiva a los estudiantes mediante puntos, niveles, logros y rachas, incentivando el uso constante de la aplicación.

### 6.2 Funcionalidades Principales

#### 6.2.1 Sistema de XP (Puntos de Experiencia)
- **Ganancia de XP por actividades**:
  - Responder preguntas correctamente
  - Completar prácticas
  - Finalizar evaluaciones diarias
  - Completar simulacros
  - Ganar Versus
  - Participar en foro
- Diferentes cantidades según dificultad
- Bonificaciones por rachas

#### 6.2.2 Sistema de Niveles
- Niveles progresivos (Nivel 1, 2, 3, ... hasta Nivel X)
- XP requerido para cada nivel
- Barra de progreso visual
- Animación al subir de nivel
- Recompensas al alcanzar nuevos niveles

#### 6.2.3 Logros y Badges
- **Categorías de logros**:
  - Por cantidad de preguntas respondidas
  - Por racha de días
  - Por cursos dominados
  - Por participación en Versus
  - Por participación en foro
  - Por completar simulacros
- Badges visuales coleccionables
- Notificaciones al desbloquear logros

#### 6.2.4 Rachas de Estudio
- Días consecutivos de actividad
- Bonificación XP por mantener racha
- Advertencia de riesgo de perder racha
- Recompensas especiales por rachas largas (7, 14, 30 días)

#### 6.2.5 Progreso Detallado
- Estadísticas de XP ganado por actividad
- Gráfico de progreso de niveles
- Historial de logros desbloqueados
- Métricas de participación

### 6.3 Casos de Uso

- **CU-GAM-001**: Usuario gana XP al completar actividades
- **CU-GAM-002**: Usuario sube de nivel al alcanzar XP suficiente
- **CU-GAM-003**: Usuario desbloquea un nuevo logro
- **CU-GAM-004**: Usuario mantiene su racha de estudio
- **CU-GAM-005**: Usuario visualiza su progreso detallado

### 6.4 Diseño de Pantallas

- Progress Overview Screen
- Achievements Screen
- Level Details Screen
- Streak Statistics Screen

---

## 7. Versus (Retos)

### 7.1 Descripción General

Sistema de retos 1 vs 1 donde dos estudiantes compiten respondiendo las mismas preguntas en tiempo real o asíncrono, comparando sus resultados.

### 7.2 Funcionalidades Principales

#### 7.2.1 Inicio de Reto
- Opciones para crear reto:
  - Reto a un amigo específico (por username)
  - Reto público (cualquier usuario puede aceptar)
  - Aceptar reto recibido
- Configuración: curso, tema, dificultad, número de preguntas
- Tiempo límite por pregunta o total

#### 7.2.2 Desarrollo del Reto
- Mismas preguntas para ambos participantes
- Cronómetro individual o compartido
- Respuestas en tiempo real o asíncronas
- Visualización del progreso del oponente (si es tiempo real)
- Notificaciones de actividad del oponente

#### 7.2.3 Finalización y Resultados
- Comparación de resultados:
  - Preguntas correctas vs incorrectas
  - Tiempo empleado
  - Puntaje final
- Ganador determinado por:
  - Mayor número de aciertos
  - En empate: menor tiempo empleado
- XP bonus para el ganador
- Historial del resultado

#### 7.2.4 Historial de Versus
- Lista de retos realizados
- Estadísticas: victorias, derrotas, empates
- Opción para revancha
- Ranking de versus (mejores jugadores)

### 7.3 Casos de Uso

- **CU-VER-001**: Usuario crea un reto a otro estudiante
- **CU-VER-002**: Usuario acepta un reto recibido
- **CU-VER-003**: Usuario participa en reto y visualiza resultados
- **CU-VER-004**: Usuario revisa su historial de versus

### 7.4 Diseño de Pantallas

- Versus Home Screen
- Create Challenge Screen
- Challenge Details Screen
- Versus Battle Screen
- Versus Results Screen
- Versus History Screen

---

## 8. Ranking

### 8.1 Descripción General

Sistema de rankings que permite a los estudiantes comparar su desempeño con otros usuarios de la plataforma, fomentando la competencia sana.

### 8.2 Funcionalidades Principales

#### 8.2.1 Tipos de Ranking
- **Ranking General**: Todos los usuarios ordenados por XP total o nivel
- **Ranking por Curso**: Especializado por curso académico (Matemática, Física, etc.)
- **Ranking Semanal**: Resetea cada semana, basado en actividad de la semana
- **Ranking Mensual**: Resetea cada mes, basado en actividad del mes
- **Ranking de Simulacros**: Mejores puntajes en simulacros
- **Ranking de Versus**: Mejores jugadores en retos

#### 8.2.2 Visualización de Rankings
- Lista paginada con top usuarios
- Posición del usuario actual destacada
- Información mostrada: posición, username, foto, nivel, XP, estadísticas relevantes
- Búsqueda de usuarios específicos
- Filtros adicionales según tipo de ranking

#### 8.2.3 Posición del Usuario
- Posición actual en cada ranking
- Comparación con usuarios cercanos (5 arriba, 5 abajo)
- Gráfico de evolución de posición
- Metas personalizadas (ej: llegar al top 10)

#### 8.2.4 Premios y Reconocimientos
- Badges especiales para top usuarios
- Medallas visuales en perfiles
- Reconocimiento en dashboard
- Sistema de temporadas (opcional)

### 8.3 Casos de Uso

- **CU-RAN-001**: Usuario visualiza ranking general
- **CU-RAN-002**: Usuario consulta ranking por curso específico
- **CU-RAN-003**: Usuario visualiza su posición en diferentes rankings
- **CU-RAN-004**: Usuario busca usuarios específicos en ranking

### 8.4 Diseño de Pantallas

- Ranking Home Screen
- Ranking List Screen (con filtros)
- User Ranking Position Screen
- Ranking Details Screen

---

## 9. Comunidad Académica (Foro)

### 9.1 Descripción General

Foro de discusión donde los estudiantes pueden publicar preguntas, compartir conocimiento y colaborar en el aprendizaje.

### 9.2 Funcionalidades Principales

#### 9.2.1 Publicación de Preguntas
- Formulario para publicar pregunta:
  - Título
  - Contenido/descripción
  - Curso/tema relacionado
  - Opción de adjuntar imágenes
  - Tags/etiquetas
- Validación de contenido antes de publicar

#### 9.2.2 Visualización de Publicaciones
- Feed principal con todas las publicaciones
- Filtros: por curso, por tema, por fecha, por popularidad
- Ordenamiento: más recientes, más votadas, más comentadas
- Búsqueda de publicaciones

#### 9.2.3 Sistema de Respuestas
- Los usuarios pueden responder preguntas
- Respuestas pueden ser marcadas como "Mejor Respuesta" por el autor
- Respuestas con formato (texto, imágenes)
- Respuestas anidadas (comentarios a respuestas)

#### 9.2.4 Sistema de Votaciones
- Votar positivamente o negativamente publicaciones/respuestas
- Puntuación visible (upvotes - downvotes)
- Un usuario puede votar una vez por publicación/respuesta
- Ranking de publicaciones más votadas

#### 9.2.5 Moderación Básica
- Reportar contenido inapropiado
- Ocultar publicaciones reportadas (pendiente revisión)
- Sistema de karma/reputación (opcional)

#### 9.2.6 Perfil de Usuario en Foro
- Estadísticas: publicaciones realizadas, respuestas dadas, votos recibidos
- Lista de publicaciones propias
- Badges de experto por curso (basado en respuestas útiles)

### 9.3 Casos de Uso

- **CU-FOR-001**: Usuario publica una pregunta en el foro
- **CU-FOR-002**: Usuario responde a una pregunta de otro usuario
- **CU-FOR-003**: Usuario vota publicaciones/respuestas
- **CU-FOR-004**: Usuario busca y filtra publicaciones
- **CU-FOR-005**: Usuario reporta contenido inapropiado

### 9.4 Diseño de Pantallas

- Forum Home Screen
- Create Post Screen
- Post Detail Screen
- User Forum Profile Screen
- Forum Search Screen

---

## 10. Notificaciones y Dato del Día

### 10.1 Descripción General

Sistema de notificaciones push para mantener a los estudiantes informados y motivados, además de un "Dato del Día" con contenido educativo.

### 10.2 Funcionalidades Principales

#### 10.2.1 Notificaciones Push
- **Tipos de notificaciones**:
  - Evaluación diaria disponible
  - Nuevo reto recibido
  - Respuesta a pregunta en foro
  - Nuevo logro desbloqueado
  - Recordatorio de mantener racha
  - Actualizaciones de ranking
  - Mensajes del sistema
- Permisos de notificaciones (solicitar al usuario)
- Configuración de preferencias de notificaciones

#### 10.2.2 Centro de Notificaciones
- Lista de notificaciones recibidas
- Marcar como leída/no leída
- Eliminar notificaciones
- Navegación directa a contenido relacionado desde notificación
- Agrupación por tipo o fecha

#### 10.2.3 Dato del Día
- **Contenido diario educativo**:
  - Curiosidad académica
  - Tip o consejo de estudio
  - Fórmula importante
  - Concepto clave explicado brevemente
  - Estadística motivadora
- Visualización destacada en dashboard
- Historial de datos anteriores
- Compartir dato del día (opcional)

#### 10.2.4 Recordatorios Personalizados
- Configuración de horarios de recordatorios
- Recordatorios de práctica diaria
- Recordatorios de evaluaciones pendientes
- Recordatorios de retos pendientes

### 10.3 Casos de Uso

- **CU-NOT-001**: Usuario recibe notificación push de evaluación diaria
- **CU-NOT-002**: Usuario configura preferencias de notificaciones
- **CU-NOT-003**: Usuario visualiza dato del día en dashboard
- **CU-NOT-004**: Usuario consulta centro de notificaciones

### 10.4 Diseño de Pantallas

- Notifications Center Screen
- Notification Settings Screen
- Daily Fact Screen (modal o pantalla)

---

## 11. Configuración y Privacidad

### 11.1 Descripción General

Módulo de configuración que permite al usuario personalizar su experiencia y gestionar su privacidad y seguridad.

### 11.2 Funcionalidades Principales

#### 11.2.1 Preferencias de Aplicación
- **Configuración de notificaciones**:
  - Activar/desactivar notificaciones push
  - Configurar tipos de notificaciones
  - Horarios de notificaciones silenciosas
- **Preferencias de visualización**:
  - Tema claro/oscuro (si está implementado)
  - Tamaño de fuente
  - Idioma (si aplica)
- **Preferencias de sonido**:
  - Activar/desactivar sonidos
  - Volumen de efectos

#### 11.2.2 Seguridad
- Cambio de contraseña
- Autenticación de dos factores (2FA) - si está implementado
- Sesiones activas (cerrar sesión en otros dispositivos)
- Historial de actividad de cuenta

#### 11.2.3 Privacidad
- Configuración de visibilidad de perfil
- Control de qué información es pública
- Configuración de privacidad en ranking
- Opción de cuenta privada/pública

#### 11.2.4 Gestión de Datos
- Descargar datos personales
- Eliminar cuenta (con confirmación)
- Política de privacidad y términos de servicio (enlaces)

#### 11.2.5 Acerca de
- Información de la aplicación (versión, build)
- Información del proyecto/tesis
- Enlaces a documentación
- Créditos y agradecimientos

#### 11.2.6 Logout
- Cerrar sesión con confirmación
- Opción de "Cerrar sesión en todos los dispositivos"
- Redirección a pantalla de login

### 11.3 Casos de Uso

- **CU-CONF-001**: Usuario cambia sus preferencias de notificaciones
- **CU-CONF-002**: Usuario cambia su contraseña
- **CU-CONF-003**: Usuario configura opciones de privacidad
- **CU-CONF-004**: Usuario cierra sesión
- **CU-CONF-005**: Usuario elimina su cuenta

### 11.4 Diseño de Pantallas

- Settings Home Screen
- Notification Settings Screen
- Privacy Settings Screen
- Security Settings Screen
- About Screen

---

## Consideraciones de Integración entre Módulos

### Dependencias Cruzadas

- **Dashboard** consume información de todos los módulos
- **Gamificación** se integra con prácticamente todos los módulos
- **Ranking** utiliza datos de XP, Versus y Simulacros
- **Notificaciones** se activan desde múltiples módulos
- **Perfil** muestra información consolidada de otros módulos

### Flujo de Datos

- Todos los módulos requieren autenticación (excepto login/registro)
- Los módulos comparten datos a través de estado global o repositorios
- Las actualizaciones de XP y niveles se propagan en tiempo real
- Los rankings se actualizan según actividad en otros módulos

---

**Versión**: 1.0.0  
**Última actualización**: 2024  
**Autor**: Equipo de Desarrollo INTEGRALCLASS GO

