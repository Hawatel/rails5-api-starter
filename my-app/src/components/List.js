import React from 'react';
import { API_ROOT } from '../constants';
import Cable  from "actioncable";

export default class List extends React.Component {   

	constructor(props) {
            super(props);      
            this.state = {dataList: []}; 
    }
    componentDidMount(){
       fetch(`${API_ROOT}/todos`)
      .then(res => res.json())
      .then(todos => this.setState({todos}));
     let cable = Cable.createConsumer("ws://localhost:3000/cable");
    this.chats = cable.subscriptions.create(
      {
        channel: "TodoChannel"
      },
      {
        connected: () => {
          
        },
        received: dataList => {
             this.setState({dataList:JSON.parse(dataList)});
        },
        create: function(   ) {          
        }
      }
    );

    }
	render() {
        if(!this.state.dataList.length)
            return null;
        return (
            <div style={{marginTop: 50}}>               
                
        <table className="table table-striped">
            <thead>
                <tr>
                <td>Order No.</td>
                  <td>Title</td>
                  <td>Order</td>
                </tr>
              </thead  >
                     {this.state.dataList.map((data,index) => (
                      <tbody key={index} >
                          <tr>
                              <td>{index+1}</td>
                              <td>{data.title}</td>
                              <td>{data.order}</td>
                              
                          </tr> 
                      </tbody>
                    ))}
              
            </table>                 
            </div> 
        )
    }

}