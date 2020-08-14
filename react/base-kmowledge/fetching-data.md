# Fetching data
- Fetching
- loading icon
- error state
- axios
- HOW TO TEST DATA FETCHING IN REACT
- HOW TO FETCH DATA WITH ASYNC/AWAIT IN REACT?
- HOW TO FETCH DATA IN HIGHER-ORDER COMPONENTS?
- HOW TO FETCH DATA IN RENDER PROPS?

## Links
https://www.robinwieruch.de/react-fetching-data
https://www.robinwieruch.de/react-hooks-fetch-data
https://www.robinwieruch.de/react-with-graphql-tutorial

## Loading icon
````
...
class App extends Component {
  constructor(props) {
      super(props);
      this.state = {
        hits: [],
        isLoading: false,
      };
  }

  componentDidMount() {
      this.setState({ isLoading: true });
      fetch(API + DEFAULT_QUERY)
        .then(response => response.json())
        .then(data => this.setState({ hits: data.hits, isLoading: false }));
  }

  render() {
    const { hits, isLoading } = this.state;
    if (isLoading) {
      return <p>Loading ...</p>;
    }
    return (
      <ul>
        {hits.map(hit =>
          <li key={hit.objectID}>
            <a href={hit.url}>{hit.title}</a>
          </li>
        )}
      </ul>
    );
  }
}
````

## Error state
````
...
class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
          hits: [],
          isLoading: false,
          error: null,
        };
      }
  ...
  componentDidMount() {
    this.setState({ isLoading: true });
    fetch(API + DEFAULT_QUERY)
      .then(response => response.json())
      .then(data => this.setState({ hits: data.hits, isLoading: false }))
      .catch(error => this.setState({ error, isLoading: false }));
  }
  ...
}
````

## Reaction on the 404 (native fetching fall in catch block)
````
...
class App extends Component {
  ...
    componentDidMount() {
        this.setState({ isLoading: true });
        fetch(API + DEFAULT_QUERY)
          .then(response => {
            if (response.ok) {
              return response.json();
            } else {
              throw new Error('Something went wrong ...');
            }
          })
          .then(data => this.setState({ hits: data.hits, isLoading: false }))
          .catch(error => this.setState({ error, isLoading: false }));
        }
    
    render() {
      const { hits, isLoading, error } = this.state;
      if (error) {
        return <p>{error.message}</p>;
      }
      if (isLoading) {
        return <p>Loading ...</p>;
      }
      return (
        <ul>
          {hits.map(hit =>
            <li key={hit.objectID}>
              <a href={hit.url}>{hit.title}</a>
            </li>
          )}
        </ul>
      );
    }
  ...
}
````
