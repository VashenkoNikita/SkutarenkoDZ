import Foundation

//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
//
class Student{
    var name:String
    var surname:String
    var year:Int
    var averageScore:Int
    init(name:String,surname:String,year:Int,averageScore:Int){
        self.name = name
        self.surname = surname
        self.year = year
        self.averageScore = averageScore
    }
}
var student1 = Student(name: "Dlex", surname: "Aimon", year: 1999, averageScore: 5)
var student2 = Student(name: "Cick", surname: "Bag", year: 1997, averageScore: 4)
var student3 = Student(name: "Bred", surname: "Cag", year: 1998, averageScore: 5)
var student4 = Student(name: "Aam", surname: "Dag", year: 2000, averageScore: 3)

var jornalStudent = [student1,student2,student3,student4]

//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
//
print("Задание 2-------------------------")
func printStudent(jornal:[Student]){
    var a = 0
    for i in jornal{
        a += 1
        print(a,"Имя студента\(a) - \(i.name) Фамилия студента - \(i.surname) Год рождения - \(i.year) Средний балл - \(i.averageScore)")

    }
}
printStudent(jornal: jornalStudent)
//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
//
print("Задание 3-------------------------")
func sorted(mas:[Student], closure: (Student, Student)->Bool)->[Student]{
    return mas.sorted(by: closure)
}

jornalStudent = sorted(mas: jornalStudent){ave1,ave2 in
    ave1.averageScore < ave2.averageScore
}
printStudent(jornal: jornalStudent)
//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
//
print("Задание 4-------------------------")
jornalStudent = sorted(mas: jornalStudent){sur1,sur2 in
    return sur1.surname == sur2.surname ? sur1.name < sur2.name:sur1.surname < sur2.surname
}
printStudent(jornal: jornalStudent)
//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
//
print("Задание 5-------------------------")
var mas = jornalStudent
mas[0].name = "Dima"
mas[1].name = "Misha"
mas[2].name = "Andrey"
mas[3].name = "Alexey"
print("Печать нового массива")
printStudent(jornal: mas)
print("Печать старого массива")
printStudent(jornal: jornalStudent)
//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?

print(" !6! - задание тоже готово")

