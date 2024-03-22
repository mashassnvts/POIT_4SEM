//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package task2;

/*
   Класс Parking представляет парковку, где автомобили могут припарковываться.
   Здесь определены поля для массива автомобилей и размера парковки.
   Конструктор принимает размер парковки и инициализирует соответствующие поля.
   Метод getFreePlace() возвращает индекс первого свободного места на парковке.
   Метод setCar() принимает объект автомобиля и припарковывает его на первое свободное место.
   Метод leaveCar() принимает объект автомобиля и удаляет его из парковки.
   Метод showParking() выводит текущее состояние парковки: занятые и свободные места.
*/
public class Parking {
    // Массив для хранения автомобилей на парковке
    private Car[] parking;
    // Размер парковки (количество мест)
    private int parkingSize;

    // Конструктор класса
    public Parking(int size) {
        // Инициализация размера парковки
        this.parkingSize = size;
        // Создание массива автомобилей с указанным размером
        this.parking = new Car[size];
    }

    // Метод для получения индекса первого свободного места на парковке
    public int getFreePlace() {
        // Перебор всех мест на парковке
        for(int i = 0; i < this.parkingSize; ++i) {
            // Если место пусто (автомобиль не припаркован)
            if (this.parking[i] == null) {
                // Возвращаем индекс этого места
                return i;
            }
        }
        // Если все места заняты, возвращаем -1
        return -1;
    }

    // Метод для припарковки автомобиля на первое свободное место
    public synchronized void setCar(Car car) {
        // Вывод сообщения о припарковке автомобиля
        System.out.println("Машина: " + car.getCarName() + " припаркована.");
        // Помещаем автомобиль на свободное место
        this.parking[this.getFreePlace()] = car;
    }

    // Метод для удаления автомобиля с парковки
    public synchronized void leaveCar(Car car) {
        // Перебор всех мест на парковке
        for(int i = 0; i < this.parkingSize; ++i) {
            // Если автомобиль найден на месте i
            if (this.parking[i] == car) {
                // Удаляем автомобиль с этого места
                this.parking[i] = null;
                // Вывод сообщения о выезде автомобиля с парковки
                System.out.println("Машина: " + car.getCarName() + " навыход с парковки.");
            }
        }
    }

    // Метод для отображения текущего состояния парковки
    public void showParking() {
        // Вывод сообщения о начале списка мест на парковке
        System.out.println("Места: {");

        // Перебор всех мест на парковке
        for(int i = 0; i < this.parkingSize; ++i) {
            // Если место занято автомобилем
            if (this.parking[i] != null) {
                // Вывод информации о номере места и имени автомобиля, который на нем припаркован
                System.out.println("\t" + i + ") " + this.parking[i].getCarName());
            } else {
                // Если место пусто
                System.out.println("\t" + i + ") пусто");
            }
        }

        // Вывод сообщения о завершении списка мест на парковке
        System.out.println(" }");
    }
}
