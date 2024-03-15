package Sosnovets.bstu.human;

//абстрактный класс
public abstract class Human {
    protected float salary;
    //поля
    public String name;
    public int age;
    //set-ы, get-ы
    public float getSalary() {
        return salary;
    }
    public void setSalary(float salary) {
        this.salary = salary;
    }

    public Human(String name, int age, float salary) {
        this.name = name;
        this.age = age;
        this.salary = salary;
    }

    public Human() { }

    public abstract void show();
}
