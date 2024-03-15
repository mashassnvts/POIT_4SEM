package Sosnovets.Team;
import Sosnovets.Human.Human;

public class SystemAdministator extends Human {
    public SystemAdministator(String surname, String name, int age, int salary, int exprerience) {
        super(surname, name, age, salary, exprerience);
    }

    public SystemAdministator() {
        super();
    }

    /* переопределён метод toString(), который возвращает строковое представление объекта SysAdmin,
    //включая значения его полей*/
    @Override
    public String toString() {
        return "\n\t\t > Системный администратор: " + surname + ' ' + name +
                "\n\tвозраст: " + age + ", з/п: " + salary + ", опыт: " + experience;
    }
}
