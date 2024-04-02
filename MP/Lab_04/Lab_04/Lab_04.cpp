// Lab4.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include "pch.h"
#include <iostream>
#include <time.h>
#include <ctime>
#include <cmath>
#include <algorithm>
#include <iomanip>
#include <memory.h>
#include "Levenshtein.h"
#include "MultyMatrix.h"
#define sz1 200
#define sz2 300
#define N 6
using namespace std;
int main()
{
	setlocale(LC_ALL, "rus");
	
	//-----------Task1
	clock_t t1 = 0, t2 = 0, t3 = 0, t4 = 0;
	srand(time(NULL));
	char* str1 = new char[300];
	char* str2 = new char[250];
	int i = 0;
	for (i; i < 250; i++)
	{
		str2[i] = (char)(rand() % 25 + 65);
		str1[i] = (char)(rand() % 25 + 65);
	}
	str2[i] = 0x00;
	for (i; i < 300; i++) str1[i] = (char)(rand() % 25 + 65);
	str1[i] = 0x00;
	//-------------Task2
	int k[] = { 100, 50, 25, 20, 10, 5, 4, 2, 1 };
	int res[sizeof(k) / sizeof(int)];
	std::cout << "Исходные строки: " << std::endl;
	std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~первая строка~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
	std::cout << str1 << std::endl;
	std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~вторая строка~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
	std::cout << str2 << std::endl;
	
	std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;


	
	int lx = sizeof(str1);
	int ly = sizeof(str2);

	int s1_size[]{ sz1 / 35, sz1 / 20, sz1 / 15, sz1 / 10, sz1 / 5, sz1 / 2, sz1 };
	int s2_size[]{ sz2 / 25, sz2 / 20, sz2 / 15, sz2 / 10, sz2 / 5, sz2 / 2, sz2 };

	std::cout << "\n\n-- расстояние Левенштейна -----";
	cout << "\n\n--длина --- рекурсия -- дин.програм. ---\n";

	for (int i = 0; i < min(lx, ly); i++)
	{
		t1 = clock();
		levenshtein_r(s1_size[i], str1, s2_size[i], str2);
		t2 = clock();

		t3 = clock();
		levenshtein(s1_size[i], str1, s2_size[i], str2);
		t4 = clock();
		cout << right << setw(2) << s1_size[i] << "/" << setw(2) << s2_size[i]
			<< "        " << left << setw(10) << (t2 - t1)
			<< "   " << setw(10) << (t4 - t3) << endl;
	}



	//---------------------------------------------------------------
	int Mc[N + 1] = { 8,11,19,22,29,39,50}, Ms[N][N], r1 = 0, rd = 0;
	clock_t t5 = 0, t6 = 0, t7 = 0, t8 = 0;
	memset(Ms, 0, sizeof(int)*N*N);
	t5 = clock();
	r1 = OptimalM(1, N, N, Mc, OPTIMALM_PARM(Ms));
	t6 = clock();
	std::cout << std::endl << "-- расстановка скобок (рекурсивное решение) "<< std::endl;
	std::cout << std::endl << "размерности матриц: ";
	for (int i = 1; i <= N; i++) std::cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
	std::cout << std::endl << "минимальное количество операций умножения: " << r1;
	std::cout << std::endl << std::endl << "матрица S" << std::endl;
	for (int i = 0; i < N; i++)
	{
		std::cout << std::endl;
		for (int j = 0; j < N; j++) std::cout << Ms[i][j] << " ";
	}
	std::cout << std::endl;
	memset(Ms, 0, sizeof(int)*N*N);
	t7 = clock();
	rd = OptimalMD(N, Mc, OPTIMALM_PARM(Ms));
	t8 = clock();
	std::cout << std::endl<< "-- расстановка скобок (динамическое программирование) " << std::endl;
	std::cout << std::endl << "размерности матриц: ";
	for (int i = 1; i <= N; i++) std::cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
	std::cout << std::endl << "минимальное количество операций умножения: "<< rd;
	std::cout << std::endl << std::endl << "матрица S" << std::endl;
	for (int i = 0; i < N; i++)
	{
		std::cout << std::endl;
		for (int j = 0; j < N; j++) std::cout << Ms[i][j] << " ";
	}
	std::cout << std::endl << std::endl;
	std::cout << "Время на рекурсию:" << (double)(t6 - t5) / (double)(CLOCKS_PER_SEC) << std::endl;
	std::cout << "Время на динамический:" << (double)(t8 - t7) / (double)(CLOCKS_PER_SEC) << std::endl;
	system("pause");
	return 0;
}


