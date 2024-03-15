package Sosnovets.bstu.comparator;

import Sosnovets.bstu.human.Human;

import java.util.Comparator;

public class CustomComparator implements Comparator<Human> {

    @Override
    public int compare(Human o1, Human o2) {
        return Float.compare(o1.getSalary(), o2.getSalary());
    }
}
