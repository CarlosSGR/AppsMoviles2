import Foundation

struct BebidaVM {
    func dummyData() -> [Bebida] {
        let bebidas: [Bebida] = [
            Bebida(id: 1, nombre: "Americano", icono: "cup.and.saucer.fill", precio: 35, descripcion: "Cafe negro preparado con espresso y agua caliente", ingredientes: ["Espresso", "Agua Caliente"], ventas: 120, color: .brown),
            Bebida(id: 2, nombre: "Latte", icono: "mug.fill", precio: 50, descripcion: "Espresso con mucha leche vaporizada y poco de espuma", ingredientes: ["Espresso", "Leche", "Espuma de leche"], ventas: 95, color: .orange),
            Bebida(id: 3, nombre: "Frappe", icono: "leaf.fill", precio: 65, descripcion: "Bebida fria", ingredientes: ["Cafe", "Hielo", "Leche"], ventas: 150, color: .pink)
        ]
        return bebidas
    }
}
