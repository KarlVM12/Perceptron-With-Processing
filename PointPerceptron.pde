import java.util.Random;

public class Perceptron
{
    // weights and learning rate for perceptron
    double[] weights = new double[3];
    Random rand = new Random();
    final double MIN = -1.0;
    final double MAX = 1.0;
    double lr = 0.01;

    public Perceptron()
    {
        // assigns weights a random value between -1 and 1, inclusive, at perceptrons initialization
        for (int i = 0; i < weights.length; i++)
            this.weights[i] = this.MIN + (this.MAX - this.MIN) * this.rand.nextDouble();
    }

    // method guesses the output based on its weights
    public int guess(double[] inputs)
    {
        // gets a sum by the summation of the inputs times the weights
        double sum = 0;
        for (int i = 0; i < inputs.length; i++)
            sum += inputs[i] * this.weights[i];

        // output is calculated by activation function
        int output = sign(sum);

        return output;
    }

    // method is the activation function for the perceptron which assign 1 or -1 to the output
    public int sign(double sum)
    {
      /*
        if (sum > 0)
            return 1;
        else
            return -1;
           */
        return (1/(1+Math.exp(-sum))) >= 0.5 ? 1:-1;
    }

    // method trains the perceptron by guessing the output then correcting the weights
    public void train(double inputs[], int target, int epochs)
    {
      for( int j = 0; j<epochs; j++){
        // gets a sum by the summation of the inputs times the weights
        double sum = 0;
        for (int i = 0; i < inputs.length; i++)
            sum += inputs[i] * this.weights[i];

        // output is calculated by activation function
        int output = sign(sum);

        // if guess doesnt match the output, the weights are corrected
        if (target != output)
            for (int i = 0; i < this.weights.length; i++)
                this.weights[i] += (target - output) * lr * inputs[i];
      }
        
    }
}
