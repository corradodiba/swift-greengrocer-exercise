class Fruit {
    static var id = 0;
    var name: String;
    var weight: Float; // grams
    var price: Float; // cents
    var id: Int;
    
    init(name: String, weight: Float, price: Float) {
        Fruit.id = Fruit.id + 1;
        self.id = Fruit.id;
        self.name = name;
        self.weight = weight;
        self.price = price;
    }
}

var banana = Fruit.init(name: "banana", weight: 100, price: 0.2);
var mela = Fruit.init(name: "mela", weight: 90, price: 0.5);


class Greengrocer {
//    func countFruitByCategory(category: string) -> [Fruit] {
//        
//    }
}

