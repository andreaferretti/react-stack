`/** @jsx React.DOM */`

define [
  'react'
  'react-router-component'
  'react-bootstrap/Nav'
  'react-bootstrap/NavItem'
], (React, Router, Nav, NavItem)->
  Link = Router.Link

  React.createClass
    render: ->
      `<Nav bsStyle="pills">
        <NavItem>
          <Link href="/" >Home</Link>
        </NavItem>
        <NavItem>
          <Link href="/hello" >Hello</Link>
        </NavItem>
      </Nav>`