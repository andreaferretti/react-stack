`/** @jsx React.DOM */`

define [
  'react'
  './search'
  './list'
], (React, SearchView, ListView)->
  countries = [
    { name: 'Italy', population: 59859996 },
    { name: 'Mexico', population: 118395054 },
    { name: 'France', population: 65806000 },
    { name: 'Argentina', population: 40117096 },
    { name: 'Japan', population: 127290000 }
  ]

  React.createClass
    mixins: [React.addons.LinkedStateMixin]
    getInitialState: ->
      value: ''
    render: ->
      `<div>
        <SearchView state={ this.linkState("value") } />
        <ListView data={ countries } query={ this.state.value } />
      </div>`