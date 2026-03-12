# 📈 Enterprise CRM Demo

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design 3](https://img.shields.io/badge/Material_3-757575?style=for-the-badge)
![Web & Mobile Build](https://img.shields.io/badge/Responsive-Desktop_|_Mobile-success?style=for-the-badge)

[**🌐 Live Demo / Demostración en Vivo**](https://estebanrdz6.github.io/crm-enterprise-demo/)

---

## 📋 Descripción del Proyecto

**Enterprise CRM Demo** es una aplicación de demostración front-end desarrollada en **Flutter**, diseñada con los más altos estándares corporativos. Este proyecto sirve como portafolio comercial para mostrar cómo un Customer Relationship Management (CRM) moderno puede transformar la gestión de clientes y el flujo de ventas dentro de una empresa.

El proyecto es **100% interactivo y responsivo** (adaptable a resoluciones Web/Escritorio y Dispositivos Móviles). Todos los procesos, métricas y gestión de pipeline utilizan estructuras de datos simulados (Mock Data) nativamente en memoria, lo que permite experimentar con la aplicación sin requerir un backend activo.

<br>

## ✨ Características Principales (Features)

*   📊 **Dashboard de Métricas:** Visualización en tiempo real de clientes totales, oportunidades activas y volumen de ventas mensuales proyectadas.
*   👥 **Gestión Completa de Clientes:** Tabla dinámica con estados visuales (Activo, Inactivo, Prospecto) para facilitar la prospección comercial.
*   📂 **Pipeline de Ventas Interactivo (Kanban):** Tablero *Drag & Drop* que permite mover oportunidades entre 5 etapas clave (*Lead*, *Contactado*, *Propuesta*, *Negociación*, *Cerrado*).
*   📈 **Módulo Avanzado de Analytics:** Gráficos estadísticos profesionales integrados utilizando `fl_chart`.
*   🌍 **Internacionalización (i18n):** Soporte bilingüe dinámico (Inglés / Español) que permite cambiar el idioma al instante sin recargar la aplicación.
*   👔 **UI / UX Profesional:** Basado en especificaciones de **Material Design 3**, con soporte nativo para `Dark Theme` (Modo Oscuro) y `Light Theme` (Modo Claro) detectado a nivel de sistema.

<br>

## 🛠️ Tecnologías Utilizadas

*   **Framework:** [Flutter](https://flutter.dev/) (SDK + Web Plugins)
*   **Lenguaje:** [Dart](https://dart.dev/)
*   **Gestión de Estado:** [Provider](https://pub.dev/packages/provider)
*   **Diseño Visual:** `Material 3` e Íconos Material.
*   **Gráficos:** [fl_chart](https://pub.dev/packages/fl_chart)
*   **Traducciones / Locales:** `flutter_localizations` basando recursos en diccionarios `Map` internos.
*   **Despliegue CI/CD:** GitHub Actions (automatizado hacia GitHub Pages).

<br>


## 🏗️ Estructura del Código (\`lib/\`)

El proyecto sigue una arquitectura modular y separada por responsabilidades para gran mantenibilidad:

```text
lib/
 ┣ 📂 data/          # Mock data y simulación de base de datos en estado continuo.
 ┣ 📂 l10n/          # Archivos y delegados de internacionalización (i18n).
 ┣ 📂 models/        # Entidades puras en Dart (Client, Opportunity).
 ┣ 📂 screens/       # Vistas y pantallas completas de sistema (Dashboard, Pipeline, etc.).
 ┣ 📂 widgets/       # Componentes reusables UI (Ej: AppShell - Estructura de navegación).
 ┗ 📜 main.dart      # Punto de entrada principal y configuración del Provider/Theme.
```

---
*Si deseas implementar este CRM real con integración de backend (Firebase, Supabase u otra base SQL/NoSQL), ¡no dudes en contactarme!*
