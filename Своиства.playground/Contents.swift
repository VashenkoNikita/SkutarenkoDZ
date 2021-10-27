import Foundation
//1. Повторить код Алексея из урока по памяти.
//2. Для этого же студента добавить свойства:
//-дата рождения (используя другую структуру)
//-возраст (вычисляется на основании даты рождения)
//-количество лет учебы (начиная с 6 лет, либо 0 если возраст меньше чем 6)


struct Students{
    var name:String
    var surname:String
    var nowYear:Int
    var date:DateOfBirthday
    var howGoToSchool = 6
    
    struct DateOfBirthday {
        var day:Int
        var month:Int
        var year:Int
    }
    var age:Int{
        return nowYear - date.year
    }
    var countYearLearn:Int{
        if age >= howGoToSchool{
            return age - howGoToSchool
        }else {
            return 0
        }
    }
}
//3. Создать структуру "отрезок", у которой два свойства - точка "А" и точка "В", которые в свою очередь тоже структуры (не стандартные, а наши собственные)
//Также отрезок имеет вычисляемые свойства (они изменяют точки "А" и "В", если мы изменяем следующие свойства):
//-midPoint - середина отрезка (при её изменении, отрезок смещается на параллельную прямую, проходящую через наш midPoint?)
//-длина отрезка (при изменении, точка "А" остается, а точка "В" движется)

struct Section{
    struct Point {
        var x:Double
        var y:Double
    }
    var A:Point
    var B:Point
    
    var midPoint:Point{
        get {
            return Point(x: (A.x + B.x)/2, y: (A.y + B.y)/2)
        }
        set{
            let deftvalue = newValue.x - midPoint.x
            let deftvalue1 = newValue.y - midPoint.y
            A.x += deftvalue
            B.x += deftvalue
            A.y += deftvalue
            B.y += deftvalue
        }
    }
    var leight:Double{
        get {
            return sqrt(pow((B.x - A.x), 2) + pow((B.y - A.y), 2))
        }
        set{
            B.x = A.x + newValue * (B.x - A.x)/leight
            B.y = A.y + newValue * (B.y - A.y)/leight
        }
        
    }
}
var a = Section(A: .init(x: 512124.124, y: 12412.412), B: .init(x: 14346.643, y: 523.5235))
print(a.midPoint)
print(a.leight)



class StepCounter {
    var totalSteps: Int{
        didSet {
            if totalSteps > oldValue  {
                print("Добавлено \(totalSteps - oldValue) шагов")
            }
        }
    }
    init (totalSteps:Int){
        self.totalSteps = totalSteps
    }
}
var b = StepCounter(totalSteps: 500)
print(b.totalSteps)
b.totalSteps = 1000
print(b.totalSteps)


class Account{
     
    var capital: Double = 0 // сумма вклада
    var rate: Double = 0.01 // процентная ставки
     
    var profit: Double{
         
        get{
            print("Get")
            return capital + capital * rate
        }
        set(newProfit){
             print("Set")
            self.capital = newProfit / (1 + rate)
        }
    }
     
    init(capital: Double, rate: Double){
         
        self.capital = capital
        self.rate = rate
    }
}

var wad = Account(capital: 100, rate: 0.021)
print(wad.profit)
wad.capital = 1000
print(wad.profit)
