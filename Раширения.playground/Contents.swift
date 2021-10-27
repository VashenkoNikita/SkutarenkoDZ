import Foundation

//    1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
//
//    2. Добавьте проперти, которое возвращает количество символов в числе
//
//    3. Добавьте сабскрипт, который возвращает символ числа по индексу:
//
//    let a = 8245
//
//    a[1] // 4
//    a[3] // 8
//
//    Профи могут определить и сеттер :)
//
//    4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
//
//    5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
//
//    let s = "Hi hi hi"
//
//    s.truncate(4) // Hi h...
//
//    s.truncate(10) // Hi hi hi


extension Int{
    var isNegative:Bool{
        return self > 0
    }
    var isPositive:Bool{
        return !isNegative
    }
    
    var lenght:Int{
        return String(self).count
    }
    
    subscript(_ index:Int)->Int{
        var a = 1
        for _ in 0..<index{
            a *= 10
        }
        return (self/a) % 10
    }
}
var a = 41214213

a[5]


extension String{
    subscript(num:CountableRange<Int>)->String{
        get{
            let start = index(startIndex, offsetBy: num.lowerBound)
            let end = index(startIndex, offsetBy: num.upperBound)
            
            let range = start..<end
            
            return String(self[range])
        }
        set{
            let start  = self[..<index(startIndex, offsetBy: num.lowerBound)]
            let end = self[index(startIndex, offsetBy: num.upperBound)...]
            
            self =  String(start) + newValue + String(end)
        }
    }
    func truncate(_ first:Int) -> String{
        if first < self.count{
            return self[0..<first] + "..."
        }else {
            return self
        }
    }
}
var b = "Привет, как дела?"
b[0..<6]
b[0..<6] = "Hello"
b
print(b)


var c = "Hi hi hi"

print(c.truncate(5))


