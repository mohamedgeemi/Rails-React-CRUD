@Cars = React.createClass
  getInitialState: ->
    cars: @props.data
  getDefaultProps: ->
    cars: []
  addCar: (car) ->
    cars = @state.cars.slice()
    cars.push car
    @setState cars: cars
  deleteCar: (car) ->
    cars = @state.cars.slice()
    index = cars.indexOf car
    cars.splice index, 1
  updateCar: (car, data) ->
    index = @state.cars.indexOf car
    cars = React.addons.update(@state.cars, { $splice: [[index, 1, data]] })
    @replaceState cars: cars

  render: ->
    React.DOM.div
      className: 'cars'
      React.DOM.h1
        className: 'title'
        'Cars Application'
      React.createElement CarForm, handleNewCar: @addCar
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Price'
            React.DOM.th null, 'Horsepower'
            React.DOM.th null, 'Model Type'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
         for car in @state.cars
          React.createElement Car, key: car.id, car: car, handleDeleteCar: @deleteCar, handleEditCar: @updateCar
