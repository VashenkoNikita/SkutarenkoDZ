import Foundation

//1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
//
func function(closure: () -> ()){
    var a = 0
    for i in 1...10{
        a += 1
        print("i = \(i)")
    }
    closure()
}
function{print("salam")}
//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.

var dict = [1,2,41,413,35,3,5,2,352,353,25,33,2,12,4,64,634]

func sort1(mas:[Int],closure:(Int,Int) -> Bool) -> [Int]{
    return mas.sorted(by: closure)
}
print(sort1(mas: dict, closure: {$0 < $1}))
print(sort1(mas: dict, closure: {$0 > $1}))
//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.
//
//используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.
//
func masInt(mas:[Int],closure:(Int,Int?) -> Bool) -> Int{
    var assesiont:Int?
    for value in mas{
        assesiont = closure(value,assesiont) ? value : assesiont
    }
    return assesiont ?? mas.sorted(by:<).first!
}
print(masInt(mas: dict, closure: {$0 < $1 ?? 0 }))
print(masInt(mas: dict, closure: {$0 > $1 ?? 0 }))
//4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

var str = "Ыфвто?лф ь1лв61цйт541!ов14,т"

var stringArray:[String] = []
for char in str{
    stringArray.append(String(char))
}


func priority(mas:String)->Int{
    switch (mas.lowercased()) {
    case "а", "у", "о", "ы", "и", "э", "я", "ю", "ё", "е":
        return 0;
    case "а"..."я":return 1;
    case "0"..."9":return 2
    default:
        return 3
    }
}

print(stringArray.sorted{
    switch (priority(mas: $0),priority(mas: $1)) {
    case let (x,y) where x < y:return true
    case let (x,y) where x > y:return false
    default:
        return $0.lowercased() <= $1.lowercased()
    }
})




//5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)
var dictChar:[Character] = ["A","B","C","D","E","F","G","H"]

func masInt1(mas:[Character],closure:(Character,Character?) -> Bool) -> Character{
    var assesiont:Character?
    for value in mas{
        assesiont = closure(value,assesiont) ? value : assesiont
    }
    return assesiont ?? mas.sorted(by:<).first!
}
print(masInt1(mas: dictChar, closure: {$0 < $1 ?? "0" || $0 == nil}))


