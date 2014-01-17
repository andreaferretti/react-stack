`/** @jsx React.DOM */`

define [
  'react'
  '_s'
], (React, _s)->
  React.createClass
    render: ->
      query = this.props.query.toLowerCase()
      entries = this.props.data
        .filter((entry) -> _s.contains(entry.name.toLowerCase(), query))
        .map((entry) -> `<li>{ entry.name + ": " + entry.population }</li>`)
      
      `<ul>{ entries }</ul>`
