import OceanVibesVideo from "../../Assets/media/OceanVibesVideo.mp4"
import Statistics from "../../Assets/images/statistics.png"
import AuthGuard from "../AuthGuard";
import css from "./homepage.module.css";
function Homepage(): JSX.Element{
    return (
        <div className="main">
            <video src={OceanVibesVideo} autoPlay loop muted/>
            <div className={css.content}>
                <h1 >Welcome</h1 >
                <p>To Ocean Vibes Statistics.
                    Here you can view and analyze all the data gathered by our vacations site Ocean Vibes™ for better management of vacations and catering the most lucrative deals towards our esteemed customers.<br/><br/>
                    Our Data gatherings collect information such as Likes, User numbers and their relative correspondence towards their Vacations to better our future deals and make the experience of using our services the best it can be.
                </p>
                <img src={Statistics}/>
            </div>
        </div>
    );
}
export default AuthGuard(Homepage)