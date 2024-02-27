package by.bestu.it.Sosnovets.basejava;
/*Использовать пакеты by.belstu.it.фамилия.basejava
Создайте в нем класс JavaTest c методом main (наберите просто
psvm ). В дальнейшем запускайте main.*/
import java.util.Locale;
import  java.util.Random;
/*@author
* @version 1.1
* */
public class JavaTest {
    static int sint;

/*Задайте две константы в классе*/
    public static final double PI = 3.14;
    public final int constantValue = 295;//экземпляр класса
    /*@params args
    * */
    public static void main(String[] args) {
/*Определить перемнные типа char, int, short, byte, long, boolean + выполнить операции.*/
        char charVar = 'F';
        int intVar = 53;
        short shortVar = 34;
        byte byteVar = 86;
        long longVar = 757675L;
        boolean booleanVar = true;
        String stringVar = "Bye";
        double doubleVar = 473.522;


        System.out.println("String + int: " + (stringVar+intVar));
        System.out.println("String + char: " + (stringVar+charVar));
        System.out.println("String + double: " + (stringVar+doubleVar));

        byte byteSum = (byte)(byteVar+intVar);
        System.out.println("byte + int:" + byteSum);

        int intSum = (int)(doubleVar+longVar);
        System.out.println("double + long: " + intSum);

        long longSum = (long) (intVar + 2147483647);
        System.out.println("int + 2147483647: " + longSum);

        System.out.println("static int: " + sint);

        boolean boolAnd = booleanVar && !booleanVar;
        System.out.println("boolean(true) && boolean(false): " + boolAnd);

        boolean boolOr = booleanVar ^ !booleanVar;
        System.out.println("boolean(true) ^ boolean(false): " + boolOr);
        // ошибка: нельзя складывать булевые значения
        // boolean booleanSum = booleanVar + !booleanVar;

        long var1 = 9223372036854775807L;
        long var2 = 0x7fff_ffff_fffL;

        /*проинициализируйте и выведите char - 'a' ; \u0061'; 97; после
чего сложите все char*/
        char charVar1 = 'a';
        char charVar2 = '\u0061';
        char charVar3 = 97;
        char charSum = (char) (charVar1 + charVar3 +charVar2);
        System.out.println("'a' + \u0061 + 97 = " + charSum);

        System.out.println("3.45 % 2.4 = " + (3.45 % 2.4));
        System.out.println("1.0 / 0.0 = " + (1.0 / 0.0));
        System.out.println("0.0 / 0.0 = " + (0.0 / 0.0));
        System.out.println("log(-345) = " + Math.log(-345));
        System.out.println("Float.intBitsToFloat(0x7F800000) = " + Float.intBitsToFloat(0x7F800000));
        System.out.println("Float.intBitsToFloat(0xFF800000) = " + Float.intBitsToFloat(0xFF800000));
        System.out.println("Целые константы можно записывать в СС: 2, 10, 16\n");


/*выведите значения Math.PI; Math.E; округлите их
(Math.round()); найдите минимальное среди них Math.min(p,e);
 сгенерируйте случайное число из диапазона [0,1)*/

        System.out.println("vale Math.PI: " + Math.PI);
        System.out.println("value Math.E: " + Math.E);
        System.out.println("rounded Math.PI: " + Math.round(Math.PI));
        System.out.println("rounded Math.E: " + Math.round(Math.E));
        System.out.println("min из PI и E: " + Math.min(Math.PI, Math.E));
        System.out.println("random [0,1): ");
        double start = 0.0;
        double end = 1.0;
        double random = new Random().nextDouble();
        double result = start + (random * (end - start));
        System.out.println(result);

        /*Создать объекты разных классов оболочек (Boolean,
                Character, Integer, Byte, Short, Long, Double)*/
        Boolean boole = true;
        Character chare = 'T';
        Integer inte = 355;
        Byte bytee = (byte) 35;
        Short shorte = (short) 345;
        Long longe = 6546546L;
        Double doublee = 457.345;
      /*Выполните на ними арифметические, логические и битовые
операторы (, >>>, >>, ~, &, *, -, +) – выборочно
 веведите MIN_VALUE и MAX_VALUE для Long и Double
 выполнить упарковку и распаковку для типов Integer и Byte
 вызовите для Integer методы : parseInt ; toHexString ; compare ;
toString ; bitCount ; isNaN …
*/

        System.out.println("436 >>> 1 (бunsigned shiftг): " + (inte >>> 1));
        System.out.println("-567 >>> 1 (unsigned shift): " + (-577 >>> 1));
        System.out.println("436 >> 1 (A landmark shift): " + (inte >> 1));
        System.out.println("-567 >> 1 (A landmark shift): " + (-577 >> 1));
        System.out.println("int + long = " + (inte + longe));
        System.out.println("~92 (не): " + (~(92)));
        System.out.println("193 & 23 = " + (193 & 23));
        System.out.println("true && false = " + (boole && !boole));
        System.out.println("true || true = " + (boole || !boole));
        System.out.println("byte + short = " + (bytee + shorte));

        /*веведите MIN_VALUE и MAX_VALUE для Long и Double*/
        System.out.println("\tLong, Double:");
        System.out.println("Long.MAX_VALUE: " + (Long.MAX_VALUE));
        System.out.println("Long.MIN_VALUE: " + (Long.MIN_VALUE));

        System.out.println("Double.MAX_VALUE: " + (Double.MAX_VALUE));
        System.out.println("Double.MIN_VALUE: " + (Double.MIN_VALUE));

        /*выполнить упарковку и распаковку для типов Integer и Byte*/
        Integer intbox = 35;//упаковка
        int boxint = intbox;//распаковка

        Byte bytebox = 24;
        byte boxbute = bytebox;

        /*вызовите для Integer методы : parseInt ; toHexString ; compare ;
toString ; bitCount ; isNaN */
        System.out.println("ParseInt('900'): " + (Integer.parseInt("900")));
        System.out.println("ParseInt('900', 16): " + (Integer.parseInt("900",16)));
        System.out.println("toHexString(333): " + (Integer.toHexString((333))));
        System.out.println("compare(3,3): " + (Integer.compare(3,3)));
        System.out.println("toString(122): " + (Integer.toString(122)));
        System.out.println("bitCount(22): " + (Integer.bitCount(22)));

        /*Выполните преобразование числа типа String (String s34 = "2345";)*/
        String s34 = "2345";
        System.out.println("Integer.valueOf(s34): " + (Integer.valueOf(s34)));
        System.out.println("Integer.parseInt(s34): " + (Integer.parseInt(s34)));

        /*переводите строку в массив байтов и обратно из массива байтов в
строку*/
        byte[] strArr = s34.getBytes();
        System.out.println("An array of bytes from a string: " + strArr);

        String s34new = new String(strArr);
        System.out.println("A string in a byte array: " + s34new);

        //преобразуйте строку в логический тип 2-мя способами.
        System.out.println("the first: " + Boolean.valueOf(s34));
        System.out.println("the second: " + Boolean.getBoolean(s34));

/*определите два строки (String) с одинаковыми инициализаторами.*/
        String str1 = "vivsii";
        String str2 = "vivvsss";
        String str12 = str1 + str2;
        System.out.println("операция ==: " + str12);
        String strEquals = String.valueOf(str1.equals(str2));
        System.out.println("equals: " + strEquals);
        String strCompare = String.valueOf(str2.compareTo(str1));
        System.out.println("compare to: " + strCompare);

        str2 = null;
        System.out.println("== : " + (str1 == str2));
        System.out.println("equals: " + (str1.equals(str2)));
        // исключение
        //System.out.println("compareTo: " + (str1.compareTo(str2)));

        /* для произвольной строки выполните функции split, contains,
hashCode, indexOf, length, replace.
*/
        String myStr = "The sun always rises";
        System.out.println("my stroka: " + myStr);
        String[] splitstr = myStr.split(" ");
        for(String a : splitstr) System.out.println(a);
        System.out.println("contains sequence 'sun': " + myStr.contains("sun"));
        System.out.println("hashcode: " + myStr.hashCode());
        System.out.println("indexof: " + myStr.indexOf("always"));
        System.out.println("length: " + myStr.length());
        System.out.println("replace: " + myStr.replace("rises", "vivsii"));//замена

        char [] [] c1;
        char [] c2 [];
        char c3 [] [];

        int arrZero[] = new int[0];
        //выход за пределы
        //System.out.println(arrZero[5]);

        //c1
        c1 = new char[3][];
        c1[0] = new char[0];
        c1[1] = new char[1];
        c1[2] = new char[2];
        System.out.println("length array: " + c1.length);
        System.out.println("length str0: " + c1[0].length);
        System.out.println("length str1: " + c1[1].length);
        System.out.println("length str2: " + c1[2].length);

        /*проинициализируйте с2 и с3 и выполните :
boolean comRez = с2==с3;
с2 = с3;*/
        c2 = new char[][] {{'9','8','7'}, {'6','5','4'},{'3','2','1'}};
        c3 = new char[][] {{'9','8','7'}, {'6','5','4'},{'3','2','1'}};
        boolean comRez = c2 ==c3;
        System.out.println(comRez);
        c2 = c1;
        System.out.println(c2 == c3);
        /*выведите один из массивов совращенным циклом (foreach)*/
        for(char[] inner_arr:c3){
            for (char cell: inner_arr){
                System.out.println(cell);
            }
        }

        String test = "Hello Wolrd!";
        WrapperString testWrapp = new WrapperString(test);
        testWrapp.replace('l','i');

        /*Создайте объект, выполните метод
 Определите анонимный класс с переопредленной
реализацией replace (char oldchar, char newchar)
и дополнительным методом delete (char newchar)
*/
        var testWrapp2 = new WrapperString(test){
            public void replace(char oldChar, char newChar){
                System.out.println(test.replace(oldChar, newChar));
            }
            public void delete(String newChar){
                System.out.println(test.replace(newChar, ""));
            }
        };
        testWrapp2.replace('l', 'i');
        testWrapp2.delete("llo");
    }
}


