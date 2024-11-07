import { Header } from "../Header/Header";
import css from "./Layout.module.css";
import { Footer } from "../Footer/Footer";
import Homepage from "../../Homepage/homepage";
import { Routing } from "../../RoutingArea/Routing/Routing";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { AppDispatch, RootState } from "../../../Redux/store";
import { userDetails } from "../../../Redux/users/userActions";


export function Layout(): JSX.Element {

    const token = useSelector<RootState, string |null>(root => root.userStore.token)

    const dispatch = useDispatch<AppDispatch>()
    useEffect(() => {
        if(token) {
            dispatch(userDetails())
        }
    },[token])

    return (
        <div className={css.Layout}>
        
        <header>
            <Header />
            
        </header>
        
        <main>
            <Routing />
        </main>

        <footer>
            <Footer />
        </footer>

        </div>

    );
}
