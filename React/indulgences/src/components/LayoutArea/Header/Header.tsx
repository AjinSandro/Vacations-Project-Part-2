import css from "./Header.module.css";
import NavBar from "../NavBar/NavBar";
export function Header(): JSX.Element {
    return (
        
        <div className={css.Header}>
            
            <NavBar />
            
        </div>
    );
}
