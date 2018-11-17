package david.gomera.invaders.versiones.v21;

public class Monster extends Actor {
	protected int vx;
	
	public Monster(Stage stage) {
		super(stage);
		setSpriteNames( new String[] {"bicho/bicho0.gif","bicho/bicho1.gif"});
		setFrameSpeed(35);
	}
	
	public void act() {
		super.act();
		x+=vx;
		if (x < 0 || x > Stage.WIDTH)
		  vx = -vx;
	}

	public int getVx() { return vx; }
	public void setVx(int i) {vx = i;	}
	
	public void collision(Actor a) {
		if (a instanceof Bullet || a instanceof Bomb)
		  remove();
	}
}