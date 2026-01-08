/// Sistema de espaciado de IntegralClass Go
/// 
/// Define las unidades de espaciado según el Design System
/// Base: 8px (unidad fundamental)

class AppSpacing {
  AppSpacing._(); // Constructor privado
  
  // Unidades base (múltiplos de 8px)
  static const double xs = 4.0;   // 0.5x
  static const double sm = 8.0;   // 1x
  static const double md = 16.0;  // 2x
  static const double lg = 24.0;  // 3x
  static const double xl = 32.0;  // 4x
  static const double xxl = 48.0; // 6x
  static const double xxxl = 64.0; // 8x
  
  // Espaciado específico para pantallas
  static const double screenPadding = md; // 16px en móviles
  static const double screenPaddingTablet = lg; // 24px en tablets
  
  // Espaciado entre secciones
  static const double sectionSpacing = lg; // 24px
  static const double sectionSpacingLarge = xl; // 32px
  
  // Espaciado entre elementos relacionados
  static const double relatedSpacing = sm; // 8px
  static const double relatedSpacingMedium = md; // 16px
  
  // Espaciado entre elementos no relacionados
  static const double unrelatedSpacing = md; // 16px
  static const double unrelatedSpacingLarge = lg; // 24px
}

