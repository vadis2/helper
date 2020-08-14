# Props
To transfer parameters from parent to child.

Parent:
````
class Board extends React.Component {
  renderSquare(i) {
    return <Square value={i} />;
  }
}
````
Child:
````
class Square extends React.Component {
  render() {
    return (
      <button className="square">
        {this.props.value}
      </button>
    );
  }
}
````
