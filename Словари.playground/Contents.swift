import Foundation

//1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(
//
//После всех этих перетрубаций посчитайте общий бал группы и средний бал
//

var dict:[String:Int] = ["Petrov Alex": 5 , "Osipov German": 4, "Sailent Artem": 3]

dict["Sidorov Andrey"] = 5
dict

dict["Sailent Artem"]  = 5
dict

dict["Petrov Alex"] = nil
dict

dict.removeValue(forKey: "Osipov German")
dict

var sum = 0
var mid = 0.0
for (key,value) in dict {
    sum = sum + value
    print(sum)

}
mid = Double(sum) / Double(dict.count)
print(mid)





//2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
//В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.
//

let nameMonth = ["January":30, "February":28, "March":31, "April":30, "May":31, "June":30, "July":31, "August":31, "September":31, "October":31, "November":30, "December":31]

for (key, value) in nameMonth{
    print("Месяц \(key) число \(value) ")
}
//3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.
//
//Рекомендация: постарайтесь все сделать используя вложенный цикл (объяснение в уроке).

//
var dictStruct = [String:Bool]()
var dict1 = ["A","B","C","D","E","F","G","H"]

for i in 0..<dict1.count{
    for j in 1...8{
        if i%2 == j%2{
            dictStruct["\(dict1[i])\(j)"] = true

        }else{
            dictStruct["\(dict1[i])\(j)"] = false
        }
    }

}

for (key, value) in dictStruct{
    print(value ? "\u{25A1}":"\u{25A0}")
}


