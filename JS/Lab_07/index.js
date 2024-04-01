/*2.	Создать промис myPromise, который через 3 секунды генерирует случайное число. 
Результат выполнения промиса (сгенерированное число) вывести в консоль.*/

let promise = new Promise(function(resolve, reject){
    setTimeout(() => resolve(Math.floor(Math.random()*100)), 300)
})

promise.then(result => console.log(result))

/*3.	Создать функцию, которая принимает параметр delay и возвращает промис myPromise (промис из предыдущей задачи). 
Сгенерируйте 3 числа (т.е. необходимо вызвать функцию 3 раза) и только после того, как все промисы выполняться успешно, 
вывести числа в консоль. Использовать Promise.all.*/


function del(delay){
    return new Promise((resolve) => {setTimeout(() => resolve(Math.floor(Math.random()*100)), delay)})
}

let result1 = [
    del(1000), 
    del(1800), 
    del(2000)
]
Promise.all(result1).then(resultt => console.log(result1))


/*4.	Что будет выведено в консоль и почему? Что возвращают методы then и catch?*/
let pr = new Promise ((res,rej) =>{
    rej('ku')
})

pr .then(() => console.log(1))
.catch(() => console.log(2))
.catch(() => console.log(3))
.then(() => console.log(4))
.then(() => console.log(5))


/*Создайте промис, который выполнился успешно, результат выполнения промиса число 21. Вызовите цепочку методов then. 
Первый вызов метода then выводит в консоль результат выполнения предыдущего промиса. 
Второй вызов метода then выводит в консоль результат выполнения предыдущего промиса умноженного на 2. 
В результате в консоль последовательно должны выводиться числа 21 и 42.*/

let prom = new Promise(function(res,rej){
    setTimeout(() => res(21),4000)
})

prom.then(function(ress){
    console.log(ress)
    return ress
})
.then(function(ress){
    console.log(ress *2)
})


/*6.	Предыдущую задачу реализуйте при помои синтаксиса async/await*/
setTimeout(async() =>{
    let ress = await prom
    console.log(ress)
    console.log(ress * 2)
})
