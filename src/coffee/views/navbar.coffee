`/** @jsx React.DOM */`

define [
  'react'
  'react-router-component'
], (React, Router)->
  Link = Router.Link

  React.createClass
    render: ->
      `<div>
        <Link href="/" >Home</Link>
        <Link href="/hello" >Hello</Link>
      </div>`