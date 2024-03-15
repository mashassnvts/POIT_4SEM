package Sosnovets.Company;
import Sosnovets.Human.Human;

import java.util.ArrayList;

public class Company {
    private int count = 0;
    private final int maxCount;
    private final ArrayList<Human> list;
    public String company_name;

    public Company(String name, int maxCount) {
        this.company_name = name;
        this.maxCount = maxCount+1;
        list = new ArrayList<>();
    }

    public Company(String name) {
        this.company_name = name;
        this.maxCount = 8;
        list = new ArrayList<>();
    }

    public void add(Human human) throws Exception {
        if (human==null)
            throw new NullPointerException("Невозможно добавить пустого работника");
        if (count>maxCount+1)
        {
            throw new Exception("В компании уже слишком много сотрудников");
        }
        else {
            list.add(human);
        }
    count++;
    System.out.println("В компанию "+company_name+" добавлен сотрудник -> "+ human.surname+ " " +human.name);
    }

    public ArrayList<Human> getList() {
        return list;
    }

    public void show() {
        for(var i : list) {
            System.out.println("\n\t\tСОСТАВ КОМПАНИИ: "+ "\nИмя работника: " + i.name +
                    "\nВозраст: " + i.age +
                    "\nЗарплата: " + i.salary + "\nОпыт: "+ i.experience);
        }
    }
}
