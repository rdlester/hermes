// Handles player-platform collisions
class PlatformCollider extends GenericMassedCollider<Player, Platform> {
  
  PlatformCollider(float elasticity) {
    super(elasticity);
  }
  
  // reset the player's jump when he hits a platform, then do the normal projection/impulse collision stuff
  void handle(Player player, Platform platform) {
    player.resetJump(); // reset the jump
    super.handle(player, platform); // have GenericMassedCollider do the rest
  }
  
}
