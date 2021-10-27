import Foundation
//1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями
//

protocol Food {
    var name : String {get}
    func taste()
}
protocol Storable {
    var depravity:Bool{get}
    var daysToExpire:Int {get}
}
//2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов
//
class Bakeries:Storable,Food {
    var depravity: Bool = false
    
    var daysToExpire: Int = 15
    
    var name: String = ""
    func taste() {
         print("От \(name)а откусил кусок")
    }
    
    
}

class Fruits : Storable,Food{
    var daysToExpire: Int = 30
    
    var depravity: Bool = false
    
    var name: String = ""
    
    func taste() {
         print("От \(name)а откусил кусок")
    }
    
    
}

class Meat:Storable,Food{
    var daysToExpire: Int = 10
    
    var depravity: Bool = false
    
    var name: String = ""
    
    func taste() {
         print("От \(name)а откусил кусок")
    }
    
    
}

let meat1 = Meat()
meat1.name = "Говядина"
let meat2 = Meat()
meat2.name = "Свинина"
let fruit1 = Fruits()
fruit1.name = "Яблоко"
let fruit2 = Fruits()
fruit2.name = "Груша"
let bred1 = Bakeries()
bred1.name = "Хлеб"
let bred2 = Bakeries()
bred2.name = "Батон"

let arrayFood:[Food] = [meat1,meat2,fruit1,fruit2,bred1,bred2]

//3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника
//
var fridge:[Storable & Food] = []

for i in arrayFood{
    print(i.name)
    i.taste()
    if let foodFridge = i as? Storable & Food{
        if foodFridge.depravity == false{
            fridge.append(foodFridge)
            print("\(i.name) - этот продукт еще не испортился")
        }else if foodFridge.depravity == true{
            print("\(i.name) - испорчен")
        }
    }else {
        print("\(i.name) - не портится")
    }
}

for j in fridge{
    print(j.name)
}
//4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
//

func sortFood(array:inout [Storable & Food]) {
    let sortedArray = array.sorted(by: {a, b in
        if a.daysToExpire == b.daysToExpire {
            return a.name < b.name
        }else {
            return a.daysToExpire < b.daysToExpire
        }
    } )
    array = sortedArray
    var a = 0
    for value in array{
        a += 1
        print("\(value.name) - \(a)" )
    }
}
print(sortFood(array: &fridge))
//5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.

//Новичек

// 1. Почитать о том, что такое стек и очередь.
// 2. Используя протокол из прикрепленного фото, сделать расширение "Container" для класса "Array" таким образом, чтобы массивом можно было управлять как стеком. Небольшая подсказка, указывать в качестве типа данных вместо Self.Generator.Element нужно просто Element.
//Студент

// 3. Создать расширение протокола "Container", которое позволит управлять массивом, как очередью. О том, какие у очереди должны быть методы и свойства - почитайте в интернете.
// 4. Разберитесь, почему код не работает и какой тип данных необходимо использовать для того, чтобы все заработало.
// 5. Еще одной задачей для усложнения, окажется то, что изначально все работать не будет и вам придется разобраться какое наследование и полиморфизм нужно организовать в нашем проекте для того, чтобы это все заработало. Сделать это можно, изучив структуру наследования класса Array и того, какие протоколы он использует.

protocol Container: Collection{
    mutating func pop ()-> Self.Iterator.Element
    mutating func push(element:Self.Iterator.Element)
    func peek() -> Self.Iterator.Element?
    
    mutating func dequeue ()-> Self.Iterator.Element?
    mutating func enqueue(element:Self.Iterator.Element)
    
}

extension Array:Container {
    mutating func dequeue() -> Element? {
        if self.isEmpty {
            return nil
        } else {
            let tempElemnt = self.removeLast()
            return tempElemnt
        }
    }
    
    mutating func enqueue(element: Element) {
        self.append(element)
    }
    
    
    mutating func pop() -> Element {
        let a = popLast()
        return a!
    }
    
    mutating func push(element: Element) {
        self.append(element)
    }
    
    func peek() -> Element? {
        return self.last ?? nil
    }
    
    
}

//Мастер

// 6. Создать протокол "CustomDictionary" который будет копировать базовый функционал обычного "Dictionary"
// 7. Создать еще одно расширение класса "Array" и назначить ему поддержку этого протокола и организовать работу всех функций.


//
//
//protocol CustomDictionary:Collection{
//    var dict:[Any] {get set}
//    subscript (key: Any) ->Self.Iterator.Element {mutating get set}
//}
//extension Array:CustomDictionary{
//    subscript(key: Any) -> Element {
//        mutating get {
//            var index:Int?
//            for i in 0..<dict.count{
//                if dict[i] == key{
//                    index = i
//                }
//            }
//        }
//        set {
//            <#code#>
//        }
//    }
//
//    var dict: [Any] {
//        get{
//            return self.dict
//        }
//        set{
//            self.dict = newValue
//        }
//    }
//
//}
// Звезда - это уже будет тяжело.
// 8. Разделите простокол Conteiner на три наследованных от него протокола Stack и Queue, CustomDictionary. Общие методы оставьте в контейнере, если они есть, остальной функционал разделите между ними
// 9. Вместо расширения структуры "Array" создайте три структуры - наследника от структуры "Array", каждая из них будет поддерживать разные протоколы (Stack, Queue, CustomDictionary). Тут вам придется серьезно разбираться в cтруктуре самого класса Array и того, какую структуру наследования протоколов нужно выстроить для полноценной работы этого проекта.

// Профи

// 10. Если вы дшли до этого момента, то пора расширить протокол и класс CustomDictionary для обеспечения полноценной работы словаря.
// 11. Сделайте обязательный инициализатор для "CustomDictionary"
// 12. Для проверки ввсего функционала воспользуйесь всеми функциями и структурами, которые сделали в этом ДЗ.
// 13. Создайте тип данных, который будет содержать коллекцию полученных нами протоколов.
// 14. Соберите несколько экземпляров полученных нами структур в один большой массив используя тип данных из задания 13, в цикле выполняйте действия по удалению и добавлению объектов в них, в процессе цикла нужно будет проверять объекты на соответствия тем или иным протоколам и выполнять для них соответствующие функции.
