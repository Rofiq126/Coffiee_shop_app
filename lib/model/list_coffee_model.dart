class DataCoffee {
  String name;
  String price;
  String pathPicture;
  String description;

  DataCoffee(
      {required this.name,
      required this.price,
      required this.pathPicture,
      required this.description});
}

List<DataCoffee> dataCoffee = [
  DataCoffee(
      name: 'Long Black',
      price: '4.00',
      description:
          'Black coffee is simply coffee that is normally brewed without the addition of additives such as sugar, milk, cream, or added flavors. It has a slightly bitter taste compared to when it is flavored with additives.',
      pathPicture: 'assets/icons/coffee.png'),
  DataCoffee(
      name: 'Ice Coffee',
      price: '4.10',
      description:
          'Iced coffee is a type of coffee served cold and usually sweetened. It is brewed hot and then cooled down by adding ice. It can be served with milk or cream and sugar or flavored syrups. Some people prefer to make their iced coffee with cold brew, which is made by steeping coffee grounds in cold water for several hours.',
      pathPicture: 'assets/icons/iced-coffee.png'),
  DataCoffee(
      name: 'Mocha',
      price: '4.40',
      pathPicture: 'assets/icons/mocha.png',
      description:
          'Mocha coffee is an espresso-based beverage that’s unique from others such as latte, cappuccino, and macchiato, due to the presence of chocolate notes. It refers to any mixture of coffee with chocolate flavoring, even as simple as some hot chocolate with shots of espresso blended together. A caffé mocha is basically a chocolate-flavored variant of a caffé latte so it’s also based on espresso and hot milk.'),
  DataCoffee(
      name: 'Breakfirst',
      price: '5.00',
      description:
          'Coffee and sandwich is a classic combination that has been enjoyed for generations. Coffee is a popular beverage that is made from roasted coffee beans. It can be served hot or cold and is often enjoyed with breakfast or as an afternoon pick-me-up. Sandwiches are a type of food that consists of two slices of bread with a filling in between. They can be made with a variety of ingredients such as meat, cheese, vegetables, and spreads. ',
      pathPicture: 'assets/icons/breakfast.png'),
];

class CoffeeSize {
  String size;
  CoffeeSize({required this.size});
}

List<CoffeeSize> dataSize = [
  CoffeeSize(size: 'S'),
  CoffeeSize(size: 'M'),
  CoffeeSize(size: 'L'),
];
