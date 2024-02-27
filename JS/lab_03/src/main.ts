/*1.	Напишите функцию, которая принимает массив из 10 целых чисел (от 0 до 9) и возвращает строку этих чисел в виде номера телефона.  
Формат номера телефона должен соответствовать "(xxx) xxx-xxxx".*/

function createPhoneNumber(numbers: number[]) : string {
    if (numbers.length != 10) return "Неверный формат номера";

    return "(" + numbers[0] + numbers[1] + numbers[2] + ") "
        + numbers[3] + numbers[4] + numbers[5] + "-" + numbers[6] + numbers[7] + numbers[8] + numbers[9];
}

let numbers_arr: number[] = [4, 8, 9, 9, 6, 1, 2, 3, 4, 5];

console.log("Задание №1: "+ createPhoneNumber(numbers_arr));

/*2.	Если перечислить все натуральные числа до 10, кратные 3 или 5, то получим 3, 5, 6 и 9. 
Сумма этих чисел равна 23.Завершите метод так, чтобы он возвращал сумму всех чисел, 
кратных 3 или 5, меньше переданного числа. Кроме того, если число отрицательное, верните 0*/

class Challenge {
    static solution(number: number) {
       if (number < 0){
        console.log("Отрицательное число:" + number);
        return 0;
       }
    let sum = 0; 
    for (let i = 0; i < number; ++i) {
        if (i % 3 === 0 || i % 5 === 0) {
            sum += i;
        }
    }
    console.log(sum);
    return(sum);
      }
    }
Challenge.solution(10);