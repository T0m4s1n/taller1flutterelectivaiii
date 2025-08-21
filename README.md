# 🚀 Tomasin App - Aplicación Flutter

Una aplicación Flutter moderna y elegante con navegación entre pantallas, contador interactivo y diseño glassmorphism.

## ✨ Características Principales

### 🏠 Pantalla Principal
- **5 botones de navegación** organizados verticalmente
- **Diseño moderno** con gradientes y efectos visuales
- **Navegación fluida** entre todas las pantallas

### 📱 Pantallas Disponibles

#### 1. **Layout con 3 Containers**
- 3 contenedores decorativos con sombras
- ListView con 20 elementos de ejemplo
- Diseño responsive y elegante

#### 2. **Contador Interactivo**
- Contador que sube y baja (+/-)
- Botón para guardar valores
- Muestra cantidad de elementos guardados
- Animaciones suaves y feedback visual

#### 3. **Lista de Contadores**
- Muestra todos los contadores guardados
- Estado vacío con botón de navegación
- Botón de actualización para refrescar lista
- Información detallada de cada contador

#### 4. **Emojis de Sandías**
- Grid de 30 emojis de sandía 🍉
- Diseño atractivo y divertido
- Contador total de sandías

#### 5. **Pantalla Extra**
- Redirige al layout con 3 containers
- Para futuras funcionalidades

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── models/
│   └── counter_item.dart    # Modelo para elementos del contador
├── screens/
│   ├── home_screen.dart     # Pantalla principal con navegación
│   ├── layout_screen.dart   # Layout con containers y ListView
│   ├── counter_screen.dart  # Pantalla del contador
│   ├── list_screen.dart     # Lista de contadores guardados
│   └── watermelon_screen.dart # Pantalla de emojis de sandías
└── widgets/
    └── navigation_button.dart # Widget personalizado para botones
```

## 🎨 Diseño y UI

### **Tema Visual**
- **Colores**: Esquema basado en deepPurple
- **Gradientes**: Fondos con gradientes suaves
- **Glassmorphism**: Efectos de transparencia y blur
- **Sombras**: Sombras sutiles para profundidad

### **Componentes**
- **AppBar**: Navegación consistente en todas las pantallas
- **Botones**: Diseño moderno con iconos y texto
- **Containers**: Bordes redondeados y efectos visuales
- **ListViews**: Diseño limpio y organizado

## 🔧 Funcionalidades Técnicas

### **Navegación**
- `Navigator.push()` para navegar entre pantallas
- `Navigator.pop()` para regresar
- AppBar funcional en todas las pantallas

### **Estado**
- Lista estática compartida entre pantallas
- Persistencia de datos durante la sesión
- Actualización en tiempo real

### **Performance**
- Widgets optimizados con `const` constructors
- RepaintBoundary para mejor rendimiento
- Animaciones suaves y eficientes

## 🚀 Cómo Usar

### **1. Navegación Principal**
- Abre la aplicación
- Selecciona cualquiera de los 5 botones
- Navega entre pantallas

### **2. Contador**
- Ve a "Contador"
- Usa + y - para cambiar valores
- Presiona "Guardar Contador" para almacenar
- El valor se resetea después de guardar

### **3. Lista de Contadores**
- Ve a "Lista de Contadores"
- Ve todos los contadores guardados
- Usa el botón de actualización si es necesario

### **4. Emojis de Sandías**
- Ve a "Emojis de Sandías"
- Disfruta de la colección de sandías 🍉

## 📱 Requisitos

- **Flutter**: 3.8.1 o superior
- **Dart**: 3.0.0 o superior
- **Plataformas**: Android, iOS, Web, Desktop

## 🛠️ Instalación

1. **Clona el repositorio**
   ```bash
   git clone [url-del-repositorio]
   cd aplicacionpruebaproyectos
   ```

2. **Instala dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**
   ```bash
   flutter run
   ```

## 🔮 Futuras Mejoras

- [ ] Persistencia de datos con SharedPreferences
- [ ] Tema oscuro/claro
- [ ] Más animaciones y transiciones
- [ ] Configuración de usuario
- [ ] Exportar datos de contadores

## 📄 Licencia

Este proyecto está bajo la Licencia MIT.

## 👨‍💻 Autor

**Tomasin** - Desarrollador Flutter

---

¡Disfruta usando la aplicación! 🎉
# taller1flutterelectivaiii
