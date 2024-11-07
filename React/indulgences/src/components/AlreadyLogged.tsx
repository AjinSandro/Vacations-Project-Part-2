import { FunctionComponent } from "react";
import { useSelector } from "react-redux";
import { RootState } from "../Redux/store";
import { UserModel } from "../Models/UserModel";
import { Navigate } from "react-router-dom";

export default function AlreadyLogged<T>(
    Component: FunctionComponent<T>
) {
    return function ComponentAlreadyLogged(props: T) {
            const user = useSelector<RootState, UserModel | null> (
                root => root.userStore.user
            )
            if(user) {
                return <Navigate to="/home"/>
            }
            return <Component {...props}/>
    }
}