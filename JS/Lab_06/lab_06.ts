type arr = {
    id: number,
    name: string,
    group: number
}

const array: arr[] = [
    {id: 1, name: 'Vasya', group: 10},
    {id: 2, name: 'Ivan', group: 11},
    {id: 3, name: 'Masha', group: 12},
    {id: 4, name: 'Petya', group: 10},
    {id: 5, name: 'Kira', group: 11},
]




type CarsType = {
    manufacturer?: string,
    model?: string
}

let car: CarsType = {};
car.manufacturer = "manufacturer";
car.model = 'model';




let car1: CarsType = {};
car1.manufacturer = "manufacturer";
car1.model = 'model';

let car2: CarsType = {};
car2.manufacturer = "manufacturer";
car2.model = 'model';

type ArrayCarsType = {
    cars: Array<CarsType>;
}

const arrayCars: Array<ArrayCarsType> = [{
    cars: [car1, car2]
}];




type MarkFilterType = 1|2|3|4|5|6|7|8|9|10;
type GroupFilterType = 1|2|3|4|5|6|7|8|9|10|11|12;
type DoneType = boolean;

type MarkType = {
    subject: string,
    mark: MarkFilterType,//знач от 1 до 10
    done: DoneType,
}

type StudentType = {
    id: number,
    name: string,
    group: GroupFilterType,//1 до 12
    marks: Array<MarkType>,
}

type GroupType = {
    students : StudentType[],
    studentsFilter: (group: GroupFilterType) => Array<StudentType>,//фильтр по группе
    marksFilter: (mark: number) => Array<StudentType>,//по оценкен
    deleteStudent: (id: number) => void,
    mark: MarkFilterType,
    group: GroupFilterType,
}

const group: GroupType = {
    students: [
        {id: 1, name: 'Pypkin Petya', group: 3, marks:[
            {subject: 'OOP', mark: 6, done: false},
            {subject: 'OAP', mark: 10, done: true},
            {subject: 'KSIS', mark: 2, done: true},
        ]},
        {id: 2, name: 'Pypkin1 Petya', group: 8, marks:[
            {subject: 'OAP', mark: 4, done: true},
            {subject: 'BD', mark: 6, done: false},
            {subject: 'DPI', mark: 9, done: false},
        ]},
        {id: 3, name: 'Pypkin2 Petya', group: 10, marks:[
            {subject: 'MATH', mark: 7, done: false},
            {subject: 'AISD', mark: 2, done: true},
            {subject: 'DPI', mark: 9, done: false},
        ]},
    ],
    studentsFilter(group: GroupFilterType): Array<StudentType>
    {
        const filteredStudents: Array<StudentType> = [];
        for(let i=0;i<this.students.length;i++){
            if(this.group[i] == group) {
                filteredStudents.push(this.students[i]);
            }
        }
        return filteredStudents;
    },
    marksFilter: function(mark:number){
        return this.students.filter(student => student.marks.filter(marks => marks.mark === mark).length > 0);
    },
    deleteStudent: function (id:number) {
        this.students = this.students.filter(student => student.id !== id);
    },
    mark: 6,
    group: 10
}


for (let student of group.marksFilter(6)) {
    console.log(student.name);
};

for (let stud of group.studentsFilter(10)) {
    console.log(stud.name);
}

group.deleteStudent(3);
for(let stud of group.students) {
    console.log(stud.name);
}



