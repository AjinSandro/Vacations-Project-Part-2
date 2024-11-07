
import "./Routing.css";
import {Routes , Route} from "react-router-dom"
import Homepage from "../../Homepage/homepage";
import { About } from "../../AboutArea/About/About";
import Vacations from "../../VacationsArea/Vacations/Vacations";
import { PageNotFound } from "../PageNotFound/PageNotFound";
import Login from "../../UserArea/Login/Login";
export function Routing(): JSX.Element {
    return (
        <div className="Routing">
			<Routes>
                <Route path="/" element={<Homepage/>}/>
                <Route path="/home" element={<Homepage/>}/>
                <Route path="/about" element={<About/>}/>
                <Route path="/Vacations" element={<Vacations/>}/>
                <Route path="*" element={<PageNotFound/>}/>
                <Route path="/login" element={<Login/>} />
            </Routes>
        </div>
    );
}
