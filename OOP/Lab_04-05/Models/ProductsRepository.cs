using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.IO;

using Newtonsoft.Json;
using Lab_04_05.Models;

namespace Lab_04_05.Models
{
    public class ProductsRepository
    {

        private readonly string pathData = @"D:\fourth_semester\university\OOP\Новая папка (2)\Lab_04-05\Lab_04-05\Services\Tovar.json";
        private readonly string pathFilter = @"D:\fourth_semester\university\OOP\Новая папка (2)\Lab_04-05\Lab_04-05\Services\Filter.json";

        private ObservableCollection<Products> TovarList = new ObservableCollection<Products>();
        private ObservableCollection<string> FilterList = new ObservableCollection<string>();



        public ProductsRepository()
        {
            TovarList = new ObservableCollection<Products>();
        }
        public ObservableCollection<Products> GetTovars()
        {
            return TovarList;
        }
        public Products GetItemById(uint id)
        {
            return TovarList.Where(TovarList => TovarList.Id == id).FirstOrDefault();
        }
        public ObservableCollection<string> GetFilter()
        {
            return FilterList;
        }

        //добавление + обновление фильтра
        public void AddItem(Products item)
        {
            bool Flag = false;
            TovarList.Add(item);
            foreach (var item2 in FilterList)
            {
                if (item.Category == item2)
                {
                    Flag = true;
                    break;
                }
            }
            if (Flag != true)
            {
                FilterList.Add(item.Category);
            }

            CommitData();
        }

        //сохранение локальных изменений в коллекциях TovarList и FilterList
        public void LocalCommit()
        {
            Products[] tmpl = new Products[TovarList.Count()];
            TovarList.CopyTo(tmpl, 0);
            TovarList.Clear();
            FilterList.Clear();
            for (int i = 0; i < tmpl.Length; i++)
            {
                bool Flag = false;

                TovarList.Add(tmpl[i]);
                foreach (var item2 in FilterList)
                {
                    if (tmpl[i].Category == item2)
                    {
                        Flag = true;
                        break;
                    }
                }
                if (Flag != true)
                {
                    FilterList.Add(tmpl[i].Category);
                }
            }

            CommitData();
        }

        //сохрарние в джесоне
        public void CommitData()
        {
            using (StreamWriter writer = File.CreateText(pathData))
            {
                string output = JsonConvert.SerializeObject(TovarList);
                writer.Write(output);
            }
            using (StreamWriter writer = File.CreateText(pathFilter))
            {
                string output = JsonConvert.SerializeObject(FilterList);
                writer.Write(output);
            }
        }

        //из джесона
        public void OutputData()
        {
            var FileExists = File.Exists(pathData);
            if (!FileExists)
            {
                File.CreateText(pathData).Dispose();
            }
            else
            {
                using (var reader = File.OpenText(pathData))
                {
                    var FileText = reader.ReadToEnd();
                    TovarList = JsonConvert.DeserializeObject<ObservableCollection<Products>>(FileText);
                }
            }
        }
        public void OutputFilter()
        {
            var FileExists = File.Exists(pathFilter);
            if (!FileExists)
            {
                File.CreateText(pathFilter).Dispose();
            }
            else
            {
                using (var reader = File.OpenText(pathFilter))
                {
                    var FileText = reader.ReadToEnd();

                    FilterList = JsonConvert.DeserializeObject<ObservableCollection<string>>(FileText);
                }
            }

        }

        public void Deletetover(uint id)
        {
            foreach (var item in TovarList)
            {
                if (item.Id == id)
                {
                    TovarList.Remove(item);
                    break;
                }
            }
            LocalCommit();
        }
    }
}
