const arrayOfNumbers: Array<number> = [1,5,32,5,6,8]
const arrayOfStrings: Array<string> = ['hello', 'typescript']

function reverse<T>(array: T[]): T[]{
    return array.reverse()
}

reverse(arrayOfNumbers)
reverse(arrayOfStrings)