#include "pch.h"
#include <iostream>
#include <ctime> 
#include <locale>
#include <iomanip> 
#include <chrono>
#include "Combi.h"
#include "Boat.h"
#include "Auxil.h"
#define N (sizeof(AA)/2)
#define M 3
#define NN 8
#define MM 5

int main()
{
    setlocale(LC_ALL, "rus");
    std::chrono::high_resolution_clock::time_point t1, t2;
    int* v = new int[NN]; // вес
    int* c = new int[NN]; // доход 
    int* minv = new int[MM];   // минимальный  вес 
    int* maxv = new int[NN];    // максимальный вес
    short r[MM];
    for (int i = 0; i < NN; i++)
    {
        v[i] = 100 + rand() % 100;
        c[i] = 10 + rand() % 90;
    }
    for (int j = 0; j < MM; j++)
    {
        minv[j] = 50 + rand() % 70;
        maxv[j] = 150 + rand() % 700;
    }
    auxil::start();
    t1 = std::chrono::high_resolution_clock::now();
    int cc = boat_с(
        MM,
        minv,
        maxv,
        NN,
        v,
        c,
        r
    );
    t2 = std::chrono::high_resolution_clock::now();
    std::cout << std::endl << "- Задача о размещении контейнеров на судне -";
    std::cout << std::endl << "- общее количество контейнеров   : " << NN;
    std::cout << std::endl << "- количество мест для контейнеров  : " << MM;
    std::cout << std::endl << "- минимальный  вес контейнера  : ";
    for (int i = 0; i < MM; i++) std::cout << std::setw(3) << minv[i] << " ";
    std::cout << std::endl << "- максимальный вес контейнера  : ";
    for (int i = 0; i < MM; i++) std::cout << std::setw(3) << maxv[i] << " ";
    std::cout << std::endl << "- вес контейнеров      : ";
    for (int i = 0; i < NN; i++) std::cout << std::setw(3) << v[i] << " ";
    std::cout << std::endl << "- доход от перевозки     : ";
    for (int i = 0; i < NN; i++) std::cout << std::setw(3) << c[i] << " ";
    std::cout << std::endl << "- выбранные контейнеры: ";
    for (int i = 0; i < MM; i++) {
        if (r[i] >= 0 && r[i] < NN) {
            std::cout << std::endl << "контейнер " << r[i] << ":";
            std::cout << std::setw(3) << v[r[i]] << " (вес контейнера), ";
            std::cout << std::setw(3) << c[r[i]] << " (доход от перевозки)";
        }
    }
    std::cout << std::endl << "- доход от перевозки     : " << cc << std::endl;
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(t2 - t1).count();
    std::cout << "время выполнения - " << duration / 1000000.0 << " сек" << std::endl;
    delete[] v;
    delete[] c;
    delete[] minv;
    delete[] maxv;
    system("pause");
    return 0;
}
