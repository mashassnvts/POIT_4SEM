package Sosnovets.bstu.company;

import Sosnovets.bstu.comparator.CustomComparator;
import Sosnovets.bstu.level.Level;
import Sosnovets.bstu.team.Programmer;

public class Director {
    public static void count(Company company) {
        System.out.println(company.name + " has " + company.getList().size() + " members\n");
    }

    public static void sort(Company company) {
        company.getList().sort(new CustomComparator());
    }

    public static void find(Company company, Level level) {
        for(var i : company.getList()) {
            if (i instanceof Programmer)
                if (((Programmer) i).level == level)
                    i.show();
        }
    }
}
