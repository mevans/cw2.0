import 'dart:collection';

import '../models/blockworld.dart';
import '../models/search_result.dart';

SearchResult iterativeDeepeningSearch(Blockworld startState) {
  SearchResult result = SearchResult(searchMethod: "Iterative Deepening Search");
  ListQueue<Blockworld> stack = ListQueue.from([Blockworld.close()]);
  int maxDepth = 0;
  int nodesExpanded = 0;
  while (stack.isNotEmpty) {
    Blockworld state = stack.removeFirst();
    if (state.isFinishState()) {
      result.nodesExpanded = nodesExpanded;
      result.finalState = state;
      return result;
    }
    if (state.findDepth() < maxDepth) {
      nodesExpanded++;
      state.generateChildren().forEach((child) {
        stack.addFirst(child);
      });
    }
    if (stack.isEmpty) {
      stack.add(startState);
      maxDepth++;
    }
  }
  return result;
}