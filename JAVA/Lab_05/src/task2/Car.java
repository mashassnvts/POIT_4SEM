//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package task2;

import java.util.Random;

/*
   Класс Car расширяет класс Thread и представляет модель автомобиля, который приезжает на парковку.
   Здесь определены поля для имени автомобиля, объекта парковки и генератора случайных чисел.
   Конструктор принимает номер автомобиля и объект парковки, и инициализирует соответствующие поля.
   При запуске потока выполняется метод run(), который сначала синхронизируется по объекту парковки.
   Если на парковке нет свободных мест, автомобиль ожидает некоторое время.
   Затем проверяется снова наличие свободного места: если оно есть, автомобиль занимает его,
   показывается текущее состояние парковки и запускается имитация времени пребывания на парковке.
   По завершении, автомобиль покидает парковку, освобождая место.
   Если место не удалось занять, выводится сообщение о том, что автомобиль уехал влево.
*/
public class Car extends Thread {
    // Имя автомобиля
    public String carName;
    // Объект парковки
    Parking parking;
    // Генератор случайных чисел
    Random random = new Random();

    // Конструктор класса
    public Car(int pCarName, Parking pParking) {
        // Преобразование номера автомобиля в строку и сохранение в переменную carName
        this.carName = String.valueOf(pCarName);
        // Сохранение ссылки на парковку, переданную в качестве аргумента
        this.parking = pParking;
        // Вывод сообщения о прибытии автомобиля на парковку
        System.out.println("Машина: " + this.carName + " помещается");
    }

    // Метод для получения имени автомобиля
    public String getCarName() {
        return this.carName;
    }

    // Переопределение метода run() класса Thread, который выполняется при запуске потока
    public void run() {
        // Синхронизация потока по объекту парковки
        synchronized(this.parking) {
            // Если на парковке нет свободных мест
            if (this.parking.getFreePlace() == -1) {
                // Генерация времени ожидания
                int waitingTime = this.random.nextInt(1000);
                // Вывод сообщения о начале ожидания
                System.out.println("Машина: " + this.getCarName() + " ждет...");

                try {
                    // Ожидание указанное количество времени
                    this.parking.wait((long)waitingTime);
                } catch (InterruptedException var8) {
                    // Обработка возможного исключения InterruptedException
                }
            }
        }

        // Если в парковке есть свободное место
        if (this.parking.getFreePlace() != -1) {
            // Занимаем место на парковке
            this.parking.setCar(this);
            // Показываем текущее состояние парковки
            this.parking.showParking();

            try {
                // Имитируем пребывание на парковке
                Thread.sleep((long)this.random.nextInt(3000));
            } catch (Exception var7) {
                // Обработка возможных исключений
            }

            // Покидаем парковку
            this.parking.leaveCar(this);
            // Уведомляем другие потоки, которые могут ждать
            synchronized(this.parking) {
                this.parking.notify();
            }
        } else {
            // Если не удалось занять место на парковке
            System.out.println("Машина: " + this.getCarName() + " влево. ");
        }
    }
}
