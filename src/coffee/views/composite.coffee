`/** @jsx React.DOM */`

define [
  'react'
  './search'
  './list'
], (React, SearchView, ListView)->
  React.createClass
    mixins: [React.addons.LinkedStateMixin]
    getInitialState: ->
      value: ''
    render: ->
      `<div>
        <SearchView state={ this.linkState("value") } />
        <ListView data={ this.props.data } query={ this.state.value } />
      </div>`
