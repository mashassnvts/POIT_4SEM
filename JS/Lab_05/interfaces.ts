//интерфейсы ни во что не компилируются они нужны на этапе разработки
interface Rect{
    readonly id: string
    color? : string
    size:{
        width: number
        height: number
    }
}

const rect1: Rect = {
    id: '1234',
    size:{
        width:20,
        height:30
    },
    color: '#ccc'
}

const rect2:Rect = {
    id: '12345',
    size:{
        width:10,
        height:40
    }
}

rect2.color = 'black'

const rect3 = {} as Rect
const rect4 = <Rect>{}


//наследование интерфейсов

interface RectWidthArea extends Rect{
    getArea: () => number
}

const rect5: RectWidthArea = {
    id: '123',
    size: {
        width: 20,
        height: 20
    },
    getArea() : number{
        return this.size.width * this.size.height
    }
}


interface IClock{
    time: Date
    setTime(date: Date): void
}

class Clock implements IClock{
    time: Date = new Date()

    setTime(date: Date): void {
        this.time = date
    }
}


interface Styles{
    [key: string]: string
}

const css: Styles = {
    border: '1px solid black',
  marginTop: '2px',
  borderRadius: '5px'
}