import React, { useState } from 'react';
import './App.css';

type BtnProps = {
  title: string;
  onClick: () => void;
  disabled: boolean;
};

const Button: React.FC<BtnProps> = (props) => {
  return (
    <button onClick={props.onClick} disabled={props.disabled}>{props.title}</button>
  );
};

const Counter: React.FC = () => {
  const [count, setCount] = useState<number>(7);
  const [inputText, inputTextset] = useState<string>('');


const inputtext = () => {
  inputTextset('hi');
}

  const increaseCount = () => {
    setCount(count - 1);
  };

  const resetCount = () => {
    setCount(7);
  };

  

  return (
    <div className='counter'>
      <h1 className={count === 0 ? 'red': ''}>{count}</h1>
      <Button title="inc" onClick={increaseCount} disabled={count === 0} />
      <Button title="reset" onClick={resetCount} disabled={count === 7} />
      <Button title="btn" onClick={inputtext} disabled = {false}/>
      <input type="text" value={inputText} readOnly/>
      
    </div>
  );
};

export default Counter;