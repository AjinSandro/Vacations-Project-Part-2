import css from "./About.module.css";
import about from "../../../Assets/images/about.jpg"
export function About(): JSX.Element {
    return (
        
    <div style={{ padding: '20px', textAlign: 'left' }}>
    <h2>About Ocean Vibes Statistics</h2>
    <p>
      <strong>Ocean Vibes Statistics</strong> is a dynamic and intuitive data analysis platform developed as part of the <strong>Ocean Vibes™</strong> project. Designed to provide insightful analytics and visualizations, the platform leverages a combination of powerful technologies to offer an interactive and seamless experience for the administrators.
    </p>
    <p>
      This project was created by <strong>Alexander K.</strong>, with the goal of offering a viewer-friendly interface for exploring and analyzing vacation and user-related data in real-time.
    </p>
    <h3>Technologies Used:</h3>
    <p>
      Ocean Vibes Statistics is powered by a robust tech stack, combining backend and frontend technologies to create a scalable, secure, and high-performance application.
    </p>
    <ul>
      <li><strong>Backend:</strong>
        <ul>
          <li><strong>Django</strong>: A powerful and flexible Python web framework used for building the API, handling data management, and ensuring seamless user authentication and authorization.</li>
          <li><strong>Flask</strong>: A lightweight Python web framework used for handling specific microservices and lightweight data processing tasks.</li>
          <li><strong>MySQL</strong>: A reliable and fast relational database that stores and manages large datasets.</li>
        </ul>
      </li>
      <li><strong>Frontend:</strong>
        <ul>
          <li><strong>React</strong>: A modern JavaScript library for building responsive and interactive user interfaces, ensuring an excellent user experience.</li>
        </ul>
      </li>
      <li><strong>DevOps:</strong>
        <ul>
          <li><strong>Docker</strong>: Containerization of the application for consistent environments across development, testing, and production.</li>
        </ul>
      </li>
      <li><strong>API Testing & Documentation:</strong>
        <ul>
          <li><strong>Postman</strong>: Utilized for thorough API testing and ensuring robust and error-free data exchange between the frontend and backend.</li>
        </ul>
      </li>
    </ul>
    <div style={{ textAlign: 'center', marginTop: '20px' }}>
        <img src={about} alt="About Ocean Vibes" style={{ width: '60%', maxWidth: '500px' }} />
      </div>
        </div>
    );
}
