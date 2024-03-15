package Sosnovets;
import Sosnovets.Company.Company;
import Sosnovets.Director.Director;
import Sosnovets.Human.Human;
import Sosnovets.Team.*;

import java.util.logging.Level;
import java.util.logging.Logger;


public class Main {
    /* Лабораторная №3:
    Определить иерархию сотрудников: инженер, сис админ, программисты (junior, senior и т.п.). Набрать компанию по заданному плану
    набора. Создать директора. Его функции: подсчитать сотрудников, отсортировтаь по зарплате, найти сотрудников с заданным уровнем навыков*/
    //Логгирование в Java играет важную роль в разработке и поддержке приложений, так как помогает разработчикам отслеживать работу приложения,
    // выявлять ошибки и проблемы, а также предоставляет информацию для анализа и оптимизации производительности.
    static Logger Log;
    static {
        Log = Logger.getLogger(Main.class.getName());
    }
    public static void main(String[] args) throws Exception {
        Log.log(Level.INFO, "Создание коллекции объектов.");
        Human human1=new Human("Chis","Jon",20,789.7F,3);
        Human human2=new Human("Kovaleva","Mila",22,1098.4F,5);
        Human human3=new Human("Adamov","Fillya",28,1309.3F,7);
        Human human4=new Human("Mihel","Tim",26,1200.9F,6);
        Human human5=new Human("Lorina","Emilly",21,380.8F,1);
        System.out.println(human1.toString());
        System.out.println(human2.toString());
        System.out.println(human3.toString());
        System.out.println(human4.toString());
        System.out.println(human5.toString());

        Engineer human6=new Engineer("Вишневская","Арина",24,1023,3);
        Manager human7=new Manager("Полховская", "Яна",26,780,2);
        Programmer human8=new Programmer("Даревский","Денис",24,1200,3,  ProgrammerType.Middle);
        SystemAdministator human9=new SystemAdministator("Василевский","Алексей",25,1400,4);
        Programmer human10=new Programmer("Жудро","Анастасия",29,1134,5,  ProgrammerType.Junior);

        System.out.println(human6.toString());
        System.out.println(human7.toString());
        System.out.println(human8.toString());
        System.out.println(human9.toString());
        System.out.println(human10.toString());
        System.out.println();

        Director director=new Director("Барановский", "Эдуард", 2019.2F);
        System.out.println(director.toString());
        Company com1 = new Company("iTechArt",5);
        Company com2 = new Company("EPAM",10);
        Company com3 = new Company("levelX",8);
        Log.log(Level.INFO, "Добавление объектов в компании.");
        com1.add(human2);
        com1.add(human7);
        com1.add(human9);
        com1.add(human8);
        com1.add(human5);
        com1.add(human6);
        com1.show();

        com2.add(human4);
        com2.add(human1);
        com2.add(human3);
        com2.show();

        com3.add(human10);
        com3.show();

        //Подсчёт количества сотрудников в определённой компании:
        Log.log(Level.INFO, "Подсчёт количества сотрудников в определённой компании.");
        System.out.println("\nВ компании <" +com1.company_name+"> "+director.counting(com1)+" сотрудников. ");
        System.out.println("В компании <" +com2.company_name+"> "+director.counting(com2)+" сотрудников. ");
        System.out.println("В компании <" +com3.company_name+"> "+director.counting(com3)+" сотрудников. ");
        System.out.println();

        //Поиск сотрудников с определённым опытом:
        Log.log(Level.INFO, "Поиск сотрудников с определённым опытом.");
        director.find(com1,3);
        System.out.println();
        director.find(com3,5);

        //Сортировка сотрудников по зарплате:
        Log.log(Level.INFO, "Сортировка сотрудников по зарплате.");
        System.out.println("\n\n\t\tДо сортировки-------------------");
        com2.show();
        director.sort(com2.getList());
        System.out.println("\n\t\tПосле сортировки-------------------");
        com2.show();
    }
}
