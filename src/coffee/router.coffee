`/** @jsx React.DOM */`

define [
  'react'
  'react-router-component'
  'views/navbar'
  'views/composite'
  'views/hello'
], (React, Router, Navbar, Composite, Hello)->
  { Location, Locations } = Router

  React.renderComponent(
    `<div className="container">
      <Navbar />
      <Locations>
        <Location path="/" handler={ Composite } />
        <Location path="/hello" handler={ Hello } />
      </Locations>
    </div>`, document.body)