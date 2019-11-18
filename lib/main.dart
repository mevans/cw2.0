import 'models/blockworld.dart';

main() {
  Blockworld blockworld = Blockworld.close();
  breadthFirstSearch();
}

void breadthFirstSearch() {
  List<Blockworld> queue = [Blockworld.close()];
  bool hasReachedFinishState = false;
  while (!hasReachedFinishState) {
    Blockworld state = queue.removeAt(0);
    print(state);
    if (state.isFinishState()) {
      print('Breadth First Search Completed: Depth of ${state.findDepth()}');
      print(state);
      hasReachedFinishState = true;
    } else {
      queue.addAll(state.generateChildren());
    }
  }
}
