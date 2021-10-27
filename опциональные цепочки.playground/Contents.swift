import Foundation
//
//Сегодня будем строить свою небольшую социальную сеть.
//1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
//Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
//Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд
class Human{
    var name:String
    var father:Man?
    var mother:Woman?
    var sister:[Woman?]?
    var brother:[Man?]?
    var cat:[Cat?]?
    var dog:[Dog?]?
    func initParants(father:Man?, mother:Woman?, sister:[Woman?], brother:[Man?],cat:[Cat?],dog:[Dog?]){
        self.father = father
        self.mother = mother
        self.sister = sister
        self.brother = brother
        self.cat = cat
        self.dog = dog
    }
    
    init(name:String){
        self.name = name
    }
}
class Man: Human{
    func hello(){
        print("\(self.name) - двигает диван!")
    }
}
class Woman:Human{
    func hello(){
        print("\(self.name) - убирается!")
    }
}
class Pets{
    var name:String
    init(name:String){
        self.name = name
    }
    func voice(){
        print("\(self.name) voice")
    }
}
class Dog:Pets{
    override func voice(){
        print("\(self.name) - gav")
    }
}
class Cat:Pets{
    override func voice(){
        print("\(self.name) - meow")
    }
}
var me = Man(name: "Nick")
var father = Man(name: "Igor")
var mother = Woman(name: "Tanya")
var sister  = Woman(name: "Alina")
var brother = Man(name: "Ilya")
var cat = Cat(name: "Felix")
var dog  = Dog(name: "Sharik")
var grandMotherMother = Woman(name: "Vera")
var grandMotherFather = Woman(name: "Lyda")
var grandFatherMother = Man(name: "Kolya")
var grandFatherFather = Man(name: "Vasia")
var uncleMother = Man(name: "Andrey")
var uncleFather = Man(name: "Sasha")
var auntMother = Woman(name: "Natasha")
var auntFather = Woman(name: "Lena")



me.initParants(father: father, mother: mother, sister: [sister], brother: [brother], cat: [cat], dog: [dog])
father.initParants(father: grandFatherFather, mother: grandMotherFather, sister: [auntFather], brother: [uncleFather], cat: [cat], dog: [dog])
mother.initParants(father: grandFatherMother, mother: grandMotherMother, sister: [auntMother], brother: [uncleMother], cat: [cat], dog: [dog])

var family:[Human] = [me,father,mother,sister,grandMotherMother,grandMotherFather,grandFatherFather,grandFatherFather,uncleMother,uncleFather,auntMother,auntFather]
var manCount = 0
var womanCount = 0

for i in family{
    if let a = i as? Man{
        manCount += 1
        a.hello()
    }else if let b = i as? Woman{
        womanCount += 1
        b.hello()
    }
}
print(manCount,womanCount)

func countFamily(person:Human){
    var uncle = 0
    var aunt = 0
    var cousinMan = 0
    var cousinWoman = 0
    
    
    
    if person.father?.brother != nil{
        uncle += person.father!.brother!.count
        for uncles in person.father!.brother!{
            for cousin in family{
                if uncles === cousin.father{
                    if cousin is Man{
                        cousinMan += 1
                    }else if cousin is Woman{
                        cousinWoman += 1
                    }
                }
            }
        }
    }
    if person.father?.sister != nil{
        aunt += person.father!.sister!.count
        for aunts in person.father!.sister!{
            for cousin in family{
                if aunts === cousin.father{
                    if cousin is Man{
                        cousinMan += 1
                    }else if cousin is Woman{
                        cousinWoman += 1
                    }
                }
            }
        }
    }
    if person.mother?.brother != nil{
        uncle += person.mother!.brother!.count
        for uncles in person.mother!.brother!{
            for cousin in family{
                if uncles === cousin.mother{
                    if cousin is Man{
                        cousinMan += 1
                    }else if cousin is Woman{
                        cousinWoman += 1
                    }
                }
            }
        }
    }
    if person.mother?.sister != nil{
        aunt += person.mother!.brother!.count
        for aunt in person.mother!.brother!{
            for cousin in family{
                if aunt === cousin.mother{
                    if cousin is Man{
                        cousinMan += 1
                    }else if cousin is Woman{
                        cousinWoman += 1
                    }
                }
            }
        }
    }
    print("\(uncle) - количество дядь, \(aunt) - количесво теть,\(cousinMan) - количество сестер отца,\(cousinWoman) - количевто сестер матери")
    
}

print(countFamily(person: me))

var petCount:[Pets] = []
for i in family{
    if i.cat != nil && i.dog != nil{
        for pet in i.cat!{
            pet?.voice()
            petCount.append(pet!)
            for petD in i.dog! {
                petD?.voice()
                petCount.append(petD!)
            }
        }
    }
}
print(petCount.count)
//2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
//У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
//Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
//3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
//Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
//Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
//Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
//
//Обязательно используем в заданиях Optional chaining и Type casting
