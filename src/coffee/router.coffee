`/** @jsx React.DOM */`

define [
  'react'
  'react-router-component'
  'views/navbar'
  'views/composite'
  'views/hello'
], (React, Router, Navbar, Composite, Hello)->
  { Location, Locations } = Router
  console.log Hello, Location, Locations, Router
  content = document.getElementById 'content'

  React.renderComponent(
    `<div>
      <Navbar />
      <Locations>
        <Location path="/" handler={ Composite } />
        <Location path="/hello" handler={ Hello } />
      </Locations>
    </div>`, content)