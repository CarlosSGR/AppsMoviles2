# Mi app 2 — Cafe IEST

App en SwiftUI (Swift Playgrounds, iOS 18.7+) de una cafetería con dos pestañas: **Inicio** y **Menú**.

Este documento explica dónde se aplican los temas de **Tabs, Navigation, @Binding, Model, ViewModel y View**, y en qué archivos se usan o se referencian, con el cómo y el por qué de cada caso.

`Package.swift` es autogenerado y no participa en estos temas.

---

## Estructura del proyecto

| Archivo | Tipo | Temas que contiene |
|---|---|---|
| `MyApp.swift` | Punto de entrada | Tabs (carga el TabView) |
| `ContentView.swift` | View | Tabs |
| `InicioView.swift` | View | Bindings con `$`, View |
| `MenuView.swift` | View | Navigation, @Binding (dueño del dato), Model, ViewModel |
| `DetalleView.swift` | View | Navigation, @Binding, Model |
| `IngredientesView.swift` | View | Navigation (sheet / dismiss), Model, ViewModel (preview) |
| `BebidaRowView.swift` | View | Model, ViewModel (preview) |
| `PromoView.swift` | View | View reutilizable |
| `CardModifier.swift` | ViewModifier | Estilo reutilizable para vistas |
| `Bebida.swift` | Model | Model |
| `BebidaVM.swift` | ViewModel | ViewModel |

---

## 1. Tabs (TabView)

### `ContentView.swift` (donde se definen)

```swift
TabView {
    Tab("Inicio", systemImage: "house") { InicioView() }
    Tab("Menú", systemImage: "cup.and.saucer") { MenuView() }
}.tint(.purple)
```

- **Dónde:** el `body` completo de `ContentView`.
- **Cómo:** un `TabView` con dos `Tab`. Cada una tiene un título, un ícono SF Symbol y la vista que muestra. `.tint(.purple)` pinta de morado la pestaña activa.
- **Por qué:** divide la app en dos secciones independientes entre las que el usuario cambia desde la barra inferior.
- **Nota:** la sintaxis `Tab("…", systemImage:)` es la nueva de iOS 18. Funciona porque `Package.swift` declara `.iOS("18.7")`.

### `MyApp.swift`

```swift
WindowGroup { ContentView() }
```

- Es el punto de entrada (`@main`). Carga `ContentView()`, así que el TabView es lo primero que ve el usuario.

---

## 2. Navigation

### `MenuView.swift` (donde empieza la navegación)

```swift
NavigationStack {
    List {
        ForEach(bebidas) { bebida in
            NavigationLink(destination: DetalleView(bebida: bebida, favorita: $favorita), label: {
                BebidaRowView(bebida: bebida, esFavorita: favorita == bebida.id)
            })
        }
    }.navigationTitle("Menú")
}
```

- `NavigationStack` envuelve la `List` y crea la "pila" de pantallas.
- Cada fila es un `NavigationLink`. Al tocarla, `DetalleView` se empuja encima de la lista.
- `.navigationTitle("Menú")` pone el título grande arriba.
- **Por qué está aquí y no en ContentView:** así cada pestaña tiene su propia navegación, y al entrar a un detalle la barra de tabs se mantiene visible.

### `DetalleView.swift` (pantalla destino)

- `.navigationTitle(bebida.nombre)` con `.navigationBarTitleDisplayMode(.inline)` pone el nombre de la bebida como título pequeño.
- `.navigationBarBackButtonHidden(true)` oculta el botón "atrás" del sistema.
- `.toolbar` agrega un `ToolbarItem` en `.navigationBarLeading` con una flecha morada que llama a `dismiss()` para regresar a la lista.
  - `dismiss` viene de `@Environment(\.dismiss) var dismiss`.
  - **Por qué:** permite personalizar el botón de regreso.
- `.sheet(isPresented: $mostrarIngredientes) { IngredientesView(bebida: bebida) }` es **navegación modal**: abre la hoja de ingredientes desde abajo.

### `IngredientesView.swift`

- También usa `@Environment(\.dismiss)`.
- Aquí `dismiss()` **cierra la hoja** con el botón ✕, mientras que en `DetalleView` regresa en la pila. Es la misma herramienta con un efecto distinto según cómo se presentó la vista.

---

## 3. @Binding

### `DetalleView.swift` (quien recibe el Binding)

```swift
@Binding var favorita: Int
```

- `DetalleView` **no es dueña** del dato; solo recibe una referencia al `@State` del padre.
- El botón de favorita hace:

```swift
withAnimation() { favorita = bebida.id }
```

- Ese cambio se refleja **directamente en `MenuView`**.
- El mismo valor se usa para cambiar el texto, el ícono y el color del botón ("Es tu favorita" con estrella llena y fondo amarillo, o "Marcar como favorita" en gris).

### `MenuView.swift` (dueño del dato)

```swift
@State var favorita: Int = 0
...
DetalleView(bebida: bebida, favorita: $favorita)
```

- Declara el `@State` y lo pasa con `$` para crear el Binding.
- **Por qué:** al volver a la lista, `BebidaRowView(..., esFavorita: favorita == bebida.id)` muestra la estrella en la bebida correcta. Sin el Binding, el cambio se quedaría solo en la pantalla de detalle y se perdería al regresar.

### Otros bindings con `$` (sin declarar `@Binding`)

| Archivo | Código | Para qué |
|---|---|---|
| `DetalleView.swift` | `.sheet(isPresented: $mostrarIngredientes)` | La hoja puede regresar el valor a `false` al cerrarse |
| `DetalleView.swift` | `.alert(..., isPresented: $mostrarAlerta)` | Igual que la hoja, pero para la alerta |
| `InicioView.swift` | `TextField("¿Como te llamas?", text: $nombre)` | El campo lee y escribe el `@State nombre` en ambos sentidos |

> En `InicioView`, el nombre escrito pasa a `@AppStorage("nombreCliente")` al presionar "Guardar". `@AppStorage` lo guarda de forma persistente aunque se cierre la app.

---

## 4. Model

### `Bebida.swift`

```swift
struct Bebida: Identifiable {
    let id: Int
    let nombre: String
    let icono: String
    let precio: Float
    let descripcion: String
    let ingredientes: [String]
    let ventas: Int
    let color: Color
}
```

- **Qué es:** describe la forma de los datos de una bebida, sin lógica ni UI.
- **Por qué `Identifiable`:** gracias a `id`, se puede usar `ForEach(bebidas)` sin indicar `id:`.

### Archivos que usan el modelo

| Archivo | Cómo lo usa |
|---|---|
| `BebidaVM.swift` | Crea las 3 instancias: Americano, Latte y Frappe |
| `MenuView.swift` | Guarda un `[Bebida]` en `@State var bebidas` y lo recorre con `ForEach`; `.onDelete` permite borrar elementos |
| `BebidaRowView.swift` | `var bebida: Bebida` → muestra ícono, color, nombre y precio |
| `DetalleView.swift` | `var bebida: Bebida` → usa ícono, nombre, precio, descripción, color e `id` |
| `IngredientesView.swift` | `var bebida: Bebida` → recorre `bebida.ingredientes` con `ForEach` |

---

## 5. ViewModel

### `BebidaVM.swift`

```swift
struct BebidaVM {
    func dummyData() -> [Bebida] { ... }
}
```

- **Qué hace:** regresa el arreglo de bebidas de ejemplo.
- **Por qué:** separa *de dónde salen los datos* de *cómo se muestran*. Las vistas no crean bebidas, se las piden al VM.

### Archivos que usan el ViewModel

| Archivo | Uso |
|---|---|
| `MenuView.swift` | `@State var bebidas = BebidaVM().dummyData()`, el uso real en la app |
| `BebidaRowView.swift` | Solo en `#Preview`: `BebidaVM().dummyData()[0]` |
| `IngredientesView.swift` | Solo en `#Preview`: `BebidaVM().dummyData()[2]` |

---

## 6. View

Todo lo que conforma el protocolo `View` es la capa visual:

| Vista | Función |
|---|---|
| `ContentView` | Contenedor de las pestañas |
| `InicioView` | Pestaña de inicio: nombre guardado con `@AppStorage`, likes con animación, banner con `AsyncImage` y promociones. No usa Model ni ViewModel |
| `MenuView` | Lista de bebidas con navegación |
| `BebidaRowView` | Fila reutilizable de la lista; recibe `bebida` y `esFavorita` |
| `DetalleView` | Detalle de una bebida, botón de favorita y botón de ingredientes |
| `IngredientesView` | Hoja modal con la lista de ingredientes |
| `PromoView` | Tarjeta de promoción reutilizable; se usa 3 veces en `InicioView` |

### `CardModifier.swift`

- No es una `View`, es un **`ViewModifier`**.
- Encapsula el estilo de tarjeta: padding, ancho completo, fondo, esquinas redondeadas y borde rojo.
- Se aplica con `.modifier(CardModifier(fondo:))` en:
  - `PromoView.swift`, la tarjeta completa de cada promoción.
  - `DetalleView.swift`, el texto de descripción (con fondo naranja).
- **Por qué:** evita repetir el mismo bloque de modificadores en varias vistas.

---

## Flujo completo de la app

```
MyApp
 └── ContentView (TabView)
      ├── Tab "Inicio" → InicioView
      │                   └── PromoView ×3 (usa CardModifier)
      └── Tab "Menú"   → MenuView (NavigationStack)
                          │  bebidas ← BebidaVM().dummyData() → [Bebida]
                          │  @State favorita
                          ├── BebidaRowView (fila por bebida)
                          └── NavigationLink → DetalleView(bebida, $favorita)  ← @Binding
                                               └── .sheet → IngredientesView(bebida)
```

---

## Observaciones

1. **La alerta nunca aparece.** `DetalleView` tiene un `.alert` ligado a `$mostrarAlerta`, pero ningún botón pone `mostrarAlerta = true`. Falta un botón (por ejemplo "Ordenar") que lo active; al confirmar se llamaría a `reproducirSonido()`.
2. **`BebidaVM` es un ViewModel simplificado.** En MVVM formal sería una `class` con `@Observable` (o `ObservableObject` con `@Published`) que guarda los datos y la lógica, y la vista lo observa. Aquí es un `struct` que solo regresa datos, y el estado vive en `MenuView`.
