import { Link, Outlet } from "react-router-dom";
import './css/Header.css'

export function Header(){
    return (
        <>
        <div className={"Header"}>
        <div className={"Links"}>
                <Link to="/movies">Movies</Link>
        </div>
        <div className={"Links"}>
                <Link to="/series">Series</Link>
        </div>
        <div className={"Links"}>
                <Link to="/cartoons">Cartoons</Link>
        </div>
    </div>
            
        </>
    );
}