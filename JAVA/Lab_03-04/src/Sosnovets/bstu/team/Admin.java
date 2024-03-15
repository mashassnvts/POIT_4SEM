package Sosnovets.bstu.team;

import Sosnovets.bstu.human.Human;
//внутренний класс+наследование
public class Admin extends Human {
    public Admin(String name, int age, float salary) {
        super(name, age, salary);
    }

    public Admin() { }

    public void show() {
        System.out.println("Name: " + name +
                "\nAge: " + age +
                "\nSalary: " + salary + "\n");
    }
}
