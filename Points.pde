import java.util.Random;

public class Points
{
    // each point has an x and y value, a bias, and a label that tells whether it is above or below a line
    int x;
    int y;
    int bias = 1;
    int label;

    public Points()
    {
        // x and y values are assigned a random int between -15 and 15, inclusive
        Random rand = new Random();
        //this.x = rand.nextInt(31) - 15;
        this.x = rand.nextInt(481);
        //this.y = rand.nextInt(31) - 15;
        this.y = rand.nextInt(481);
        this.label = equation();    // label is determined using the equation method
    }
    
    public Points(int x_, int y_)
    {
        this.x = x_;
        this.y = y_;
        this.label = equation();    // label is determined using the equation method
    }

    // method assigns label to the point according to the equation
    public int equation()
    {
        //for y = x
        if (this.x >= this.y)
            return -1; // under line
        else
            return 1; // over line
    }
    
}
