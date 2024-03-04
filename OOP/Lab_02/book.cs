using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_02
{
    [Serializable]

    public enum Format
    {
        TXT,
        PDF,
        FB2,
        EPUB
    }

    public class book
    {
        //private int numberOfPages;
        //private object text1;
        //private object text2;
        //private int v;

        public Format Format { get; set; }
        public int Sizee { get; set; }
        public string Name { get; set; }
        public string UDC { get; set; }
        public int Page { get; set; }
        public int Year { get; set; }

        public Author Authors { get; set; }
  

        public book(Format format, int sizee, string name, string udc, int page, int year, string FIO, string country, int ID)
        {
            Format = format;
            Sizee = sizee;
            Name = name;
            UDC = udc;
            Page = page;
            Year = year;
            Authors = new Author(FIO, country, ID);
        }

        //public book(Format format, int size, string name, string udc, int page, int year, object text1, object text2, int v)
        //{
        //    Format = format;
        //    Size = size;
        //    Name = name;
        //    UDC = udc;
        //    Page = page;
        //    //this.numberOfPages = numberOfPages;
        //    Year = year;
        //    this.text1 = text1;
        //    this.text2 = text2;
        //    this.v = v;
        //}

        public override string ToString()
        {
            return $"Format: {Format}, Size: {Sizee}, Name: {Name}, UDC: {UDC},\n Year: {Year}";
        }

    }
}