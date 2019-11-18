import '../enums/direction.dart';
import 'block.dart';
import 'coordinate.dart';

class Blockworld {
  Block a;
  Block b;
  Block c;
  Coordinate agent;
  Blockworld parent;

  Blockworld({this.a, this.b, this.c, this.agent});

  Blockworld.start()
      : a = Block.a(),
        b = Block.b(),
        c = Block.c(),
        agent = Coordinate(4, 4);

  Blockworld.close()
      : a = Block.a(close: true),
        b = Block.b(close: true),
        c = Block.c(close: true),
        agent = Coordinate(2, 2);

  Blockworld clone() => Blockworld(a: this.a.clone(), b: this.b.clone(), c: this.c.clone(), agent: this.agent.clone());

  bool isFinishState() => a.inGoalLocation() && b.inGoalLocation() && c.inGoalLocation();

  bool canMove(Direction direction) {
    return (direction == Direction.Up && agent.y > 1 ||
        direction == Direction.Down && agent.y < 4 ||
        direction == Direction.Left && agent.x > 1 ||
        direction == Direction.Right && agent.x < 4);
  }

  void move(Direction direction) {
    if (!canMove(direction)) return;
    Coordinate movementVector;
    switch (direction) {
      case Direction.Up:
        movementVector = Coordinate(0, -1);
        break;
      case Direction.Down:
        movementVector = Coordinate(0, 1);
        break;
      case Direction.Left:
        movementVector = Coordinate(-1, 0);
        break;
      case Direction.Right:
        movementVector = Coordinate(1, 0);
        break;
    }
    Coordinate movingInto = this.agent + movementVector;

    if (blockAt(movingInto) != null) {
      blockAt(movingInto).moveTo(this.agent);
    }

    this.agent.moveTo(movingInto);
  }

  List<Blockworld> generateChildren({bool randomise = false}) {
    List<Blockworld> children = [];
    Direction.values.forEach((direction) {
      if (this.canMove(direction)) {
        Blockworld clone = this.clone();
        clone.parent = this;
        children.add(clone..move(direction));
      }
    });
    if (randomise) {
      children.shuffle();
    }
    return children;
  }

  Block blockAt(Coordinate coordinate) {
    if (a.location == coordinate) return a;
    if (b.location == coordinate) return b;
    if (c.location == coordinate) return c;
    return null;
  }

  int distanceFromGoal() => this.a.distanceFromGoal() + this.b.distanceFromGoal() + this.c.distanceFromGoal();

  int findDepth() {
    int depth = 0;
    Blockworld lookingAt = this;
    while (lookingAt.parent != null) {
      depth++;
      lookingAt = lookingAt.parent;
    }
    return depth;
  }

  @override
  String toString() {
    String string = "";
    for (int y = 1; y < 5; y++) {
      for (int x = 1; x < 5; x++) {
        Coordinate coordinate = Coordinate(x, y);
        Block block = blockAt(coordinate);
        if (agent == coordinate) {
          string += "⧆";
        } else if (block != null) {
          string += block.marker;
        } else {
          string += "□";
        }
      }
      string += "\n";
    }
    return string;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Blockworld &&
          a.location.x == this.a.location.x &&
          a.location.y == this.a.location.y &&
          b.location.x == this.b.location.x &&
          b.location.y == this.b.location.y &&
          c.location.x == this.c.location.x &&
          c.location.y == this.c.location.y &&
          agent.x == this.agent.x &&
          agent.y == this.agent.y;

  @override
  int get hashCode => a.hashCode ^ b.hashCode ^ c.hashCode ^ agent.hashCode;
}
