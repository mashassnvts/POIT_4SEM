import { useEffect, useState } from "react";
import { getSudoku } from "sudoku-gen";
import { Sudoku } from "sudoku-gen/dist/types/sudoku.type";
import "./App.css";

function App() {
  const [sudoku, setSudoku] = useState<string[][]>([]);
  const [isSolved, setIsSolved] = useState<boolean>(false);
  const [isHintAdded, setIsHintAdded] = useState<boolean>(false);
  const [highlightedCells, setHighlightedCells] = useState<number[][]>([]);
  const [isGameStarted, setIsGameStarted] = useState(false);
  const [sudokuData, setSudokuData] = useState<Sudoku>();

  useEffect(() => {
    generateSudoku();
  }, []);

  useEffect(() => {
    if (!isHintAdded) {
      generateSudoku();
    }
  }, [isHintAdded]);

  useEffect(() => {
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === "f") hintSudokuBoard();
      if (event.key === "n") generateSudoku();
    };
    document.addEventListener("keydown", handleKeyDown);
    return () => {
      document.removeEventListener("keydown", handleKeyDown);
    };
  });

  //подсказка
  function hintSudokuBoard() {
    const emptyCells: number[][] = [];

    for (let i = 0; i < 9; i++) {
      for (let j = 0; j < 9; j++) {
        if (sudoku[i] && sudoku[i][j] === "-") {
          emptyCells.push([i, j]);
        }
      }
    }
    //выдача подсказки
    while (emptyCells.length > 0) {
      const randomIndex = Math.floor(Math.random() * emptyCells.length);
      const [row, col] = emptyCells[randomIndex]; //координаты случайной ячейки

      const validValue = sudokuData?.solution[row * 9 + col];
      if (validValue) {
        const updatedSudoku = [...sudoku];
        updatedSudoku[row][col] = validValue;
        setSudoku(updatedSudoku);
        setIsHintAdded(true);
        break;
      } else {
        emptyCells.splice(randomIndex, 1); //если значение не действительное, удаляем ячейку из списка пустых
      }
    }
  }
  function generateSudoku() {
    setIsGameStarted(false);
    setHighlightedCells([]);
    setIsSolved(false);
    const newData = getSudoku();
    setSudokuData(newData);
    const puzzle: string = newData ? newData.puzzle : "";
    const parsedSudoku: string[][] = parsePuzzle(puzzle);
    setSudoku(parsedSudoku);
  }

  //парсинг строки судоку в двумерный массив
  function parsePuzzle(puzzleString: string): string[][] {
    const puzzleArray: string[] = puzzleString.split("");
    const sudokuArray: string[][] = [];

    for (let i = 0; i < 9; i++) {
      const row: string[] = puzzleArray.slice(i * 9, (i + 1) * 9);
      sudokuArray.push(row);
    }

    return sudokuArray;
  }

  const handleCellClick = (rowIndex: number, cellIndex: number) => {
    const number = prompt("Введите число (1-9):");
    if (number !== null) {
      const inputNumber = parseInt(number);
      if (!isNaN(inputNumber) && inputNumber >= 0 && inputNumber <= 9) {
        const updatedSudoku = [...sudoku];
        updatedSudoku[rowIndex][cellIndex] =
          inputNumber === 0 ? "" : inputNumber.toString();

        const updatedHighlightedCells = highlightedCells.filter(
          ([row, col]) => row !== rowIndex && col !== cellIndex
        );

        const rowConflicts = updatedSudoku[rowIndex].filter(
          (value, index) => index !== cellIndex && value === number
        );
        if (rowConflicts.length > 0) {
          for (let i = 0; i < 9; i++) {
            updatedHighlightedCells.push([rowIndex, i]);
          }
        }

        const columnConflicts = updatedSudoku
          .map((row) => row[cellIndex])
          .filter((value, index) => index !== rowIndex && value === number);
        if (columnConflicts.length > 0) {
          for (let i = 0; i < 9; i++) {
            updatedHighlightedCells.push([i, cellIndex]);
          }
        }

        const blockStartRow = Math.floor(rowIndex / 3) * 3;
        const blockStartCol = Math.floor(cellIndex / 3) * 3;
        const blockConflicts = [];
        for (let i = blockStartRow; i < blockStartRow + 3; i++) {
          for (let j = blockStartCol; j < blockStartCol + 3; j++) {
            if (
              !(i === rowIndex && j === cellIndex) &&
              updatedSudoku[i][j] === number
            ) {
              blockConflicts.push([i, j]);
            }
          }
        }
        if (blockConflicts.length > 0) {
          blockConflicts.forEach(([row, col]) => {
            updatedHighlightedCells.push([row, col]);
          });

          for (let i = blockStartRow; i < blockStartRow + 3; i++) {
            for (let j = blockStartCol; j < blockStartCol + 3; j++) {
              updatedHighlightedCells.push([i, j]);
            }
          }
        }

        setHighlightedCells(updatedHighlightedCells);
        setSudoku(updatedSudoku);
      }
    }
  };

  useEffect(() => {
    if (isSolved) {
      checkSudoku();
    }
  }, [isSolved]);

  function checkSudoku() {
    let isValid = true;
    for (let i = 0; i < 9; i++) {
      const row = sudoku[i];
      const rowSet = new Set(row);

      if (rowSet.size !== 9) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      for (let j = 0; j < 9; j++) {
        const column = sudoku.map((row) => row[j]);
        const columnSet = new Set(column);

        if (columnSet.size !== 9) {
          isValid = false;
          break;
        }
      }
    }

    if (isValid) {
      for (let blockRow = 0; blockRow < 3; blockRow++) {
        for (let blockCol = 0; blockCol < 3; blockCol++) {
          const block = [];

          for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 3; j++) {
              block.push(sudoku[blockRow * 3 + i][blockCol * 3 + j]);
            }
          }

          const blockSet = new Set(block);

          if (blockSet.size !== 9) {
            isValid = false;
            break;
          }
        }
      }
    }

    setIsSolved(isValid);

    if (!isValid) {
      alert("Поле пока заполнено неверно");
    }
  }

  return (
    <div>
      <table
        className={`sudoku-board ${isSolved ? "solved" : ""} ${
          isGameStarted ? "game-started" : ""
        }`}
      >
        <tbody>
          {sudoku.map((row: string[], rowIndex: number) => (
            <tr key={rowIndex}>
              {row.map((cell: string, cellIndex: number) => {
                const isHighlightedCell = highlightedCells.some(
                  ([r, c]) => r === rowIndex && c === cellIndex
                );

                return (
                  <td
                    key={cellIndex}
                    className={`sudoku-cell ${
                      isSolved
                        ? "solved-cell"
                        : cell
                        ? isHighlightedCell
                          ? "invalid-cell"
                          : "valid-cell"
                        : ""
                    }`}
                    onClick={() => handleCellClick(rowIndex, cellIndex)}
                    data-row={rowIndex}
                    data-cell={cellIndex}
                  >
                    {cell !== "-" ? cell : ""}
                    {isHighlightedCell && (
                      <span className="invalid-cell"></span>
                    )}
                    {!isHighlightedCell && <span className="valid-cell"></span>}
                  </td>
                );
              })}
            </tr>
          ))}
        </tbody>
      </table>
      <div className="button-container">
        <button onClick={checkSudoku}>Проверить поле</button>
        <button onClick={generateSudoku}>Новая игра</button>
        <button onClick={hintSudokuBoard}>Подсказка</button>
      </div>
    </div>
  );
}

export default App;
