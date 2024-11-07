import { useState } from "react";
import {CredentialModel} from "../../../Models/CredentialModel"
import css from "./Login.module.css";
import { notify } from "../../../Utils/Notify";
import { useNavigate } from "react-router";
import { useDispatch } from "react-redux";
import { AppDispatch } from "../../../Redux/store";
import * as userActions from '../../../Redux/users/userActions'
import AlreadyLogged from "../../AlreadyLogged";
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';;

function Login(): JSX.Element {
    const [user, setUser] = useState<CredentialModel>(new CredentialModel())
    const navigate = useNavigate();
    const dispatch = useDispatch<AppDispatch>()
    function userChange(event:any){
        console.log(event.target.value); 
        if(event.target.name==="email"){
            user.email = event.target.value;
        }
        else if(event.target.name==="password"){
            user.password = event.target.value;
        }
        setUser({...user});
    }

    async function login(){
        try{
            await dispatch(userActions.login(user))
            navigate("/home")
        }
        catch(err:any){
            notify.error(err.message); 
        }   
    }
    return (
<div className={css.Login}>
    <div className={css.loginContainer}>
    <h1 className={css.loginTitle}>Login</h1>
    </div>
    <form>
        <TextField 
            
            label="Email" 
            variant="outlined" 
            type="email" 
            name="email" 
            onChange={userChange} 
            fullWidth 
            margin="normal" 
        />
        <TextField 
            
            label="Password" 
            variant="outlined" 
            type="password" 
            name="password" 
            onChange={userChange} 
            fullWidth 
            margin="normal" 
        />
    </form>
    <Button onClick={login} variant="contained">Login</Button>
</div>
    );
}

export default AlreadyLogged(Login)