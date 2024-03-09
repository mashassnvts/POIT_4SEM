/*1. types*/

/*базовые типы*/
/*примитивный тип,который принимает два значения*/
const isFetching: boolean = true;
const isLoadinf: boolean = false;

/*следующий примитивный тип - число*/
const int: number = 42;
const float: number = 4.2;
const num: number = 3e10;

const message: string = 'Hello TypeScript';

const numberArray: number[] = [1, 1, 2, 3, 5, 8, 13];
const numberArray2: Array<number> = [1, 1, 2, 3, 5, 8, 13];//глобальный класс array и в треугольных скобках указывается из чего он состоит. вообще такая запись называется дженерик типы

const words: string[] = ['Hello', 'TypeScript'];

//Tuple-тип данных. его идея состоит в том, что мы создаем какой-то массив состоящий из рахных типов данных
const contact: [string, number] = ['Vladilen', 1234567];

//Any
let variable: any = 42;
//переопердение
variable = 'New String';
variable = [];

//function. void=функция ничего нам не вернет
function sayMyName(name: string): void {
    console.log(name);
}
sayMyName('Masha');

//never. используется когда функция либо возвращает нам ошибку и никогда не заканчивает свое выполнение , либо когда она действительно что=то делает
function trowError(message:string): never{
            throw new Error(message);
}

function infinite(): never{
    while(true){

    }
}

//Type
type Login = string;

const login: Login = 'admin';
// const login2: Login = 2;

type ID = string | number;
const id1: ID = 1234;
const id2: ID = '1234';
// const id3: ID = true;

type SomeType = string | null | undefined;
