import Foundation

//1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=
//


var a1 = Point(x: 2, y: 2)
var a2 = Point(x: 3, y: 3)

func - (a:Point,b:Point)->Point{
    return Point(x: (a.x - b.x), y: (a.y - b.y))
}

print(a1 - a2)

func / ( a:inout Point,b:Point) -> Point{
    return Point(x: a.x / b.x, y: a.y / b.y)
    
}

print(a1 / a2)


func -= ( a:inout Point,b:Point){
    a = a - b
}


func *= (a:inout Point, b:Point){
    a *= b
}


prefix func -- (a: inout Point)->Point{
    a.x -= 1
    a.y -= 1
    return a
        
}


postfix func -- (a: inout Point) -> Point{
    let b = a
    --a
    return b
}



//2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.
//
struct Point{
    var x:Int
    var y:Int
}
struct Size{
    var widht:Int
    var hight:Int
}

struct Rect{
    var point:Point
    var size:Size
    init(x:Int,y:Int,w:Int,h:Int){
        self.point = Point(x: x, y: y)
        self.size = Size(widht: w, hight: h)
    }
}

func + (a:Rect,b:Rect)->Int{
    let resultA = a.point
    let resultB = b.size
    var sum = (resultB.hight - resultA.y) + (resultB.widht - resultA.x)
    return sum
}

var rect1 = Rect(x: 200, y: 200, w: 200, h: 200)
var rect2 = Rect(x: 100, y: 100, w: 100, h: 100)

print(rect1 + rect2)

func - (a:Rect,b:Rect)->Int{
    let resultA = a.point
    let resultB = b.size
    var sum = (resultB.hight - resultA.y) - (resultB.widht - resultA.x)
    return sum
}

print(rect1 - rect2)


func += (a: inout Rect,b:Rect)->Int{
    let resultA = a.point
    let resultB = b.size
    var point = (resultA.x + resultA.y)
    let size = (resultB.hight + resultB.widht)
    point += size
    return point
}
func -= (a: inout Rect,b:Rect)->Int{
    let resultA = a.point
    let resultB = b.size
    var point = (resultA.x + resultA.y)
    let size = (resultB.hight + resultB.widht)
    point -= size
    return point
}

print(rect1 += rect2)
print(rect1 -= rect2)

//3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int
//

func + (a:String, b:Int)-> String{
    let reslt = a + String(b)
    return reslt
}
//4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы

infix operator %%%

func %%% (a: inout String, b:String)->String{
  
    var resl = a
    a = ""
    
    for i in resl{
        for j in b{
            if i.lowercased() == j.lowercased(){
                resl = i.uppercased()
                break
            }else {
                resl = String(i)
            }
        }
        a.append(resl)
        
    }
    return a
}

var first = "sasha"
var second = "sa"
first %%% second
print(first)
