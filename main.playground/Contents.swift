class Fruit {
    
    static var id: Int = 0
    var id: Int
    var type: String
    // Weight in grams
    var weight: Float
    
    init(weight: Float, type: String) {
        Fruit.id = Fruit.id + 1
        self.id = Fruit.id
        self.type = type
        self.weight = weight
    }
    
    func toString() -> String {
        return "ID: \(self.id), Type: \(self.type), Weight: \(self.weight)gr"
    }
}

class Greengrocer {
    
    var fruits:[String: [Fruit]] = [:]
    // var fruits2:[String: (Float, [Fruit])] = [:]
    var prices:[String:Float] = [:]
    
    // Potremmo inizializzare la classe con il valore del prezzo/kg di ogni singolo frutto
    // passando come parametro un dictionary come -prices-, ma per semplicità usiamo un approccio diverso
    init(){}
    
    func addFruit(content: [Fruit], price: Float) {
        self.fruits.updateValue(content, forKey: content[0].type)
        self.prices.updateValue(price, forKey: content[0].type)
    }
    
    func countFruitTypes() -> String{
        var counter: Int = 0
        var output: String = "Ci sono "
        for (index, value) in self.fruits {
            if counter == 0 {
                output.append("\(value.count) \(index)s")
                counter += 1
            }
            else if self.fruits.count  != counter + 1 {
                output.append(", \(value.count) \(index)s")
                counter += 1
            }
            else {
                output.append(" e \(value.count) \(index)s")
            }
        }
        return output
    }
    
    func totalValue() -> Float {
        var total: Float = 0
        
        for (index, value) in self.fruits {
            for item in value {
                if let key = self.prices[index] {
                    total += item.weight / 100 * key
                }
            }
        }
        
        return total
    }
    
    func sellFruit(id: Int) -> Fruit? {
        for (index, value) in self.fruits {
            for item in value {
                if id == item.id {
                    var tmp:[Fruit] = value
                    var selled = tmp.remove(at: item.id - 1)
                    self.fruits[index] = tmp
                    return selled
                }
            }
        }
        return nil
    }
}

print("\t=======================================================================")
print("\t🏠 Benvenuti da Pippo de Pippis, il miglior fruttivendolo del quartiere")
var ggr = Greengrocer.init()

var bananas:[Fruit] = [
    Fruit.init(weight: 110, type: "banana"),
    Fruit.init(weight: 110, type: "banana"),
    Fruit.init(weight: 120, type: "banana"),
    Fruit.init(weight: 90, type: "banana")
]

var apples:[Fruit] = [
    Fruit.init(weight: 110, type: "apple"),
    Fruit.init(weight: 150, type: "apple"),
    Fruit.init(weight: 180, type: "apple"),
    Fruit.init(weight: 120, type: "apple")
]

var oranges:[Fruit] = [
    Fruit.init(weight: 150, type: "orange"),
    Fruit.init(weight: 170, type: "orange"),
    Fruit.init(weight: 140, type: "orange"),
    Fruit.init(weight: 130, type: "orange")
]

ggr.addFruit(content: bananas, price: 0.5)
ggr.addFruit(content: apples, price: 0.5)
ggr.addFruit(content: oranges, price: 0.5)

print("\tQuesto è il valore totale della merce in negozio: \(ggr.totalValue())€")
print("\t\(ggr.countFruitTypes())")

if let a = ggr.sellFruit(id: 2) {
    print("\tIl frutto eliminato è --> \(a.toString()) <--")
}



