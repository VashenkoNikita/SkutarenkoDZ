import Foundation

//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
//
enum Color:String{
    case White = "\u{25A0}"
    case Black = "\u{25A1}"
}

enum Cheess{
    case Pawn(color:Color, wordPosition:Character, numberPosition:Int)
    case Rook(color:Color, wordPosition:Character, numberPosition:Int)
    case Knight(color:Color, wordPosition:Character, numberPosition:Int)
    case Bishop(color:Color, wordPosition:Character, numberPosition:Int)
    case Queen(color:Color, wordPosition:Character, numberPosition:Int)
    case King(color:Color, wordPosition:Character, numberPosition:Int)
}

let queenWhite = Cheess.Queen(color: Color.White, wordPosition: "A", numberPosition: 8)
let bishopWhite = Cheess.Bishop(color: Color.White, wordPosition: "B", numberPosition: 7)
let kingWhite = Cheess.King(color: Color.White, wordPosition: "C", numberPosition: 5)
let kingBlack = Cheess.King(color: Color.Black, wordPosition: "F", numberPosition: 8)

let masFigures = [queenWhite,bishopWhite,kingWhite,kingBlack]


//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
//

enum CheessName:String{
    case Pawn = "Pawn"
    case Rook = "Rook"
    case Knight = "Knight"
    case Bishop = "Bishop"
    case Queen = "Queen"
    case King = "King"
}

func nameFigurePrint(cheess:Cheess){
    switch cheess {
        case .Pawn(let color, let wordPosition, let numberPosition):
            print("\(CheessName.Pawn.rawValue), \(color.rawValue),\(wordPosition) - \(numberPosition) ")
        case .Rook(let color, let wordPosition, let numberPosition):
            print("\(CheessName.Rook.rawValue), \(color.rawValue),\(wordPosition) - \(numberPosition) ")
        case .Knight(let color, let wordPosition, let numberPosition):
            print("\(CheessName.Knight.rawValue), \(color.rawValue),\(wordPosition) - \(numberPosition) ")
        case .Bishop(let color, let wordPosition, let numberPosition):
            print("\(CheessName.Bishop.rawValue), \(color.rawValue),\(wordPosition) - \(numberPosition) ")
        case .Queen(let color, let wordPosition, let numberPosition):
            print("\(CheessName.Queen.rawValue), \(color.rawValue),\(wordPosition) - \(numberPosition) ")
        case .King(let color, let wordPosition, let numberPosition):
            print("\(CheessName.King.rawValue), \(color.rawValue),\(wordPosition) - \(numberPosition) ")
        default:break
    }

}
func masCheess(masCh:[Cheess]){
    for i in masCh{
        nameFigurePrint(cheess: i)
    }
}
masCheess(masCh: masFigures)

//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
//

func arrayDesk(someValue:[Cheess]){
    var a = 0
    var b = 0

    var letters = ["A": 0, "B": 1, "C":2, "D":3, "E":4, "F":5, "G":6,"H":7]



    for (key, value) in letters {
        print(key)
        for i in 0..<8{
            for j in 0..<8{
                if j % 2 == i % 2{
                    print("\u{25A0}")
                }else {
                    print("\u{25A1}")
                }
            }
        }
    }

}

arrayDesk(someValue: masFigures)



//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.



var massive = [1,124,12,1,4,24,4,21,4,23,6,83,2,7,86,9]

func sortMassiveInt(mas:[Int])->[Int]{
    var massive1:[Int] = []
    for i in massive{
        for j in massive{
            if i < j{
                massive1.append(i)
            }
        }
    }
    return massive1
}
print(sortMassiveInt(mas: massive))



