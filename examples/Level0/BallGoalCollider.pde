/**
 * If the ball hits the goal, then change mode to COMPLETED
 */
class BallGoalCollider extends Collider<Ball, Goal> {
  public void handle(Ball being1, Goal being2) {
    setMode(COMPLETED);
  }
}

