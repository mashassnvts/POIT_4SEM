package task1;

/*В БГТУ есть две двери, через которые студенты
могут входить и выходить. По обоим концам дврей собралось много
студентов. Обеспечить безопасное движение в обоих направлениях. Студента
можно перенаправить из одной двери в другую при превышении заданного
времени ожидания. */


public class Main {
    public static final int StudentCount = 10;
    public static final int AuditoriumSize = 5;

    // Конструктор по умолчанию
    public Main() { }

    public static void main(String[] args) {
        // Создание аудитории с указанным размером
        Auditorium parking = new Auditorium(AuditoriumSize);

        // Цикл создания и запуска потоков для каждого студента
        for(int i = 0; i < StudentCount; ++i) {
            // Создание нового объекта Students с указанием номера студента и аудитории
            (new Students(i, parking)).start();

            try {
                // Пауза для имитации времени ожидания между приходом студентов
                Thread.sleep(500L);
            } catch (InterruptedException var4) {
                // Обработка возможного исключения InterruptedException
            }
        }
    }
}
