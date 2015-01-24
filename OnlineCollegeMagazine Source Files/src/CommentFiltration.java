import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class CommentFiltration {
	FileReader filereader;
	File f;
	BufferedReader reader;
	
	public CommentFiltration()throws Exception{	/* constructor making a connection to the pfrofane.txt file*/
		f=new File("C:\\Users\\Zinnia\\IBM\\rationalsdp\\hopeful\\OnlineMagazine\\WebContent\\profane.txt");
		filereader=new FileReader(f);
		reader=new BufferedReader(filereader);
	}
	
	public boolean filter(String comment) throws Exception{
		Pattern pat;
		Matcher mat;
		String line =null;
		
		while((line=reader.readLine())!=null){
			System.out.println("PROFANE WORD IS : "+ line);
			pat=Pattern.compile(line);
			mat=pat.matcher(comment);
			if(mat.find()){
				return true;
			}
		}
		return false;
		
	}
	
}
