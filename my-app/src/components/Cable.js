import React, { Fragment } from 'react';
import { ActionCable } from 'react-actioncable-provider';


 const Cable = ({ todos ,receiveddata}) => {
  return (
    <Fragment>
      {todos.map(todos => {
        return (
          <ActionCable 
            channel={{ channel: 'TodoChannel'}}
            onReceived={receiveddata}
          />
        );
      })}
    </Fragment>
  );
};

export default Cable;