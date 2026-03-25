void main(List<String> args) {
  if (args.isEmpty) {
    print('Hallo!');
  } else {
    //final name = args.join(' ');
    print('Hallo ${args.join(' ')}!');
  }
}
