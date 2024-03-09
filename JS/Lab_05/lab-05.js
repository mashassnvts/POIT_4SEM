/*1. types*/
/*базовые типы*/
/*примитивный тип,который принимает два значения*/
var isFetching = true;
var isLoadinf = false;
/*следующий примитивный тип - число*/
var int = 42;
var float = 4.2;
var num = 3e10;
var message = 'Hello TypeScript';
var numberArray = [1, 1, 2, 3, 5, 8, 13];
var numberArray2 = [1, 1, 2, 3, 5, 8, 13]; //глобальный класс array и в треугольных скобках указывается из чего он состоит. вообще такая запись называется дженерик типы
var words = ['Hello', 'TypeScript'];
//Tuple-тип данных. его идея состоит в том, что мы создаем какой-то массив состоящий из рахных типов данных
var contact = ['Vladilen', 1234567];
//Any
var variable = 42;
//переопердение
variable = 'New String';
variable = [];
//function. void=функция ничего нам не вернет
function sayMyName(name) {
    console.log(name);
}
sayMyName('Masha');
//never. используется когда функция либо возвращает нам ошибку и никогда не заканчивает свое выполнение , либо когда она действительно что=то делает
function trowError(message) {
    throw new Error(message);
}
function infinite() {
    while (true) {
    }
}
var login = 'admin';
var id1 = 1234;
var id2 = '1234';
