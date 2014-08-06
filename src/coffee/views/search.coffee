`/** @jsx React.DOM */`

define [
  'react'
  'react-bootstrap/Input'
], (React, Input)->
  React.createClass
    render: ->
      `<Input type="text" placeholder="Filter here" valueLink={ this.props.valueLink } />`