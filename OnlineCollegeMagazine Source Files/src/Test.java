import java.math.BigInteger;
import java.security.SecureRandom;

public class Test {
  public static void main(String[] args) {
	  char data[][] = new char[100][];
	  SecureRandom random = new SecureRandom();
	  for(int i=0;i<100;i++){
	    String str=new BigInteger(35, random).toString(32);
	    data[i]=str.toCharArray();
	    int len=data[i].length;
	    for(int j=0;j<len;j++){
	    	System.out.print(data[i][j]);
	    }
	    System.out.println();
	 }  
  }
}