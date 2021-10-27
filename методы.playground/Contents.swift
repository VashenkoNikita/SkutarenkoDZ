import Foundation
//
//1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
//
//2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
//Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
//

//3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
//
//4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
//
//5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)

let image = ["⬜","😈","❌","⬛", "🎁"]

enum Moving{
    case up, down, right, left
}

struct EndPoint{
    var img = image[2]
    var x,y:Int
    
    init(x:Int, y:Int){
        self.x = x
        self.y = y
    }
}
struct Box{
    var img = image[4]
    var x:Int{
        didSet{
            if self.x < 1 || self.x >= room.Widht {
                self.x = oldValue
            }
        }
    }
    var y:Int{
        didSet{
            if self.y < 1 || self.y >= room.Hight {
                self.y = oldValue
            }
        }
    }
   

}
struct Room{
    var Widht:Int
    var Hight:Int
   
    init(Widht:Int, Hight:Int){
        self.Widht = Widht
        self.Hight = Hight
    }
}
var room = Room(Widht: 10, Hight: 10)
var box = Box(x: 5, y: 4)
var endPoint = EndPoint(x: 5, y: 3)
let victory = "You win"
struct Player{
    let img = image[1]
    var x:Int{
        didSet{
            if self.x < 1 || self.x >= room.Widht {
                self.x = oldValue
            }
        }
    }
    var y:Int{
        didSet{
            if self.y < 1 || self.y >= room.Hight {
                self.y = oldValue
            }
        }
    }
    init(x:Int,y:Int){
        self.x = x
        self.y = y
    }
    mutating func move(position:Moving){
        func checkBox()->Bool{return self.x == box.x && self.y == box.y}
        func checkEnd()->Bool{if box.x == endPoint.x && box.y == endPoint.y{
            box.img == endPoint.img
        }
        return true
        }
        switch position {
        case .up: self.y += 1 ; if checkBox(){box.y += 1};if checkBox(){self.y += 1}; if checkEnd(){print(victory)}
        case .down: self.y -= 1 ; if checkBox(){box.y -= 1};if checkBox(){self.y -= 1}; if checkEnd(){print(victory)}
        case .right: self.x += 1 ; if checkBox(){box.x += 1};if checkBox(){self.x += 1}; if checkEnd(){print(victory)}
        case .left: self.x -= 1 ; if checkBox(){box.x -= 1};if checkBox(){self.x -= 1}; if checkEnd(){print(victory)}
        }
    }
    mutating func playerPosition(position:Moving){
       
        switch position {
        case .down : x += 1
        case .up : x -= 1
        case .right : y += 1
        case .left : y -= 1
        }
    }
}
func game(_ player:Player, _ box:Box, _ endGame:EndPoint)->String{
    var map = ""
    for i in 0...room.Hight{
        for j in 0...room.Widht{
            switch (i,j) {
            case let(w,h) where w == player.x && h == player.y:map += player.img
            case let(w,h) where w == box.x && h == box.y:map += box.img
            case let(w,h) where w == endGame.x && h == endGame.y:map += endGame.img
            case let(w,h) where w == 0 || h == 0 || h == room.Hight || w == room.Widht: map += image[3]
            default: map += image[0]
            }
        }
        map += "\n"
    }
    return map
}

var player = Player(x: 5, y: 5)


player.playerPosition(position: .down)
player.playerPosition(position: .up)
player.playerPosition(position: .left)
player.playerPosition(position: .left)

var g = game(player, box, endPoint)
print(g)





//Шахматная доска (Легкий уровень)
//
//1. Создайте тип шахматная доска.
//
//2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
//
//3. Если юзер ошибся координатами - выдавайте нил
//

struct Chess{
    enum Color:String{
        case color1 = "⬛"
        case color2 = "⬜"
    }
    static var dict = ["A": 1,"B":2, "C":3,"D":4,"E":5, "F":6,"G":7,"H":8]
    subscript(colomn:String, row:Int)->String?{
        var map:String?
        if Chess.dict[colomn.capitalized] != nil && row <= Chess.dict.count{
            map = Chess.dict[colomn.capitalized] ?? 0 % 2 == row % 2 ? Color.color1.rawValue : Color.color2.rawValue
        }else {
            return ""
        }
        return map
    }
        
}

var chess = Chess.init()
print(chess["A",5]!)
print(chess["C",5]!)
print(chess["A",6]!)

//Крестики нолики (Средний уровень)
//
//1. Создать тип, представляющий собой поле для игры в крестики нолики
//На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
//Добавьте возможность красиво распечатывать поле
//
//2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
//причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
//
//3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
//
//4. Если хотите, добавте алгоритм, который вычислит победителя
//

//Морской бой (Тяжелый уровень)
//
//1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит
//
//2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник :)
//
//3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран :)
