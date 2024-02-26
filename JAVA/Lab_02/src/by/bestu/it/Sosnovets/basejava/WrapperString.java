package by.bestu.it.Sosnovets.basejava;

import java.util.Objects;

/*Создайте класс WrapperString c приватным полем типа String.*/
public class WrapperString {
    private  String example;

    public WrapperString(String example){this.example = example;}
    public String getExample(){return example;}

    public void setExample(String example) {this.example = example;}



    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WrapperString that = (WrapperString) o;
        return Objects.equals(example, that.example);
    }

    @Override
    public int hashCode() {
        return Objects.hash(example);
    }

    @Override
    public String toString() {
        return "WrapperString{" +
                "example='" + example + '\'' +
                '}';
    }
    /**@param oldChar - старый символ
     * @param newChar - новый символ*/
    public void replace (char oldChar, char newChar) {
        System.out.println("оригинальный replace");
    }

}
