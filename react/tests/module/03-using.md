# Using
## Documentation
[Documentation](https://github.com/enzymejs/enzyme)

## Three methods
- shallow()
- render()
- mount()

## Example
````
import Enzyme, { shallow } from 'enzyme';
````
````
describe('Table', () => {

  const props = {
    list: [
      { title: '1', author: '1', num_comments: 1, points: 2, objectID: 'y' },
      { title: '2', author: '2', num_comments: 1, points: 2, objectID: 'z' },
    ],
};

  ...bla-bla

  it('shows two items in list', () => {
    const element = shallow(
      <Table { ...props } />
    );

    expect(element.find('.table-row').length).toBe(2);
  });

});
````
