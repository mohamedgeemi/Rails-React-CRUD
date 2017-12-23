@Car = React.createClass

  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/cars/#{ @props.car.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteCar @props.car

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name: ReactDOM.findDOMNode(@refs.name).value
      price: ReactDOM.findDOMNode(@refs.price).value
      horsepower: ReactDOM.findDOMNode(@refs.horsepower).value
      model: ReactDOM.findDOMNode(@refs.model).value
    $.ajax
      method: 'PUT'
      url: "/cars/#{ @props.car.id }"
      dataType: 'JSON'
      data:
        car: data
      success: (data) =>
        @setState edit: false
        @props.handleEditCar @props.car, data

  toggleUnit: (e) ->
    e.preventDefault()

  carRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.car.name
      React.DOM.td null, @props.car.price
      React.DOM.td null, @props.car.horsepower
      React.DOM.td null, @props.car.model
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleToggle
          'Edit'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  carForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.car.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.car.price
          ref: 'price'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.car.horsepower
          ref: 'horsepower'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.car.model
          ref: 'model'
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Update'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @carForm()
    else
      @carRow()
