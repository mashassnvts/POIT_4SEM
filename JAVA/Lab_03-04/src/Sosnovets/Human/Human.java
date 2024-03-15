package Sosnovets.Human;

public class Human {
    //поля класса
    public String surname;
    public String name;
    public int age;
    public float salary;
    public int experience;

    public Human(){}    //конструктор по умолчанию

    public Human(String surname, String name, int age, float salary, int experience)        //конструктор с параметрами
    {
    this.surname=surname;
    this.name=name;
    this.age=age;
    this.salary=salary;
    this.experience=experience;
    }

    public float getSalary() {              //получение значения поля
        return salary;
    }
    public void setSalary(float salary) {   //установка значения для свойства
        this.salary = salary;
    }
    public int getExperience() {
        return experience;
    }

    @Override                               //переопределение метода toString
    public String toString() {
        return "Информация о сотруднике: " + "surname='" + surname + '\'' + ", name='" + name + '\'' +
                ", age=" + age + ", salary=" + salary + ", experience=" + experience;
    }
}
