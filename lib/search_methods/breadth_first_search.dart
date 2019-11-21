import 'dart:collection';

import '../models/blockworld.dart';
import '../models/search_result.dart';

SearchResult breadthFirstSearch(Blockworld startState) {
  SearchResult result = SearchResult(searchMethod: "Breadth First Search");
  Queue<Blockworld> queue = Queue.from([startState]);
  int nodesExpanded = 0;

  while (queue.isNotEmpty) {
    Blockworld state = queue.removeFirst();
    if (state.isFinishState()) {
      result.finalState = state;
      result.nodesExpanded = nodesExpanded;
      return result;
    }
    nodesExpanded++;
    queue.addAll(state.generateChildren());
  }
  return result;
}
