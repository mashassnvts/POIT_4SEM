    /*1.	Хранилище всего имеющегося товара в интернет-магазине представляет собой объект products.  Весь товар разделен на категории, одна из них «Обувь», 
    которая в свою очередь делится на виды «Ботинки», «Кроссовки», «Сандалии». О каждой паре обуви хранится следующая информация: уникальный номер товара, размер обуви, цвет, цена. */
    type id = number;
    type size = number;
    type color = string;
    type price = number;

    type shoe = {id:id, size:size, color:color, price:price};
    type shoes = {boots: shoe[], sneackers: shoe[], sandals: shoe[]};
    type products = {shoes: shoes};

    let pro: products = {
        shoes:{
            boots:[
                { id: 1, size: 38, color: "Red", price: 190 },
                { id: 2, size: 42, color: "Blue", price: 123 },
                { id: 3, size: 38, color: "Red", price: 130 },
            ],
            sneackers:[
                { id: 4, size: 38, color: "Red", price: 190 },
                { id: 5, size: 42, color: "Red", price: 123 },
                { id: 6, size: 43, color: "Blue", price: 190 },
            ],
            sandals:[
                { id: 7, size: 41, color: "Black", price: 194 },
                { id: 8, size: 38, color: "Red", price: 190 },
                { id: 9, size: 43, color: "Red", price: 122 },
            ],
        },
    };
    /*5.	Добавьте в описание товара новые свойства: «скидка» и «конечная стоимость» (стоимость с учетом скидки). 
    Добавьте геттер и сеттер для свойства «конечная стоимость», учитывая то, что свойства «скидка» и «конечная стоимость» взаимозависимые.*/
    class Shoe{
        id: id;
        size: size;
        color: color;
        price: price;
        sale: number;
        finalprice: number
        constructor(id: id, size: size, color: color, price: price, sale: number) {
            this.id = id;
            this.size = size;
            this.color = color;
            this.price = price;
            this.sale = sale;
            this.finalprice = this.price*(1-this.sale/100);
        }
        public get getValue() : number {
            return this.finalprice;
        }
        public set setValue(sale : number) {
            this.sale = sale
            this.finalprice = this.price*(1-this.sale/100);
        }
    }

    /*2.	Реализуйте итератор для объекта products для доступа к каждому товару.*/
    class ProIterator{
        index: number;
        allShoes: shoe[] = [];

        constructor(pr: products){
            this.index = 0;
            this.allShoes = Object["values"](pr.shoes).reduce((acc: shoe[], curr: shoe[]) => acc.concat(curr), []);
        }
        public next(): shoe | null{
            if(this.index < this.allShoes.length)
                return this.allShoes[this.index++];
            else
                return null;
        }
    }

    let iterator1: ProIterator = new ProIterator(pro);
    let prr1: any = iterator1.next();

    while (prr1 != null) {
        console.log(prr1);
        prr1 = iterator1.next();
    }


    /*3.	Реализуйте фильтр обуви по цене в заданном диапазоне, по заданному размеру, по заданному цвету. Выведите номера товаров, соответствующих заданному условию (фильтру).*/
    let pro1: products = {
        shoes: {
            boots: [
                new Shoe(1, 38, "Red", 120, 10),
                new Shoe(2, 42, "Blue", 110, 15),
                new Shoe(3, 43, "Black", 130, 11)
            ],
            sneackers: [
                new Shoe(4, 38, "Black", 140, 12),
                new Shoe(5, 42, "Red", 115, 13),
                new Shoe(6, 43, "Blue", 145, 15)
            ],
            sandals: [
                new Shoe(7, 41, "Blue", 125, 20),
                new Shoe(8, 38, "Black", 105, 16),
                new Shoe(9, 43, "Red", 135, 17)
            ]
        }
    }
    console.log(pro1.shoes);

    function filter(prod: products, size: size, price: price, color: color) {
        let result: shoe[] = [];
        prod.shoes.boots.forEach(item => {
            if (item.color == color && item.size == size && item.price == price) {
                result.push(item);
            }
        });
        prod.shoes.sneackers.forEach(item => {
            if (item.color == color && item.size == size && item.price == price) {
                result.push(item);
            }
        });
        prod.shoes.sandals.forEach(item => {
            if (item.color == color && item.size == size && item.price == price) {
                result.push(item);
            }
        });
        return result;
    }

    let res: shoe[] = filter(pro1, 42, 110, 'Blue');
    console.log(res);




