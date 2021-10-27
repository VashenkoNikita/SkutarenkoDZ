import Foundation

//1. Создать структуру “Описание файла” содержащую свойства:
//- путь к файлу
//- имя файла
//- максимальный размер файла на диске
//- путь к папке, содержащей этот файл
//- тип файла (скрытый или нет)
//- содержимое файла (можно просто симулировать контент)
//Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
//
struct FileDescription{
    static var maxSizeFile = 500
    
    var pathFile:String
    
    var nameFile:String
    
    var size:Int{
        didSet{
            if size >= FileDescription.maxSizeFile{
                return size = oldValue
            }
        }
    }
    
    var pathFolderFile:String{
        get{
            return pathFile + "/" + nameFile
        }
    }
    
    var typeFile:String
    
    lazy var contentFile = "Music"
    
}
var file = FileDescription(pathFile: "My computer", nameFile: "My music", size: 400, typeFile: "Mp4", contentFile: "Music")

print(file.pathFolderFile)
print(file.contentFile)
print(file.size)
file.size = 600
print(file.size)
//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
//
enum color:Int{
    case red = 43
    case green = 120
    case blue = 255
    static var lastColor:Int{
        return color.red.rawValue
    }
    static var firstColor:Int{
        return color.blue.rawValue
    }
    static var numberColor = 3
}
var a = color.lastColor
print(a)
//3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
//- минимальный и максимальный возраст каждого объекта
//- минимальную и максимальную длину имени и фамилии
//- минимально возможный рост и вес
//- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса

var studentCount = 0

class Human{
    var name:String
    var surName:String
    var age:Int{
        didSet{
            if age >= Human.maxAge || age < Human.minAge{
                return age = oldValue
            }
        }
        
    }
    var hight:Double{
        didSet{
            if hight >= Human.maxHight || hight < Human.minHight{
                return hight = oldValue
            }
        }
        
    }
    var weight:Double{
        didSet{
            if weight >= Human.maxWeight || weight < Human.minWeight{
                return weight = oldValue
            }
        }
        
    }
    
    init(name:String, surName:String, age:Int, hight:Double, weight:Double){
        self.name = name
        self.surName = surName
        self.age = age
        self.hight = hight
        self.weight = weight
        
        studentCount += 1
    }
    
    
    class var maxAge:Int {return 100}
    class var minAge:Int {return 10}
    class var maxHight:Double {return 220.0}
    class var minHight:Double {return 100.0}
    class var maxWeight:Double {return 150.0}
    class var minWeight:Double {return 50.0}
    
}
var f = Human(name: "Vasya", surName: "Petrov", age: 89, hight: 150.0, weight: 100.0)
print(f.age)

f.age = 150
print(f.age)
var f1 = Human(name: "Vasya", surName: "Petrov", age: 89, hight: 150.0, weight: 100.0)
var f2 = Human(name: "Vasya", surName: "Petrov", age: 89, hight: 150.0, weight: 100.0)
print(studentCount)
