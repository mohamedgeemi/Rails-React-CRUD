@Car = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.car.name
      React.DOM.td null, @props.car.price
      React.DOM.td null, @props.car.horsepower
      React.DOM.td null, @props.car.model
