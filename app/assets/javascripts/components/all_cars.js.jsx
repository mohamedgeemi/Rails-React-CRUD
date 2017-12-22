var Index = createReactClass({

  render: function() {
    return (
    	  <div>
          <h2> {this.props.data.name} </h2>
          <p>{this.props.data.horsepower}</p>
        </div>
    	)
  }
});

