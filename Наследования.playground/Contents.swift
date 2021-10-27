import Foundation

//1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
//Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"
//
class Artist{
    var name:String = ""
    var surname:String = ""
   
    func perfomance()->String{
        return ""
    }
}
class Dancer:Artist{
    override func perfomance() -> String {
        return "Dancing"
    }
}
class Singer:Artist{
    override func perfomance() -> String {
        return "Sings"
    }
}
class Painter:Artist{
    override func perfomance() -> String {
        return "Draws"
    }
}
var dancer = Dancer()
var singer = Singer()
var painter = Painter()

var array = [dancer,singer,painter]
for i in array{
    print(i.perfomance())
}
//2. Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок).
//Используем полиморфизм
//

class Machine{
    var speed:Int{
        return 100
    }
    var place:Int{
        return 100
    }
    var price:Int{
        return 1000
    }
    func sum(one:Machine) -> Int {
        return  price * (speed / (place * 2 / place))
    }
}

class Airplane:Machine{
 
    override var speed: Int{
        return 1500
    }
    override var place:Int{
        return 150
    }
    override var price:Int{
        return 10000
    }
}
class Ship:Machine{
 
    override var speed: Int{
        return 50
    }
    override var place:Int{
        return 1500
    }
    override var price:Int{
        return 1500
    }
}
var ship = Ship()
var airplane = Airplane()
print(ship.sum(one: ship))
print(airplane.sum(one: airplane))

//3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
//- Создайте по пару объектов каждого класса.
//- Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
//- Сколько четвероногих?
//- Сколько здесь животных?
//- Сколько живых существ?
class LivesCreatures{
    var live:Bool = false
    var tetrapods:Bool = false
    var animal:Bool = false
    var repening:Bool = false
    
}
class People:LivesCreatures{
    
}
class Crocodile:LivesCreatures{
    
}
class Dogs:LivesCreatures{
    
}

var people = People()
people.live = true
people.tetrapods = true
people.animal = true
people.repening = false

var crocodile = Crocodile()
crocodile.live = true
crocodile.tetrapods = true
crocodile.animal = false
crocodile.repening = true

var dogs = Dogs()
dogs.live = true
dogs.tetrapods = true
dogs.animal = true
dogs.repening = false

var array1 = [people,crocodile,dogs]
var a = 0
for i in array1{
    
    if i.live == true{
        a += 1
    }else{
        0
    }
}
var b = 0
for i in array1{
    
    if i.tetrapods == true{
        b += 1
    }else{
        0
    }
}
var c = 0
for i in array1{
    
    if i.animal == true{
        c += 1
    }else{
        0
    }
}
print(a,b,c)
