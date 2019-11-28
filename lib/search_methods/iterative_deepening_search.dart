import 'dart:collection';

import '../models/blockworld.dart';
import '../models/search_result.dart';

SearchResult iterativeDeepeningSearch(Blockworld startState, {graphSearch = false}) {
  List<String> seen = [];
  SearchResult result = SearchResult("Iterative Deepening Search");
  ListQueue<Blockworld> stack = ListQueue.from([Blockworld.close()]);
  // Max depth variable keeps track of the max depth the 'dfs' can look through
  int maxDepth = 0;
  int nodesExpanded = 0;
  int nodesGenerated = 0;

  while (stack.isNotEmpty) {
    Blockworld state = stack.removeFirst();
    if (stack.length + seen.length > result.maxSpaceUsed) {
      result.maxSpaceUsed = stack.length + seen.length;
    }
    if (!graphSearch || !seen.contains(state.toString())) {
      if (state.isFinishState()) {
        result.finalState = state;
        result.nodesExpanded = nodesExpanded;
        result.nodesGenerated = nodesGenerated;
        return result;
      }
      // Similar to the dfs, however only add the children to the stack if the current depth is less than the max
      if (state.findDepth() < maxDepth) {
        nodesExpanded++;
        final children = state.generateChildren();
        children.forEach((child) {
          stack.addFirst(child);
        });
        nodesGenerated += children.length;
      }
      if (graphSearch) seen.add(state.toString());
    }
    /* If the stack is empty ie. every node has been search at the current depth, start again from the top, increase
     the maxDepth, and reset seen nodes*/
    if (stack.isEmpty) {
      stack.add(startState);
      maxDepth++;
      if (graphSearch) seen = [];
    }
  }
  return result;
}
