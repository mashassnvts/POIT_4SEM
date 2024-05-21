import { Link } from 'react-router-dom'
import './css/Footer.css'

export function Footer(){
    return(
        <footer>
                <hr/>
                <div className="symbols">
                <a href='https://github.com/mashassnvts'><img width="50" height="50" src="https://gitlab.com/uploads/-/system/group/avatar/10532272/github.png"  className='symbol'/></a>
                </div>
        </footer>
    )
}