import 'coordinate.dart';
import 'direction.dart';

class Blockworld {
  Coordinate a;
  Coordinate b;
  Coordinate c;
  Coordinate agent;

  Blockworld({this.a, this.b, this.c, this.agent});

  Blockworld.start()
      : a = Coordinate(1, 4),
        b = Coordinate(2, 4),
        c = Coordinate(3, 4),
        agent = Coordinate(4, 4);

  Blockworld.close()
      : a = Coordinate(2, 2),
        b = Coordinate(2, 3),
        c = Coordinate(1, 4),
        agent = Coordinate(4, 1);

  Blockworld clone() {
    return Blockworld(a: this.a.clone(), b: this.b.clone(), c: this.c.clone(), agent: this.agent.clone());
  }

  bool isFinishState() {
    return a == Coordinate(2, 2) && b == Coordinate(2, 3) && c == Coordinate(2, 4);
  }

  bool canMove(Direction direction) {
    switch (direction) {
      case Direction.Up:
        return agent.y > 1;
      case Direction.Down:
        return agent.y < 4;
      case Direction.Left:
        return agent.x > 1;
      case Direction.Right:
        return agent.x < 4;
    }
    return false;
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

    if (findAt(movingInto) != null) {
      findAt(movingInto).moveTo(this.agent);
    }

    this.agent.moveTo(movingInto);
  }

  List<Blockworld> generateChildren() {
    List<Blockworld> children = [];
    Direction.values.forEach((direction) {
      if (this.canMove(direction)) {
        Blockworld clone = this.clone();
        children.add(clone..move(direction));
      }
    });
    return children;
  }

  Coordinate findAt(Coordinate coordinate) {
    if (a == coordinate) return a;
    if (b == coordinate) return b;
    if (c == coordinate) return c;
    return null;
  }

  @override
  String toString() {
    return 'Blockworld{a: $a, b: $b, c: $c, agent: $agent}';
  }
}
