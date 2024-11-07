import ReactDOM from 'react-dom/client';
import './index.css';
import reportWebVitals from './reportWebVitals';
import { Layout } from './components/LayoutArea/Layout/Layout';
import { BrowserRouter } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';
import { Provider } from 'react-redux';
import { store } from './Redux/store';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
    <BrowserRouter>
    <Provider store={store}>
        <Layout />
    </Provider>
    </BrowserRouter>
    
);

axios.interceptors.request.use(request => {
    const token = localStorage.getItem('token')
    if(token) {
        request.headers['Authorization'] = `Bearer ${token}`
    }
    return request
})


reportWebVitals();
