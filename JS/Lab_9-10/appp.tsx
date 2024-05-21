// Импортируем необходимые хуки и функции из библиотек
import { useEffect, useState } from 'react';
import { getSudoku } from 'sudoku-gen'; // Функция для генерации судоку
import { Sudoku } from 'sudoku-gen/dist/types/sudoku.type'; // Тип судоку
import './App.css'; // CSS-файл для стилизации компонента

// Основной компонент приложения
function App() {
    // Состояния компонента
    const [sudoku, setSudoku] = useState<string[][]>([]); // Судоку
    const [isSolved, setIsSolved] = useState<boolean>(false); // Флаг решения судоку
    const [highlightedCells, setHighlightedCells] = useState<number[][]>([]); // Выделенные ячейки
    const [isGameStarted, setIsGameStarted] = useState(false); // Флаг начала игры
    const [sudokuData, setSudokuData] = useState<Sudoku>(); // Данные судоку

    // Эффект, срабатывающий при загрузке компонента
    useEffect(() => {
        generateSudoku(); // Генерация судоку
    }, []);

    // Эффект для обработки нажатий клавиш
    useEffect(() => {
        const handleKeyDown = (event: KeyboardEvent) => {
            if (event.key === 'n') {
                generateSudoku(); // Генерация новой игры при нажатии "n"
            } else if (event.key === 'h') {
                hintSudokuBoard(); // Выдача подсказки при нажатии "h"
            }
        };

        document.addEventListener('keydown', handleKeyDown); // Слушатель события нажатия клавиши

        return () => {
            document.removeEventListener('keydown', handleKeyDown); // Удаление слушателя при размонтировании
        };
    }, []);

    // Функция для выдачи подсказки
    function hintSudokuBoard() {
        const emptyCells: number[][] = []; // Массив для хранения пустых ячеек

        // Поиск пустых ячеек
        for (let i = 0; i < 9; i++) {
            for (let j = 0; j < 9; j++) {
                if (sudoku[i] && sudoku[i][j] === '-') {
                    emptyCells.push([i, j]); // Добавление пустой ячейки в массив
                }
            }
        }

        // Выдача подсказки
       // Пока есть пустые ячейки для подсказки
while (emptyCells.length > 0) {
    // Генерируем случайный индекс для выбора случайной пустой ячейки
    const randomIndex = Math.floor(Math.random() * emptyCells.length);
    const [row, col] = emptyCells[randomIndex]; // Получаем координаты выбранной случайной ячейки

    // Получаем действительное (верное) значение для выбранной ячейки из решения судоку
    const validValue = sudokuData?.solution[row * 9 + col];

    // Если для выбранной ячейки есть верное значение в решении
    if (validValue) {
        const updatedSudoku = [...sudoku];
        updatedSudoku[row][col] = validValue; // Обновляем судоку, устанавливая верное значение для выбранной ячейки
        setSudoku(updatedSudoku); // Устанавливаем обновленное судоку в состояние компонента
        break; // Прерываем цикл, так как успешно установили значение для ячейки
    } else {
        emptyCells.splice(randomIndex, 1); // Если для ячейки нет верного значения, удаляем ее из списка пустых
    }
}

    }

    // Функция для генерации новой игры
    function generateSudoku() {
        setIsGameStarted(false); // Сброс флага начала игры
        setHighlightedCells([]); // Очистка выделенных ячеек
        setIsSolved(false); // Сброс флага решения судоку
        const newData = getSudoku(); // Получение новой судоку
        setSudokuData(newData); // Установка данных судоку
        const puzzle: string = newData ? newData.puzzle : ''; // Получение головоломки судоку
        const parsedSudoku: string[][] = parsePuzzle(puzzle); // Парсинг головоломки в двумерный массив
        setSudoku(parsedSudoku); // Установка судоку
    }

    // Функция для парсинга головоломки судоку в двумерный массив
  // Функция для парсинга строки судоку в двумерный массив
function parsePuzzle(puzzleString: string): string[][] {
    // Разбиваем строку судоку на массив символов
    const puzzleArray: string[] = puzzleString.split('');
    // Создаем пустой массив для представления двумерного массива судоку
    const sudokuArray: string[][] = [];

    // Проходим по каждой строке судоку (в классическом судоку их 9)
    for (let i = 0; i < 9; i++) {
        // Извлекаем подстроку из массива символов для текущей строки
        const row: string[] = puzzleArray.slice(i * 9, (i + 1) * 9);
        // Добавляем эту подстроку в массив для текущей строки судоку
        sudokuArray.push(row);
    }

    // Возвращаем полученный двумерный массив судоку
    return sudokuArray;
}

  // Функция обработки клика по ячейке судоку
const handleCellClick = (rowIndex: number, cellIndex: number) => {
    // Запрос у пользователя ввода числа от 1 до 9
    const number = prompt('Введите число (1-9):');

    // Проверка наличия введенного числа
    if (number !== null) {
        // Преобразование введенного числа в целое число
        const inputNumber = parseInt(number);

        // Проверка, что введенное значение является числом от 1 до 9
        if (!isNaN(inputNumber) && inputNumber >= 0 && inputNumber <= 9) {
            // Создание копии текущего состояния судоку
            const updatedSudoku = [...sudoku];

            // Обновление значения ячейки в судоку
            updatedSudoku[rowIndex][cellIndex] = inputNumber === 0 ? '' : inputNumber.toString();

            // Фильтрация выделенных ячеек, исключая текущую ячейку
            const updatedHighlightedCells = highlightedCells.filter(
                ([row, col]) => row !== rowIndex && col !== cellIndex
            );

            // Проверка конфликтов в строке
            // Проверка конфликтов в строке

            /*Этот код фильтрует значения в текущей строке судоку (updatedSudoku[rowIndex]) и создает массив rowConflicts, 
            содержащий только те значения, которые равны введенному числу (number) и находятся в ячейках, отличных от текущей 
            (index !== cellIndex).*/
const rowConflicts = updatedSudoku[rowIndex].filter((value, index) => {
    // Исключение текущей ячейки из проверки
    return index !== cellIndex && value === number;
});ы
            
            if (rowConflicts.length > 0) {
                // Добавление всех ячеек текущей строки в список выделенных ячеек
                for (let i = 0; i < 9; i++) {

                    //Этот код добавляет координаты выделенных ячеек текущей строки в массив updatedHighlightedCells. 
                    //Каждая ячейка представлена парой [rowIndex, i], где rowIndex - индекс текущей строки, а i - индекс ячейки в строке.
                  // Добавление выделенных ячеек текущей строки в список выделенных ячеек
updatedHighlightedCells.push([rowIndex, i]);
                }
            }

            //Этот код создает массив columnConflicts, фильтруя значения в текущем столбце судоку. Функция map() используется для 
            //получения значений из всех строк updatedSudoku, соответствующих cellIndex (текущему столбцу). Затем с помощью filter() 
            //из этих значений выбираются только те, которые равны введенному числу (number) и находятся в ячейках, отличных от текущей строки (index !== rowIndex).
            // Проверка конфликтов в столбце
            // Проверка конфликтов в столбце
const columnConflicts = updatedSudoku.map((row) => row[cellIndex]).filter((value, index) => {
    // Исключение текущей ячейки из проверки
    return index !== rowIndex && value === number;
});
            
            if (columnConflicts.length > 0) {
                // Добавление всех ячеек текущего столбца в список выделенных ячеек
                for (let i = 0; i < 9; i++) {
                    updatedHighlightedCells.push([i, cellIndex]);
                }
            }

            // Определение начальной позиции блока
            const blockStartRow = Math.floor(rowIndex / 3) * 3;
            const blockStartCol = Math.floor(cellIndex / 3) * 3;

            // Проверка конфликтов в блоке
            // Создание массива для хранения координат ячеек блока, создающих конфликт
const blockConflicts = [];

// Перебор всех ячеек в текущем блоке
for (let i = blockStartRow; i < blockStartRow + 3; i++) {
    for (let j = blockStartCol; j < blockStartCol + 3; j++) {
        // Проверка, что ячейка не является текущей и содержит введенное число
        if (!(i === rowIndex && j === cellIndex) && updatedSudoku[i][j] === number) {
            // Если условие выполняется, координаты ячейки добавляются в массив конфликтов
            blockConflicts.push([i, j]);
        }
    }
}
            if (blockConflicts.length > 0) {
                // Добавление всех ячеек блока в список выделенных ячеек
                blockConflicts.forEach(([row, col]) => {
                    updatedHighlightedCells.push([row, col]);
                });

                // Добавление всех ячеек блока в список выделенных ячеек (дублируется для подсветки)
                for (let i = blockStartRow; i < blockStartRow + 3; i++) {
                    for (let j = blockStartCol; j < blockStartCol + 3; j++) {
                        updatedHighlightedCells.push([i, j]);
                    }
                }
            }

            // Установка обновленных выделенных ячеек
            setHighlightedCells(updatedHighlightedCells);

            // Установка обновленного судоку
            setSudoku(updatedSudoku);
        }
    }
}

// useEffect для обновления выделенных ячеек при изменении статуса решения судоку
// Если судоку решено (isSolved === true), сбрасываем выделение ячеек
useEffect(() => {
    if (isSolved) {
        setHighlightedCells([]); // Сбрасываем выделение ячеек
    }
}, [isSolved]);

// Функция для проверки корректности заполнения судоку
function checkSudoku() {
    let isValid = true;

    // Проверяем корректность заполнения строк
  // Перебор всех строк судоку
for (let i = 0; i < 9; i++) {
    // Получение текущей строки судоку
    const row = sudoku[i];

    // Создание множества (Set), содержащего уникальные значения текущей строки
    const rowSet = new Set(row);


        // Если в строке есть повторяющиеся значения, судоку неверно заполнено
        if (rowSet.size !== 9) {
            isValid = false;
            break;
        }
    }

    // Если строки заполнены корректно, проверяем столбцы
   // Проверка, что все строки судоку прошли проверку на уникальность
if (isValid) {
    // Перебор всех столбцов судоку
    for (let j = 0; j < 9; j++) {
        // Получение текущего столбца судоку
        const column = sudoku.map((row) => row[j]);

        // Создание множества (Set), содержащего уникальные значения текущего столбца
        const columnSet = new Set(column);


            // Если в столбце есть повторяющиеся значения, судоку неверно заполнено
            if (columnSet.size !== 9) {
                isValid = false;
                break;
            }
        }
    }

    // Если и строки, и столбцы заполнены корректно, проверяем блоки 3x3
    if (isValid) {
        for (let blockRow = 0; blockRow < 3; blockRow++) {
            for (let blockCol = 0; blockCol < 3; blockCol++) {
                const block = [];

                // Собираем значения из блока 3x3
                for (let i = 0; i < 3; i++) {
                    for (let j = 0; j < 3; j++) {
                        block.push(sudoku[blockRow * 3 + i][blockCol * 3 + j]);
                    }
                }

                const blockSet = new Set(block);

                // Если в блоке есть повторяющиеся значения, судоку неверно заполнено
                if (blockSet.size !== 9) {
                    isValid = false;
                    break;
                }
            }
        }
    }

    // Устанавливаем статус решения судоку (isSolved) в соответствии с результатом проверки
    setIsSolved(isValid);

    // Если судоку неверно заполнено, выводим сообщение об ошибке
    if (!isValid) {
        alert('Поле пока заполнено неверно');
    }
}

// Возвращаем JSX с разметкой для отображения судоку и кнопок управления
return (
    <div>
        <table className={`sudoku-board ${isSolved ? 'solved' : ''} ${isGameStarted ? 'game-started' : ''}`}>
            <tbody>
                {/* Отображаем судоку в виде таблицы */}
                {sudoku.map((row: string[], rowIndex: number) => (
                    <tr key={rowIndex}>
                        {row.map((cell: string, cellIndex: number) => {
                            const isHighlightedCell = highlightedCells.some(([r, c]) => r === rowIndex && c === cellIndex);

                            return (
                                <td
                                    key={cellIndex}
                                    // Добавляем классы для стилизации ячеек судоку в зависимости от их состояния
                                    className={`sudoku-cell ${isSolved ? 'solved-cell' : (cell ? (isHighlightedCell ? 'invalid-cell' : 'valid-cell') : '')}`}
                                    onClick={() => handleCellClick(rowIndex, cellIndex)}
                                    data-row={rowIndex}
                                    data-cell={cellIndex}
                                >
                                    {/* Выводим значение ячейки, если оно не равно '-' */}
                                    {cell !== '-' ? cell : ''}
                                    {/* Выводим индикаторы выделения для ячеек судоку */}
                                    {isHighlightedCell && <span className="invalid-cell"></span>}
                                    {!isHighlightedCell && <span className="valid-cell"></span>}
                                </td>
                            );
                        })}
                    </tr>
                ))}
            </tbody>
        </table>
        {/* Кнопки управления */}
        <div className="button-container">
            <button onClick={checkSudoku}>Проверить поле</button>
            <button onClick={generateSudoku}>Новая игра</button>
            <button onClick={hintSudokuBoard}>Подсказка</button>
        </div>
    </div>
);
}
// Экспортируем компонент App для использования в других частях приложения
export default App;
