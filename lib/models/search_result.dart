import 'blockworld.dart';

// Model to hold information about a searches result
class SearchResult {
  final String searchMethod;
  Blockworld finalState;
  int nodesExpanded;
  int nodesGenerated;
  int maxSpaceUsed;

  SearchResult(this.searchMethod) : maxSpaceUsed = 0;

  bool get solutionFound => finalState != null;

  @override
  String toString() {
    return solutionFound
        ? "$searchMethod completed after $nodesExpanded node expansions, "
            "$nodesGenerated node generations, $maxSpaceUsed space used, with a depth of ${finalState.findDepth()}"
        : "$searchMethod failed";
  }
}
