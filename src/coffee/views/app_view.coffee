`/** @jsx React.DOM */`

define [
  'react'
  './composite'
], (React, CompositeView)->
  countries = [
    { name: 'Italy', population: 59859996 },
    { name: 'Mexico', population: 118395054 },
    { name: 'France', population: 65806000 },
    { name: 'Argentina', population: 40117096 },
    { name: 'Japan', population: 127290000 }
  ]

  class App
    initialize: ->
      React.renderComponent(
        `<CompositeView data={ countries } />`,
        document.getElementById 'content'
      )