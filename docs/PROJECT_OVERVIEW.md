# Visión General del Proyecto INTEGRALCLASS GO

## 1. Información General

### 1.1 Datos del Proyecto

- **Nombre del Aplicativo**: INTEGRALCLASS GO
- **Tipo de Proyecto**: Aplicación móvil multiplataforma
- **Plataformas Objetivo**: Android e iOS
- **Tecnología Principal**: Flutter (Dart)
- **Contexto**: Tesis Universitaria - Ingeniería Informática

### 1.2 Título de la Tesis

**"Aplicativo móvil con gamificación para incrementar la probabilidad de ingreso a las universidades de los estudiantes preuniversitarios en la ciudad de Trujillo"**

### 1.3 Entidad Beneficiaria

**IntegralClass Preuniversitaria**  
Ubicación: Trujillo, Perú

---

## 2. Contexto del Problema

### 2.1 Situación Actual

En la ciudad de Trujillo, los estudiantes que aspiran ingresar a universidades de prestigio, particularmente la **Universidad Nacional de Trujillo (UNT)**, enfrentan exámenes de admisión de alta complejidad y competitividad. Para prepararse adecuadamente, la mayoría de estos estudiantes recurre a academias preuniversitarias especializadas.

### 2.2 Problemática Identificada

1. **Costo Económico Significativo**: La preparación en academias preuniversitarias implica un gasto considerable para las familias.
2. **Optimización del Tiempo**: Los estudiantes requieren prácticas constantes y organizadas para mejorar su desempeño.
3. **Necesidad de Métricas**: Falta de herramientas que permitan medir el progreso y identificar áreas de mejora.
4. **Motivación**: La preparación requiere motivación continua para mantener el ritmo de estudio.
5. **Acceso Limitado**: Restricciones geográficas y temporales para acceder a material de estudio y evaluaciones.

### 2.3 Oportunidad Tecnológica

El crecimiento del uso de dispositivos móviles entre estudiantes preuniversitarios, junto con técnicas de gamificación aplicadas a la educación, representa una oportunidad para crear una solución tecnológica que optimice el proceso de preparación académica.

---

## 3. Objetivo General

Desarrollar un aplicativo móvil educativo con gamificación que permita mejorar el desempeño académico de los estudiantes preuniversitarios y, con ello, incrementar su probabilidad de ingreso a universidades, mediante práctica constante, evaluaciones, simulacros y competencia sana.

### 3.1 Objetivos Específicos

1. **Proporcionar Plataforma de Práctica**: Ofrecer un sistema de práctica por temas con diferentes niveles de dificultad.
2. **Implementar Evaluaciones Programadas**: Crear sistema de evaluaciones diarias y simulacros virtuales tipo examen de admisión.
3. **Gamificar la Experiencia de Aprendizaje**: Implementar sistema de XP, niveles, logros y ranking para motivar a los estudiantes.
4. **Facilitar Competencia Colaborativa**: Permitir retos entre estudiantes (modo Versus) y rankings comparativos.
5. **Crear Comunidad Académica**: Establecer un foro donde los estudiantes puedan interactuar y resolver dudas.
6. **Generar Métricas de Progreso**: Proporcionar dashboards con estadísticas detalladas del desempeño del estudiante.
7. **Optimizar Experiencia de Usuario**: Diseñar una interfaz intuitiva, moderna y optimizada para sesiones prolongadas de estudio.

---

## 4. Alcance del Sistema

### 4.1 Componentes del Sistema

El sistema completo se compone de tres componentes principales:

1. **Aplicación Móvil Flutter** (Enfoque principal de este proyecto)
   - Plataformas: Android e iOS
   - Usuarios: Estudiantes preuniversitarios
   - Funcionalidades: Todos los módulos descritos en MODULES.md

2. **API REST Backend** (Fase posterior)
   - Servidor web para gestión de datos
   - Autenticación y autorización
   - Procesamiento de lógica de negocio
   - Gestión de base de datos

3. **Panel Administrativo Web** (Fuera del alcance inmediato)
   - Gestión de contenido académico
   - Administración de usuarios
   - Reportes y analytics
   - Moderación de foro

### 4.2 Alcance de la Aplicación Móvil

La aplicación móvil INTEGRALCLASS GO incluye los siguientes módulos:

1. Autenticación y Perfil
2. Dashboard Principal
3. Práctica por Temas
4. Evaluaciones Diarias
5. Simulacros Virtuales
6. Gamificación y Progreso
7. Versus (Retos)
8. Ranking
9. Comunidad Académica (Foro)
10. Notificaciones y Dato del Día
11. Configuración y Privacidad

*Ver MODULES.md para descripción detallada de cada módulo.*

### 4.2 Alcance Excluido (Por Ahora)

- Desarrollo del backend (se desarrollará posteriormente)
- Panel administrativo web
- Integración con sistemas externos de terceros
- Funcionalidades offline completas (modo offline limitado)

---

## 5. Usuarios del Sistema

### 5.1 Usuario Principal: Estudiante Preuniversitario

**Características:**
- Edad promedio: 16-19 años
- Usa dispositivo móvil (Android o iOS) como herramienta principal
- Busca ingresar a universidades competitivas
- Requiere práctica constante y retroalimentación inmediata
- Valora la gamificación y competencia sana
- Necesita acceder a contenido académico de calidad
- Requiere métricas claras de su progreso

**Necesidades:**
- Práctica estructurada por temas y cursos
- Evaluaciones que simulen exámenes reales
- Motivación a través de gamificación
- Comparación con otros estudiantes
- Acceso a comunidad de estudio
- Información personalizada de su desempeño

---

## 6. Tecnologías y Herramientas

### 6.1 Stack Tecnológico

**Frontend/UI:**
- **Flutter**: Framework multiplataforma (Android e iOS)
- **Dart**: Lenguaje de programación
- **Material Design**: Sistema de diseño (con personalización corporativa)

**Arquitectura:**
- **Clean Architecture**: Separación de capas (Presentation, Domain, Data)
- **MVVM**: Patrón Model-View-ViewModel
- **Provider/Bloc**: Gestión de estado (a definir según implementación)

**Backend (Futuro):**
- API REST (tecnología a definir)
- Autenticación JWT
- Base de datos relacional/NoSQL (a definir)

**Herramientas de Desarrollo:**
- Flutter SDK 3.10.4+
- Android Studio / VS Code
- Git (control de versiones)
- Testing frameworks (unit, widget, integration tests)

---

## 7. Características Principales

### 7.1 Gamificación

- Sistema de puntos de experiencia (XP)
- Niveles de usuario
- Logros y badges
- Rachas de estudio
- Rankings competitivos

### 7.2 Contenido Académico

- Preguntas organizadas por curso y tema
- Múltiples niveles de dificultad
- Retroalimentación inmediata
- Explicaciones detalladas

### 7.3 Evaluaciones

- Evaluaciones diarias (mini tests)
- Simulacros virtuales completos
- Cronómetros en tiempo real
- Resultados detallados con análisis

### 7.4 Interacción Social

- Modo Versus (retos 1 vs 1)
- Ranking general y por cursos
- Foro de comunidad académica
- Sistema de votaciones

### 7.5 Personalización

- Perfil personalizable
- Dashboard con métricas personalizadas
- Notificaciones configurables
- Preferencias de usuario

---

## 8. Impacto Esperado

### 8.1 Impacto Académico

- Mejora en el desempeño académico de los estudiantes
- Incremento en la probabilidad de ingreso universitario
- Optimización del tiempo de estudio

### 8.2 Impacto Tecnológico

- Demostración de aplicación de Clean Architecture en Flutter
- Implementación exitosa de gamificación en educación
- Mejora en la experiencia de usuario en aplicaciones educativas

### 8.3 Impacto Social

- Mayor accesibilidad a contenido de calidad
- Creación de comunidad académica colaborativa
- Reducción de barreras económicas y geográficas

---

## 9. Metodología de Desarrollo

### 9.1 Enfoque

- Desarrollo incremental por módulos
- Documentación primero (esta fase)
- Implementación siguiendo Clean Architecture
- Testing continuo

### 9.2 Fases del Proyecto

1. **Fase 1: Documentación y Diseño** (Actual)
   - Definición de arquitectura
   - Sistema de diseño
   - Documentación técnica

2. **Fase 2: Setup y Configuración**
   - Configuración de proyecto Flutter
   - Estructura de carpetas Clean Architecture
   - Configuración de dependencias base

3. **Fase 3: Desarrollo de Módulos Core**
   - Autenticación
   - Navegación
   - Diseño base

4. **Fase 4: Desarrollo de Módulos Funcionales**
   - Implementación módulo por módulo
   - Integración con API (mock inicialmente)
   - Testing

5. **Fase 5: Integración y Pruebas**
   - Integración completa
   - Pruebas de usuario
   - Optimización

6. **Fase 6: Despliegue y Validación**
   - Publicación en stores
   - Recopilación de feedback
   - Mejoras continuas

---

## 10. Consideraciones Éticas y Legales

- **Privacidad**: Protección de datos personales de estudiantes
- **Seguridad**: Manejo seguro de credenciales y información sensible
- **Propiedad Intelectual**: Respeto a derechos de autor del contenido académico
- **Uso Responsable**: Promoción de uso equilibrado de la aplicación

---

## 11. Conclusión

INTEGRALCLASS GO representa una solución tecnológica integral para mejorar la preparación académica de estudiantes preuniversitarios mediante la combinación de tecnología móvil, gamificación y contenido educativo de calidad. El proyecto busca generar un impacto positivo tanto académico como social en la comunidad de Trujillo.

---

**Versión**: 1.0.0  
**Última actualización**: 2024  
**Autor**: Equipo de Desarrollo INTEGRALCLASS GO

