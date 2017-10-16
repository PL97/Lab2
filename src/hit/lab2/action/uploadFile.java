package hit.lab2.action;

import java.io.File;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;

import javax.activation.MimetypesFileTypeMap;

import com.opensymphony.xwork2.ActionSupport;

public class uploadFile extends ActionSupport{
   private File myFile = null;
   private String myFileContentType;
   private String myFileFileName;
   private String destPath;

   public String execute()
   {
	   if(myFile == null)
		   return SUCCESS;
      /* Copy file to a safe location */
      destPath = ServletActionContext.getServletContext().getRealPath("/images/");
      System.out.println(destPath);
      try{
    	  myFileFileName = "abc" +"."+ myFileFileName.substring(myFileFileName.lastIndexOf(".")+1);
     	 System.out.println("Src File name: " + myFile);
     	 System.out.println("Dst File name: " + myFileFileName);
     	    	 
     	 File destFile  = new File(destPath, myFileFileName);
    	 FileUtils.copyFile(myFile, destFile);
  
      }catch(IOException e){
         e.printStackTrace();
         return ERROR;
      }

      return SUCCESS;
   }
   public File getMyFile() {
      return myFile;
   }
   public void setMyFile(File myFile) {
      this.myFile = myFile;
   }
   public String getMyFileContentType() {
      return myFileContentType;
   }
   public void setMyFileContentType(String myFileContentType) {
      this.myFileContentType = myFileContentType;
   }
   public String getMyFileFileName() {
      return myFileFileName;
   }
   public void setMyFileFileName(String myFileFileName) {
      this.myFileFileName = myFileFileName;
   }
}
