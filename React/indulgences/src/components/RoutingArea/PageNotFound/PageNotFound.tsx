import css from "./PageNotFound.module.css";
import PageNotFoundPic from "../../../Assets/images/PageNotFoundPic.jpg"

export function PageNotFound(): JSX.Element {
    return (
        <div className={css.PageNotFound}>
			<img src={PageNotFoundPic}/>
        </div>
    );
}
