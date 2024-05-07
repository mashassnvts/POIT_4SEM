#include "Graph.h" // ���������� ������������ ���� "Graph.h"

namespace graph
{
	// ����������� ��� �������� ������ ������� ��������� ��������� �������
	AMatrix::AMatrix(int n)
	{
		this->n_vertex = n; // ������������� ���������� ������
		this->mr = new int[this->n_vertex * this->n_vertex]; // �������� ������ ��� �������
		for (int i = 0; i < n * n; i++) mr[i] = 0; // �������������� ������� ������
	}

	// ����������� ��� �������� ������� ��������� �� ����������� ������� mr
	AMatrix::AMatrix(int n, int mr[])
	{
		this->n_vertex = n; // ������������� ���������� ������
		this->mr = mr; // ���������� ���������� ������
	}

	// ����������� ����������� ��� �������� ������� ��������� �� ������ ������ ������� am
	AMatrix::AMatrix(const AMatrix& am)
	{
		this->n_vertex = am.n_vertex; // ������������� ���������� ������
		this->mr = new int[this->n_vertex * this->n_vertex]; // �������� ������ ��� ����� �������
		for (int i = 0; i < this->n_vertex; i++)
			for (int j = 0; j < this->n_vertex; j++)
				this->set(i, j, am.get(i, j)); // �������� �������� �� ������� am
	}

	// ����������� ��� �������� ������ ��������� �� ����������� ������
	AMatrix::AMatrix(const AList& al)
	{
		this->n_vertex = al.n_vertex; // ������������� ���������� ������
		this->mr = new int[this->n_vertex * this->n_vertex]; // �������� ������ ��� �������
		for (int k = 0; k < this->n_vertex * this->n_vertex; k++) mr[k] = 0; // �������������� ������� ������
		for (int i = 0; i < this->n_vertex; i++)
			for (int j = 0; j < al.size(i); j++) this->set(i, al.get(i, j), 1); // ��������� ������� �� ������
	}

	// ����� ��� ��������� �������� � ������ (i, j) �������
	void AMatrix::set(int i, int j, int r)
	{
		this->mr[i * this->n_vertex + j] = r; // ������������� �������� � ��������������� ������
	}

	// ����� ��� ��������� �������� �� ������ (i, j) �������
	int AMatrix::get(int i, int j) const
	{
		return this->mr[i * this->n_vertex + j]; // ���������� �������� �� ��������������� ������
	}

	// ����� ��� �������� ������� ������ ��������� ��������� �������
	void AList::create(int n)
	{
		this->mr = new std::list<int>[this->n_vertex = n]; // �������� ������ ��� ������� �������
	}

	// ����������� ��� �������� ������� ������ ��������� ��������� �������
	AList::AList(int n)
	{
		create(n); // ������� ������ ���������
	}

	// ����������� ��� �������� ������ ��������� �� ������� ��������� am
	AList::AList(const AMatrix& am)
	{
		create(am.n_vertex); // ������� ������ ��������� ��������� �������
		for (int i = 0; i < this->n_vertex; i++)
			for (int j = 0; j < this->n_vertex; j++)
				if (am.get(i, j) != 0) this->add(i, j); // ��������� ����� � ������ �� ��������� ��������� �������
	}

	// ����������� ����������� ��� �������� ������ ��������� �� ������ ������� ������ al
	AList::AList(const AList& al)
	{
		create(al.n_vertex); // ������� ������ ��������� ��������� �������
		for (int i = 0; i < this->n_vertex; i++)
			for (int j = 0; j < al.size(i); j++) this->add(i, al.get(i, j)); // ��������� ����� �� ������ al
	}

	// ����������� ��� �������� ������ ��������� �� ����������� ������� mr
	AList::AList(int n, int mr[])
	{
		create(n); // ������� ������ ��������� ��������� �������
		for (int i = 0; i < this->n_vertex; i++)
			for (int j = 0; j < this->n_vertex; j++)
				if (mr[i * this->n_vertex + j] != 0) this->add(i, j); // ��������� ����� �� ��������� ��������� �������
	}

	// ����� ��� ���������� ����� �� ������� i � ������� j � ������ ���������
	void AList::add(int i, int j)
	{
		this->mr[i].push_back(j); // ��������� ������� j � ������ ������� i
	}

	// ����� ��� ��������� ���������� ������� ������ ��� ������� i
	int AList::size(int i) const
	{
		return (int)this->mr[i].size(); // ���������� ������ ������ ��������� ��� ������� i
	}

	// ����� ��� ��������� j-�� ������� ������� ��� ������� i
	int AList::get(int i, int j) const
	{
		std::list<int>::iterator rc = this->mr[i].begin(); // �������� ��� ������ ������� i
		for (int k = 0; k < j; k++) rc++; // ���������� �������� �� ������ �������
		return (int)*rc; // ���������� �������� �� ������� j
	}
}
