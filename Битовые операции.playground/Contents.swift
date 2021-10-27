import Foundation

//1. Расширьте енум из урока и добавьте в него метод, помогающий установить соответствующий бит в переданную маску и метод, помогающий его прочитать. Эти методы должны принимать и возвращать маску, либо принимать адрес маски и менять его
//
extension UInt8{
    func binary()->String{
        var result = ""
        for i in 0..<8{
            let mask = 1 << i
            let set = Int(self) & mask != 0
            
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

enum ChechkList : UInt8{
    case Bread = 0b00000001
    case Chess = 0b00000010
    case Chicken = 0b00000100
    case Fich = 0b00001000
}

extension ChechkList{
    func addMask(num : inout UInt8) -> String{
        var result = self.rawValue | num
        return result.binary()
       
    }
    func sellTrueOrFalse(num: UInt8) -> String{
        if (num & self.rawValue) != 0{
            return "Входит"
        }else {
            return "Не входит"
        }
        
    }
}
var checkListSell:UInt8 = 0b00000001


print(ChechkList.Bread.sellTrueOrFalse(num: checkListSell))

print(ChechkList.Chicken.addMask(num: &checkListSell))


//2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида
//

func line(diap:Int){
    var i = 1
    var a: UInt8 = 0b00000001
    for _ in 1...diap{
        a <<= i
        print(a.binary())
        if a == 128{ i = -1 }
        if a == 1{ i = 1 }
        
    }
}

line(diap: 10)
//3. Создайте 64х битное число, которое представляет клетки на шахматной доске. Установите биты так, что 0 - это белое поле, а 1 - черное. Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4). Выбирая клетки но индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита

class Hui{
    var board:Int64 = 0b01010101_01010101_01010101_01010101_01010101_01010101_01010101_01010101

    enum Alf :Int64{
        case a = 1
        case b
        case c
        case d
        case e
        case f
        case g
        case h
    }

    func formula(_ alf:Alf,_ int:Int64) -> Int64{
        guard  int < 9 else {
            return 0
        }
        return 1 << (alf.rawValue * 8 + int - 1)

    }
    func form1(_ alf:Alf,_ int:Int64) -> String{
        return ((board & formula(alf, int)) > 0) ? "⬛" : "⬜"
    }
   
}
var a = Hui()
a.form1(.b, 3)
