package Sosnovets.bstu.parser;

import Sosnovets.bstu.team.Admin;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
//наследование
public class Sax extends DefaultHandler {
    Admin admin = new Admin();
    String thisElement = "";

    public Admin getResult()
    {
        return admin;
    }

    @Override
    public void startElement(String namespaceURI, String localName, String qName, Attributes atts) throws SAXException {
        thisElement = qName;
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        if (thisElement.equals("name")) {
            admin.name = new String(ch, start, length);
        }
        else if(thisElement.equals("age"))
        {
            admin.age = Integer.parseInt(new String(ch, start, length));
        }
        else if (thisElement.equals("salary")) {
            admin.setSalary(Float.parseFloat(new String(ch, start, length)));
        }
    }

    @Override
    public void endElement(String namespaceURI, String localName, String qName) throws SAXException {
        thisElement = "";
    }
}
