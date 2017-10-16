package hit.lab2.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.imageio.spi.IIOServiceProvider;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateDatabase extends ActionSupport{
	private File myFile;
   private String myFileContentType;
   private String myFileFileName;
   private String destPath;


   public String execute() throws Exception {
	  HttpServletRequest request = ServletActionContext.getRequest();
	  //get the input information
	  String[] Infor = new String[6];
	  Infor[0] = request.getParameter("ISBN");
	  Infor[1] = request.getParameter("Title");
	  Infor[2] = request.getParameter("AuthorID");
	  Infor[3] = request.getParameter("Publisher");
	  Infor[4] = request.getParameter("PublishDate");
	  Infor[5] = request.getParameter("Price");
	  //input the book into the book database
	  int success = mainFrame.inputNewBook(Infor);
	  if(success == -1){
		  request.setAttribute("bookexist", "true");
	  }
	  String[] temp = new String[1];
		temp[0] = Infor[2];
	  for(String information : Infor)
		  System.out.println(information);
      /* Copy file to a safe location */
      destPath = ServletActionContext.getServletContext().getRealPath("/images/bookimage/");
      System.out.println(destPath);
      if(myFile != null){
	      try{
	    	 //myFileFileName = Infor[0] +"."+ myFileFileName.substring(myFileFileName.lastIndexOf(".")+1);
	    	  myFileFileName = Infor[0] +".jpg";
	     	 System.out.println("Src File name: " + myFile);
	     	 System.out.println("Dst File name: " + myFileFileName);
	     	    	 
	     	 File destFile  = new File(destPath, myFileFileName);
	    	 FileUtils.copyFile(myFile, destFile);
	  
	      }catch(IOException e){
	         e.printStackTrace();
	         return ERROR;
	      }
      }
      ActionContext context = ActionContext.getContext(); 
	  Map session = context.getSession(); 
      if(mainFrame.selectAuthor("AuthorID", temp).isEmpty()&& success == 0){
	    	 session.put("UpdateAuthor", "true");
	    	 session.put("AuthorID", Infor[2]);
      }
      else{
    	  session.put("UpdateAuthor", "flase");
      }
      return "success";
   }
   
   //input new author
   public String inputAuthor() throws Exception{
	   System.out.println(555);
	   String[] Infor = new String[4];
	   ActionContext context = ActionContext.getContext(); 
	   Map session = context.getSession();
	   HttpServletRequest request = ServletActionContext.getRequest();
	   Infor[0] = (String) session.get("AuthorID");
	   Infor[1] = request.getParameter("Name");
	   Infor[2] = request.getParameter("Age");
	   Infor[3] = request.getParameter("Country");
	   for(String aString : Infor)
		   System.out.println(aString);
	   mainFrame.addAuthor(Infor);
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