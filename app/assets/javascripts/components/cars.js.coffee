@Cars = React.createClass
  getInitialState: ->
    cars: @props.data
  getDefaultProps: ->
    cars: []
  render: ->
    React.DOM.div
      className: 'cars'
      React.DOM.h1
        className: 'title'
        'Cars'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Price'
            React.DOM.th null, 'Horsepower'
            React.DOM.th null, 'Model Type'
        React.DOM.tbody null,
         for car in @state.cars
          React.createElement Car, key: car.id, car: car
