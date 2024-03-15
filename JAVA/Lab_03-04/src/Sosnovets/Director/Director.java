package Sosnovets.Director;

import Sosnovets.Company.Company;
import Sosnovets.Human.Human;
import Sosnovets.Human.MyComparator;

import java.util.ArrayList;

public class Director implements IDirector{
    public String surname;
    public String name;
    public float salary;

    public Director(String surname, String name, float salary) {
        this.surname = surname;
        this.name = name;
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "\t\t > Директор: " +
                "surname='" + surname + '\'' +
                ", name='" + name + '\'' +
                ", salary=" + salary+"\n";
    }
///*Полиморфизм позволяет объектам разных классов иметь одинаковые имена методов, но разные реализации.*/
    @Override
    public int counting(Company company) {                      // подсчёт сотрудников
        ArrayList<Human> arr = company.getList();
        return arr.size();
    }

    @Override
    public void sort(ArrayList<Human> list) {                   // сортировка по зарплате
        list.sort(new MyComparator());
    }

    @Override
    public void find(Company company, int exp) {                // поиск сотрудников с заданным опытом
        System.out.println("Поиск сотрудников с опытом работы " + exp + " года (лет): ");
        if(company == null)
            throw new NullPointerException("Компании нет.");
        ArrayList<Human> arr = company.getList();
        for (Human worker: arr) {
            if(worker.getExperience() == exp)
                System.out.println(worker.surname+" "+worker.name);
        }
    }
}
