`/** @jsx React.DOM */`

define [
  'react'
  'react-bootstrap/Row'
  'react-bootstrap/Col'
  './search'
  './list'
], (React, Row, Col, Search, List)->
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
      `<Row>
        <Col md={4}>
          <Search valueLink={ this.linkState("value") } />
          <List data={ countries } query={ this.state.value } />
        </Col>
      </Row>`