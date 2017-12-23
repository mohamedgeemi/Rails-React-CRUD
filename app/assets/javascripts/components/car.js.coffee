@Car = React.createClass

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/cars/#{ @props.car.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteCar @props.car

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.car.name
      React.DOM.td null, @props.car.price
      React.DOM.td null, @props.car.horsepower
      React.DOM.td null, @props.car.model
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
