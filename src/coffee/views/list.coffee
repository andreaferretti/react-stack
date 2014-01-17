`/** @jsx React.DOM */`

define [
  'react'
], (React)->
  React.createClass
    render: ->
      query = this.props.query.toLowerCase()
      entries = this.props.data
        .filter((entry) -> entry.name.toLowerCase().indexOf(query) != -1)
        .map((entry) -> `<li>{ entry.name + ": " + entry.population }</li>`)
      
      `<ul>{ entries }</ul>`
