/*1. types*/
var isFetching = true;
var isLoadinf = false;
var int = 42;
var float = 4.2;
var num = 3e10;
var message = 'Hello TypeScript';
var numberArray = [1, 1, 2, 3, 5, 8, 13];
var numberArray2 = [1, 1, 2, 3, 5, 8, 13];
var words = ['Hello', 'TypeScript'];
var contact = ['Vladilen', 1234567];
//Any
var variable = 42;
//переопредение
variable = 'New String';
variable = [];
function sayMyName(name) {
    console.log(name);
}
sayMyName('Masha');
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
var ob = {
    name: 'wd',
    age: 19
};
var cor = ['fghj', 18, { name: 'wdddd', age: 19 }];
console.log(cor);
