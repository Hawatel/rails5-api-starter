import React from 'react';
import axios from 'axios';
import List from './List';

export default class TodoList extends React.Component {   

	constructor(props) {
        super(props);
        this.onChangeTitle = this.onChangeTitle.bind(this);
        this.onChangeOrder = this.onChangeOrder.bind(this);
        this.onChangeComplete = this.onChangeComplete.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
        this.Todo = {
           title: '',
           order: '',
           completed:''
        }
         this.state = {
      value: 'true'
    }
    }
    onChangeTitle(e) {
        this.setState({
            title: e.target.value
        });
    }
    onChangeOrder(e) {
            this.setState({
            order: e.target.value
        });
    }
    onChangeComplete(e) {
    	this.setState({
            completed: e.target.value
        });    
    }

	onSubmit(e) {
        e.preventDefault();
        const NewTodo = {
            title: this.state.title,
            completed: this.state.completed,
            order: this.state.order
        }
        console.log(NewTodo);
        axios.post('http://localhost:3000/api/v1/todos/createtodo', NewTodo)
        .then(res => console.log(res.data));

        this.setState({
           title: '',
           order: '',
           completed:''
        })
    }

	render() {
        return (
            <div style={{marginTop: 50}}>
                <h3>Add New Todo</h3>
                <form onSubmit={this.onSubmit}>
                    <div className="form-group">
                        <label>Title </label>
                        <input type="text" className="form-control" onChange={this.onChangeTitle} required/>
                    </div>
                    <div className="form-group">
                        <label>Order</label>
                        <input type="number" className="form-control" onChange={this.onChangeOrder} required/>
                    </div>
                      <div className="form-group">
                    <select  onChange={this.onChangeComplete} defaultvalue={this.state.value} className="form-control" required>
                       <option hidden="true">Select</option>
                        <option value="true" >True</option>
                        <option value="false" >False</option>
                    </select>
                    </div>
                    <div className="form-group">
                        <input type="submit" value="Add" className="btn btn-primary"/>
                    </div>
                  

                </form>
                
                   <List></List>
            </div> 
        )
    }

}