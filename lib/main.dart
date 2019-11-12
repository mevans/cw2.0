import 'blockworld.dart';

main() {
  breadthFirstSearch();
}

void breadthFirstSearch() {
  List<Blockworld> queue = [Blockworld.close()];
  bool solutionFound = false;
  while (!solutionFound) {
    Blockworld latest = queue.first;
    print(latest);
    if (latest.isFinishState()) {
      solutionFound = true;
      print("Found!");
      print(latest);
    } else {
      queue.removeAt(0);
      queue.addAll(latest.generateChildren());
    }
  }
}
