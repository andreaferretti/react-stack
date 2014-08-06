`/** @jsx React.DOM */`

define [
  'react'
  'react-router-component'
  'views/composite'
], (React, Router, Composite)->
  { Location, Locations } = Router
  content = document.getElementById 'content'

  React.renderComponent(`<Locations>
      <Location path="/" handler={ Composite } />
    </Locations>`, content)