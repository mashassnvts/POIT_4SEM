package Sosnovets.Human;
import java.util.Comparator;

public class MyComparator implements Comparator<Human> {
    @Override
    public int compare(Human o1, Human o2) {
        return Float.compare(o1.getSalary(), o2.getSalary());
    }
}
