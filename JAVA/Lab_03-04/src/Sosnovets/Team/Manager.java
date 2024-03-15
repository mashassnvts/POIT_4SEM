package Sosnovets.Team;
import Sosnovets.Human.Human;

public class Manager extends Human {
    public Manager(String surname, String name, int age, int salary, int exprerience) {
        super(surname, name, age, salary, exprerience);
    }

    public Manager() {
        super();
    }

    @Override
    public String toString() {
        return "\n\t\t > Менеджер: " + surname + ' ' + name +
                "\n\tвозраст: " + age + ", з/п: " + salary + ", опыт: " + experience;
    }
}
