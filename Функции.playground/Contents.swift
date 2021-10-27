import Foundation

//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
//

func blackSquare() -> String {
    return "\u{25A1}"
}
func whiteSquare() -> String {
    return "\u{25A0}"
}


print("\(blackSquare()) \(whiteSquare())")

//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

var dict1 = ["A","B","C","D","E","F","G","H"]

func squareColor(word word:Int, andSim sim:Int) -> String{
    return (word % 2 == sim % 2) ? "\u{25A1}": "\u{25A0}"
}
print(squareColor(word: 3, andSim: 6))

//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
//

func massive(mas:[String]) -> [String]{
    var mas1 = [String]()
    for element in mas{
        mas1.insert(element, at: 0)
    }
    return mas1
}

//print(massive(mas:dict1))
//4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
//
func massive1( mas:inout [String]) -> [String]{

    for element in mas{
        mas.insert(element, at: 0)
        mas.removeLast()
    }
    return mas
}
massive1(mas: &dict1)

//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

func deleteSimvol(str:inout String) -> String{
    str = str.lowercased()
    var finalSting = ""
    for i in str{
        switch i {
        case "!","?",".",",":break
        case "а", "у", "о", "ы", "и", "э", "я", "ю", "ё", "е": finalSting += String(i).uppercased()
        case "0": finalSting = "ноль"
        case "1": finalSting += "одни"
        case "2": finalSting += "два"
        case "3": finalSting += "три"
        case "4": finalSting += "четыре"
        case "5": finalSting += "пять"
        case "6": finalSting += "шесть"
        case "7": finalSting += "семь"
        case "8": finalSting += "восемь"
        case "9": finalSting += "девять"
        default:
            finalSting += String(i)
        }
    }
    str = finalSting
    return str
}
var a = "0  потому, что !1 это так 2"
print(deleteSimvol(str: &a))
