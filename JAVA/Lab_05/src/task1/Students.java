package task1;

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//


// Этот класс представляет собой модель студента, который пытается занять место в аудитории.
// Он наследует класс Thread для создания потока, представляющего каждого студента.

import java.util.Random;

public class Students extends Thread {
    public String studentName;
    Random random = new Random();
    Auditorium auditorium;

    public Students(int studentName, Auditorium auditorium) {
        // Преобразование номера студента в строку и сохранение в переменную studentName
        this.studentName = String.valueOf(studentName);
        // Сохранение ссылки на аудиторию, переданную в качестве аргумента
        this.auditorium = auditorium;
        // Вывод сообщения о приходе студента
        System.out.println("Студент: " + this.studentName + " приходит.");
    }

    // Метод для получения имени студента
    public String getStudentName() {
        return this.studentName;
    }

    public void run() {
        // Синхронизация потока по аудитории
        synchronized(this.auditorium) {
            // Если нет свободных мест в аудитории
            if (this.auditorium.getFreePlace() == -1) {
                // Генерация времени ожидания
                int waitingTime = this.random.nextInt(1000);
                // Вывод сообщения о начале ожидания
                System.out.println("Студент: " + this.getStudentName() + " ждет...");

                try {
                    // Ожидание указанное количество времени
                    this.auditorium.wait((long)waitingTime);
                } catch (InterruptedException var8) {
                    // Обработка возможного исключения InterruptedException
                }
            }
        }

        // Если в аудитории есть свободное место
        if (this.auditorium.getFreePlace() != -1) {
            // Занимаем место в аудитории
            this.auditorium.setStudent(this);
            // Показываем текущее состояние аудитории
            this.auditorium.showAuditorium();

            try {
                // Имитируем активность студента в аудитории
                Thread.sleep((long)this.random.nextInt(3000));
            } catch (Exception var7) {
                // Обработка возможных исключений
            }

            // Студент покидает аудиторию
            this.auditorium.leaveStudent(this);
            // Уведомляем другие потоки, которые могут ждать
            synchronized(this.auditorium) {
                this.auditorium.notify();
            }
        } else {
            System.out.println("Студент: " + this.getStudentName() + " левый.");
        }
    }
}

