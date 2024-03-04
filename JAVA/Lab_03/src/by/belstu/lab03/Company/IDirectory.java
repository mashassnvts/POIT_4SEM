package by.belstu.lab03.Company;

public abstract class IDirectory {
    public abstract int countWorkers(Company company);
    public abstract void sortBySalary(Company company);
    public abstract void searchByExp(Company company, int experience);
}
