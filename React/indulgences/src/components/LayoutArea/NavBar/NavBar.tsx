import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import {useCallback} from "react";
import { Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { AppDispatch, RootState } from "../../../Redux/store";
import { UserModel } from "../../../Models/UserModel";
import { logout } from "../../../Redux/users/userActions";

export default function NavBar()  {

    const user = useSelector<RootState, UserModel | null>(
        root => root.userStore.user
    )

    const dispatch = useDispatch<AppDispatch>()

    const AuthButtons = useCallback(() => {
        if(user) {
            return <div style={{display:'flex', alignItems:'center',gap:'.5rem'}}>
                <div>Logged in as {user.firstname}</div>
                <button onClick={() => {
                    const confirmed = window.confirm("Are you sure you want to log out?")
                    if(confirmed) {
                        dispatch(logout())
                    }
                }}>Logout</button>
            </div>
        }
        return <div style={{display:'flex', alignItems:'center',gap:'.5rem'}}>
                <Nav.Link as={Link} to="/login">Login</Nav.Link>
             </div>
    },[user])
    return (
        <Navbar expand="lg" className="bg-body-tertiary">
          <Container 
          style={{
            display:'flex',
            flexDirection:'row',
            alignItems:'center',
            justifyContent:'space-between',
          }}
          >
             <div style={{display:'flex'}}>
            <Navbar.Brand>Ocean Vibes Statistics</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="me-auto">
               
                    <Nav.Link as={Link} to={"/home"}>Home</Nav.Link>
                    <Nav.Link as={Link} to={"/Vacations"}>Stats</Nav.Link>
                    <Nav.Link as={Link} to={"/about"}>About</Nav.Link>
             </Nav>
            </Navbar.Collapse>
            </div>
            <AuthButtons/>
          </Container>
        </Navbar>
      );
}
 