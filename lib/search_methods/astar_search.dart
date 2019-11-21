import 'package:collection/collection.dart';

import '../models/blockworld.dart';
import '../models/search_result.dart';

SearchResult aStarSearch(Blockworld startState) {
  List<String> seen = [];
  SearchResult result = SearchResult(searchMethod: "A* Search");
  PriorityQueue<Blockworld> priorityQueue = PriorityQueue((s1, s2) => s1.distanceFromGoal() - s2.distanceFromGoal());
  priorityQueue.add(startState);
  int nodesExpanded = 0;

  while (priorityQueue.isNotEmpty) {
    Blockworld state = priorityQueue.removeFirst();
    if (!seen.contains(state.toString())) {
      if (state.isFinishState()) {
        result.finalState = state;
        result.nodesExpanded = nodesExpanded;
        return result;
      }
      nodesExpanded++;
      priorityQueue.addAll(state.generateChildren(mustBeValidMove: true));
      seen.add(state.toString());
    }
  }
  return result;
}
