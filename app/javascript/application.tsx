// Entry point for the build script in your package.json
//import "@hotwired/turbo-rails"
//import "./controllers"

// app/javascript/entrypoint.tsx
import * as React from 'react'
import * as ReactDOM from 'react-dom'

const App = () => {
  return (<div>Hello, Rails 7!</div>)
}

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('app')
  ReactDOM.render(<App />, rootEl)
})
