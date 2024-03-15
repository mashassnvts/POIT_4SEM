package Sosnovets.bstu.company;

import Sosnovets.bstu.exceptions.AddException;
import Sosnovets.bstu.human.Human;

//интерфейс
public interface ICompany {
    public void add(Human human) throws AddException;
}
