import 'dart:collection';

import '../models/blockworld.dart';
import '../models/search_result.dart';

SearchResult breadthFirstSearch(Blockworld startState, {graphSearch = false}) {
  List<String> seen = graphSearch ? [] : null;
  SearchResult result = SearchResult(searchMethod: "Breadth First Search");
  Queue<Blockworld> queue = Queue.from([startState]);
  int nodesExpanded = 0;
  int nodesGenerated = 0;

  while (queue.isNotEmpty) {
    Blockworld state = queue.removeFirst();
    if (!graphSearch || !seen.contains(state.toString())) {
      if (state.isFinishState()) {
        // If the final state is found, add the data to the result object and return it
        result.finalState = state;
        result.nodesExpanded = nodesExpanded;
        result.nodesGenerated = nodesGenerated;
        return result;
      }
      // A node has been expanded, and add its children to the queue
      nodesExpanded++;
      final children = state.generateChildren();
      queue.addAll(children);
      nodesGenerated += children.length;
      if (graphSearch) seen.add(state.toString());
    }
  }
  return result;
}
