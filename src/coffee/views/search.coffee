`/** @jsx React.DOM */`

define [
  'react'
], (React)->
  React.createClass
    render: ->
      `<input type="text" valueLink={ this.props.state } />`
