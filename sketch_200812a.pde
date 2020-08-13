
void setup()
{

  size(480, 480); 

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
  Points trainingSet;
  Points[] dataSet = new Points[5];
  Perceptron brain = new Perceptron();
  int epochs = 100;
  
  //for (int i = 0; i < epochs; i++)
  //{
     trainingSet = new Points();
     double[] inputs = {trainingSet.x, trainingSet.y, trainingSet.bias};
     brain.train(inputs, trainingSet.label);
     trainingSet = null;
  //}
  
 
  dataSet[0] = new Points(10, 10);// black
  dataSet[1] = new Points(200, 100); // black
  dataSet[2] = new Points(245, 300); // white
  dataSet[3] = new Points(410, 410); // black
  dataSet[4] = new Points(120, 324); // white 
   
  for (int i = 0; i < dataSet.length; i++)
  {
     
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
     ellipse(dataSet[i].x, dataSet[i].y, 8, 8);
     System.out.println(dataSet[i].x + " " + dataSet[i].y + " " + dataSet[i].label + " " + label);
     //dataSet[i] = null;
  }

}
