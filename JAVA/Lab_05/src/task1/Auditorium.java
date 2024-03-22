package task1;

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

// Класс Auditorium представляет аудиторию, где студенты пытаются занять места.
// Здесь определены методы для работы с аудиторией, такие как получение свободного места,
// размещение студента, выход студента из аудитории и отображение текущего состояния аудитории.

public class Auditorium {
    // Массив студентов, находящихся в аудитории
    private Students[] students;
    private int auditoriumSize;

    // Конструктор класса
    public Auditorium(int size) {
        // Инициализация размера аудитории
        this.auditoriumSize = size;
        // Создание массива студентов с указанным размером
        this.students = new Students[size];
    }

    // Метод для получения индекса первого свободного места в аудитории
    public int getFreePlace() {
        // Перебор всех мест в аудитории
        for(int i = 0; i < this.auditoriumSize; ++i) {
            // Если место пусто (студент не занял его)
            if (this.students[i] == null) {
                // Возвращаем индекс этого места
                return i;
            }
        }
        // Если все места заняты, возвращаем -1
        return -1;
    }

    // Метод для размещения студента в аудитории
    public void setStudent(Students student) {
        // Получаем свободное место для студента
        int freePlace = this.getFreePlace();
        // Выводим сообщение о размещении студента
        System.out.println("Студент: " + student.getStudentName() + " помещается.");
        // Размещаем студента на найденном свободном месте
        this.students[freePlace] = student;
    }

    // Метод для выхода студента из аудитории
    public void leaveStudent(Students student) {
        // Перебор всех мест в аудитории
        for(int i = 0; i < this.auditoriumSize; ++i) {
            // Если студент найден на месте i
            if (this.students[i] == student) {
                // Освобождаем это место
                this.students[i] = null;
                // Выводим сообщение о выходе студента
                System.out.println("Студент: " + student.getStudentName() + " покидает аудиторию.");
            }
        }
    }

    // Метод для отображения текущего состояния аудитории
    public void showAuditorium() {
        // Выводим сообщение о начале списка мест в аудитории
        System.out.println("Места в аудитории: {");

        // Перебираем все места в аудитории
        for(int i = 0; i < this.auditoriumSize; ++i) {
            // Если место занято студентом
            if (this.students[i] != null) {
                // Выводим информацию о студенте, который занимает это место
                System.out.println("\t" + i + ") " + this.students[i].getStudentName());
            } else {
                // Если место пусто
                System.out.println("\t" + i + ") пусто.");
            }
        }
        System.out.println("}");
    }
}
