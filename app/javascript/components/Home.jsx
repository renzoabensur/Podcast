import React, { useState} from 'react'

const Home = () => {
  const [count, setCount] = useState(0);
  const increase = () => setCount(count+1);
  const decrease = () => setCount(count-1);
  console.log("podcastList")
  return (
    <div>
      <button onClick={decrease}>-</button>
      <span>{count}</span>
      <button onClick={increase}>+</button>
    </div>
  )
}
export default Home;