import 'dart:collection';

import '../models/blockworld.dart';
import '../models/search_result.dart';

SearchResult depthFirstSearch(Blockworld startState, {graphSearch = false}) {
  List<String> seen = [];
  SearchResult result = SearchResult("Depth First Search");
  ListQueue<Blockworld> stack = ListQueue.from([startState]);
  int nodesExpanded = 0;
  int nodesGenerated = 0;

  while (stack.isNotEmpty) {
    Blockworld state = stack.removeFirst();
    if (!graphSearch || !seen.contains(state.toString())) {
      if (state.isFinishState()) {
        result.finalState = state;
        result.nodesExpanded = nodesExpanded;
        result.nodesGenerated = nodesGenerated;
        result.maxSpaceUsed = stack.length + seen.length; // Max space is the size of the stack as the depth is infinite
        return result;
      }
      nodesExpanded++;
      // Add the children to the top of the stack
      final children = state.generateChildren(randomise: true);
      children.forEach((child) {
        stack.addFirst(child);
      });
      nodesGenerated += children.length;
      if (graphSearch) seen.add(state.toString());
    }
  }
  return result;
}
