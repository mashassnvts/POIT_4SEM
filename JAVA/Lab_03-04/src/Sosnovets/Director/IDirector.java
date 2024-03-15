package Sosnovets.Director;

import Sosnovets.Company.Company;
import Sosnovets.Human.Human;

import java.util.ArrayList;

public interface IDirector {
    int counting(Company company);
    void sort(ArrayList<Human> list);
    void find(Company company,int exp);
}
