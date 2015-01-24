import java.io.File;

import org.apache.commons.fileupload.FileItem;


public class Uploader {
	String upload(FileItem fi,String filePath){
		try{
		File file;
		String fieldName = fi.getFieldName();
        String fileName = fi.getName();
        System.out.println("file name is "+fileName);
        String contentType = fi.getContentType();
        System.out.println(contentType);
        boolean isInMemory = fi.isInMemory();
        long sizeInBytes = fi.getSize();
        if( fileName.lastIndexOf("\\") >= 0 ){
        	filePath = filePath.concat(fileName.substring(fileName.lastIndexOf("\\")));
        }
        else{
        	filePath = filePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
         }
        file=new File(filePath);
        System.out.println(file);
        fi.write( file ) ;
		}catch(Exception e){
			e.printStackTrace();
		}
        return filePath;
	}

}
