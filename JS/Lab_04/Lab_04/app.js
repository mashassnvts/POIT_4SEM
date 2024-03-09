"use strict";
let prod = {
    shoes: {
        boots: [
            { id: 1, size: 38, color: "Red", price: 190 },
            { id: 2, size: 42, color: "Blue", price: 123 },
            { id: 3, size: 38, color: "Red", price: 130 },
        ],
        sneackers: [
            { id: 4, size: 38, color: "Red", price: 190 },
            { id: 5, size: 42, color: "Red", price: 123 },
            { id: 6, size: 43, color: "Blue", price: 190 },
        ],
        sandals: [
            { id: 7, size: 41, color: "Black", price: 194 },
            { id: 8, size: 38, color: "Red", price: 190 },
            { id: 9, size: 43, color: "Red", price: 122 },
        ],
    },
};
class Shoe {
    constructor(id, size, color, price, sale) {
        this.id = id;
        this.size = size;
        this.color = color;
        this.price = price;
        this.sale = sale;
        this.finalprice = this.price * (1 - this.sale / 100);
    }
    get getCostValue() {
        return this.finalprice;
    }
    set setCostValue(sale) {
        this.sale = sale;
        this.finalprice = this.price * (1 - this.sale / 100);
    }
}
class ProductIterator {
    constructor(pr) {
        this.index = 0;
        this.allShoes = Object["values"](pr.shoes).reduce((acc, curr) => acc.concat(curr), []);
    }
    next() {
        if (this.index < this.allShoes.length)
            return this.allShoes[this.index++];
        else
            return null;
    }
}
let iterator1 = new ProductIterator(prod);
let prr1 = iterator1.next();
while (prr1 != null) {
    console.log(prr1);
    prr1 = iterator1.next();
}
let prod2 = {
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
};
console.log(prod2.shoes);
function filterByCharct(prod, size, price, color) {
    let result = [];
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
let res = filterByCharct(prod2, 42, 110, 'Blue');
console.log(res);
//# sourceMappingURL=app.js.map