import React from 'react'
import ReactDOM from 'react-dom'

import Home from '../components/Home';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Home/>,
    document.body.appendChild(document.createElement('div')),
  )
})