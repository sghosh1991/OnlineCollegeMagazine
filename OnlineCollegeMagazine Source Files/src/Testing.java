import java.util.ArrayList;


public class Testing {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String searchString="i am damn good";
		ArrayList<String> ar1=new ArrayList<String>();
		int prevval=0;
		String tempString;
		char presentChar;
		for(int i=0;i<searchString.length();i++){
			presentChar=searchString.charAt(i);
			if(presentChar==' '){
				ar1.add(searchString.substring(prevval,i).toUpperCase());
				prevval=i+1;
			}
		}
		ar1.add(searchString.substring(prevval).toUpperCase());
		int i=0;
		while(i<ar1.size()){
			System.out.println(ar1.get(i));
			i++;
		}
	}

}
