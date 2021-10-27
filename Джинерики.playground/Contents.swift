import Foundation
import UIKit
//
//3) Создать любой generic для классов, структур, методов, перечислений( по 1 на каждый).
//
class Generic<T>{
    
    func printArray<T>(a:[T]){
        var array:[Any] = []
        array.append(a)
    }
}
var array:[Any] = ["aaa",212,12.3,"bbb"]

func printArray1<T>(a:[T]){
    array.removeAll()
    for i in a{
        array.insert(i, at: 0)
    }
}

printArray1(a: array)
print(array)

//4) Написать функцию, которая принимает Generic объект и складывает в массив/словарь(на выбор)
//
//5) Создать класс, который сортирует массивы значений(на ваш выбор) 3 разными способами.
//Для шпаргалки смотрим обсуждение: "РЕАЛИЗАЦИЯ АЛГОРИТМОВ НА ЯЗЫКЕ SWIFT 3"
//

var array1 = [12,4,124,325,1,42,6,634,3,1,4,4,1,2435,34,6,346,3,43,52]

var arrayCount = array1.count

var arrayMutable = NSMutableArray(array: array1)

var arrayElem = 0


//var a = 0
//repeat{
//    for i in 1...arrayCount{
//        if (arrayMutable[i - 1] as! Int) > (arrayMutable[i] as! Int){
//            arrayMutable.exchangeObject(at: i, withObjectAt: i - 1)
//            a = i
//            arrayElem += 1
//        }
//        arrayCount = arrayElem
//    }
//} while arrayCount != 0
//
//print(array1)


func fibonachi(int:Int)->Int{
    var a = int
    a -= 1
    if int == 0 {
        return 0
    }else if int == 1{
        return 1
    }
    return fibonachi(int: (int - 1)) + fibonachi(int: (int - 2))
}

print(fibonachi(int: 9))


//6) Написать класс на свой вкус(любые методы, проперти) универсального типа. Используя extension, расширить класс, добавить сабскрипт. (потренируйтесь)
class Chessman{
    enum FiguresChess {
        case king
        case castle
        case bishop
        case pown
        case knight
        case queen
    }
    
    enum Color:String {
        case black = "⬛"
        case white = "⬜"
    }
    
    var typeFigures:FiguresChess
    var color:Color
    var coordinates: (String,Int)? = nil
    var figureSimbol:Character
    
    init(typeFigures:FiguresChess,color:Color, symbol:Character){
        self.typeFigures = typeFigures
        self.color = color
        self.figureSimbol = symbol
    }
    init(typeFigures:FiguresChess,color:Color, symbol:Character, coordinates:(String,Int)){
        self.typeFigures = typeFigures
        self.color = color
        self.figureSimbol = symbol
        setCoordinates(char:coordinates.0,num:coordinates.1)
    }
    
    func setCoordinates(char c :String, num b:Int){
        coordinates = (c,b)
    }
    func kill (){
        coordinates = nil
    }
    
}



class GameDesk{
    var desk:[Int:[String:Chessman]] = [:]
    init(){
        for i in 1...8{
            desk[i] = [:]
        }
    }
    
    func setChessman(chess:Chessman,coordinate:(String,Int)){
        let colRange = 1...8
        let lowRange = "A"..."Z"
        if (colRange.contains(coordinate.1)) && lowRange.contains(coordinate.0){
            self.desk[coordinate.1]![coordinate.0] = chess
            chess.setCoordinates(char: coordinate.0, num: coordinate.1)
        } else {
            print("Coordinate nil")
        }
    }
    
    
    
    
    
}
extension GameDesk{
    subscript (alpha:String, number:Int)->Chessman?{
        get{
            return self.desk[number]![alpha]
        }
        set {
            if let chessman = newValue{
                self.setChessman(chess: chessman, coordinate: (alpha,number))
                
            }else{
                self.desk[number]![alpha] = nil
            }
        }
    }
}
var game = GameDesk()

var gameFig = Chessman(typeFigures: .queen, color: .black, symbol: "A", coordinates: ("C",5))

game.setChessman(chess:gameFig , coordinate: gameFig.coordinates ?? ("nil",0))
game["C",5] = gameFig
print(game["C",5])


extension Int{
    subscript(index:Int)->Int{
        var base = 1
        var a = index
        
        while a > 0{
            base *= 10
            a -= 1
        }
        return (self/base)%10
    }
}
var a = 1221

a[2]
