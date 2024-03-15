package Sosnovets.Team;
import Sosnovets.Human.Human;

public class Programmer extends Human {
    ProgrammerType level;

    public Programmer(String surname, String name, int age, int salary, int exprerience) {
        super(surname, name, age, salary, exprerience);
    }

    public Programmer(String surname, String name, int age, int salary, int exprerience, ProgrammerType level) {
        super(surname, name, age, salary, exprerience);
        this.level=level;
    }

    public Programmer(ProgrammerType level) {
        super();
        this.level=level;
    }

    public ProgrammerType getLevel() {
        return level;
    }

    public void setLevel(ProgrammerType level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "\n\t\t > Программист: " + surname + ' ' + name +
                "\n\tвозраст: " + age + ", з/п: " + salary + ", опыт: " + experience + ", уровень: " + level;
    }
}
