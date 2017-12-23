@CarForm = React.createClass
  getInitialState: ->
    name: ''
    price: ''
    horsepower: ''
    model: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    @state.name && @state.price && @state.horsepower && @state.model 
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { car: @state }, (data) =>
      @props.handleNewCar data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'name'
          name: 'name'
          value: @state.name
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'price'
          name: 'price'
          value: @state.price
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'horsepower'
          name: 'horsepower'
          value: @state.horsepower
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'model'
          name: 'model'
          value: @state.model
          onChange: @handleValueChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Add New Car'