import React from 'react';
import ReactDOM from 'react-dom';
import { ActionCableProvider } from 'react-actioncable-provider';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import { API_WS_ROOT } from './constants';

ReactDOM.render(
			<ActionCableProvider url={API_WS_ROOT}>
   			 <App/>
  			</ActionCableProvider>,  
  	 document.getElementById('root')
  	 );
registerServiceWorker();
