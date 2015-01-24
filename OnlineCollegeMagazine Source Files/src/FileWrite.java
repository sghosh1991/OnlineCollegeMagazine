import java.io.*;
class FileWrite 
{
 public void writingFile(String content)
  {
  try{
  // Create file 
  FileWriter fstream = new FileWriter("out.txt");
  BufferedWriter out = new BufferedWriter(fstream);
  out.write(content);
  //Close the output stream
  out.close();
  }catch (Exception e){//Catch exception if any
  System.err.println("Error: " + e.getMessage());
  }
  }
}