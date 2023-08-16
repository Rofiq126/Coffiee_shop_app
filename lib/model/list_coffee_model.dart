class DataCoffee {
  String name;
  String price;
  String pathPicture;

  DataCoffee(
      {required this.name, required this.price, required this.pathPicture});
}

List<DataCoffee> dataCoffee = [
  DataCoffee(
      name: 'Long Black',
      price: '4.00',
      pathPicture: 'assets/icons/coffee.png'),
  DataCoffee(
      name: 'Ice Coffee',
      price: '4.10',
      pathPicture: 'assets/icons/iced-coffee.png'),
  DataCoffee(
      name: 'Mocha', price: '4.40', pathPicture: 'assets/icons/mocha.png'),
  DataCoffee(
      name: 'Breakfirst',
      price: '5.00',
      pathPicture: 'assets/icons/breakfast.png'),
];
