

Points[] trainingSet = new Points[5];
Points[] dataSet = new Points[10];
Perceptron brain = new Perceptron();

void setup()
{

  size(480, 480); 

  //line();
//}
//void draw() //draw is called every second, setup called once
//{
  
  // draws 20 points, black if below or on line, white if above line
  
  /*
  Points[] pointArray = new Points[20];
  for(int i = 0; i < pointArray.length; i++)
  {
    pointArray[i] = new Points();
  }
  
  for (int i = 0; i < pointArray.length; i++)
  {
    if (pointArray[i].label == -1)
    {
      fill(0);
    }
     else
     {
       fill(255);
     }
    ellipse(pointArray[i].x * 10, pointArray[i].y * 10, 10, 10);
  }
  */
}

void draw()
{
  int epochs = 10000;
  
  for (int i = 0; i < trainingSet.length; i++)
  {
     trainingSet[i] = new Points();
     double[] inputs = {trainingSet[i].x, trainingSet[i].y, trainingSet[i].bias};
     brain.train(inputs, trainingSet[i].label, epochs);
     trainingSet[i] = null;
  }
 /*
  dataSet[0] = new Points(10, 10);// black
  dataSet[1] = new Points(200, 100); // black
  dataSet[2] = new Points(245, 300); // white
  dataSet[3] = new Points(410, 410); // black
  dataSet[4] = new Points(120, 324); // white 
   */
   
  for (int i = 0; i < dataSet.length; i++)
  {
     dataSet[i] = new Points();
     double[] inputs_ = {dataSet[i].x, dataSet[i].y, dataSet[i].bias};
     int label = brain.guess(inputs_);
     
     if (label == -1)
     {
       fill(0);
     }
     else
     {
       fill(255);
     }
     ellipse(dataSet[i].x, dataSet[i].y, 8,8);
     System.out.println(dataSet[i].x + " " + dataSet[i].y + " " + dataSet[i].label + " " + label);
     //dataSet[i] = null;
  }

  System.out.print(brain.weights[0] +" "+ brain.weights[1] +" "+ brain.weights[2]);
}
