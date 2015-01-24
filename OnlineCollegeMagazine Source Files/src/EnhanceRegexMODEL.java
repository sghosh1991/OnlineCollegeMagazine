import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;


public class EnhanceRegexMODEL {
	
	private File f;
	private BufferedWriter writer;
	private FileWriter filewriter;
	
	public EnhanceRegexMODEL(String sysPath)throws Exception{	/* constructor making a connection to the pfrofane.txt file*/
		String path=sysPath.concat("profane.txt");
		f=new File(path);
		System.out.print("IN ENHANCE MODEL...FILE PATH:" + path+".....FILE IS: "+f);
		filewriter=new FileWriter(f,true);
		writer=new BufferedWriter(filewriter);
	}


	public void enhance(String slang) {
		try{
			writer.append(slang);
			writer.newLine();
			System.out.println("APPENDED");
			writer.flush();
			writer.close();
			
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}

}
