package hit.lab2.action;

import java.io.File;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Search extends ActionSupport{

   public String execute() throws Exception {
	  HttpServletRequest request = ServletActionContext.getRequest();
	  ActionContext context = ActionContext.getContext(); 
	  Map session = context.getSession(); 
	  String author = request.getParameter("search_box");
	  List<Book> tempList = mainFrame.SearchByAuthor(author);
	  if(tempList != null){
		  for(Book aBook : tempList){
			  System.out.println(aBook.getTitle());
		  }
		  session.put("books", tempList);
		  HashMap<String, Book> mapToBook = new HashMap<String, Book>();
		  for(int i =0;i<tempList.size();i++){
			  mapToBook.put(tempList.get(i).getISBN(), tempList.get(i));
			  System.out.println(tempList.get(i).getISBN() + "->" + tempList.get(i));
		  }
		  session.put("bookmap", mapToBook);
	  }
      return SUCCESS;
   }
   
   public String delete(){
	   HttpServletRequest request = ServletActionContext.getRequest();
	   ActionContext context = ActionContext.getContext(); 
	   Map session = context.getSession(); 
	   int book = Integer.parseInt(request.getParameter("countBook"));
	   String[] temp = new String[1];
	   List<Book> remains = (List<Book>) session.get("books");
	   HashMap<String, Book> bookmap = (HashMap<String, Book>)session.get("bookmap");
	   System.out.println("book remains:"+ book);
	   for(int i =1;i<=book;i++){
		   System.out.println("delete book:");
		   temp[0] = request.getParameter(Integer.toString(i));
		   System.out.println(temp[0]);
		   mainFrame.deleteBook(temp);
		   System.out.println(bookmap.get(temp[0]).getTitle());
		   remains.remove(bookmap.get(temp[0]));
		   bookmap.remove("temp[0]");
		   for(String aString : bookmap.keySet()){
			   System.out.println(aString);
		   }
		   //delete file
		   String filename = temp[0] + ".jpg";
		   String path = ServletActionContext.getServletContext().getRealPath("/images/bookimage/")+filename;
		   File file=new File(path);
		   System.out.println(path);
	       if(file.exists()&&file.isFile()){
	    	   file.delete();
	       }
	   }
	   for(Book aString : remains){
		   System.out.println(aString.getTitle());
	   }
	   session.put("books", remains);
	   return SUCCESS;
   }
   
   public String modify(){
	   HttpServletRequest request = ServletActionContext.getRequest();
	   ActionContext context = ActionContext.getContext(); 
	   Map session = context.getSession(); 
	   List<Book> updatedBooks = (List<Book>) session.get("books");
	   String[] infor = new String[6];
	   infor[0] = request.getParameter("ISBN");
	   infor[1] = request.getParameter("title");
	   infor[2] = request.getParameter("authorid");
	   infor[3] = request.getParameter("publisher");
	   infor[4] = request.getParameter("publishdate");
	   infor[5] = request.getParameter("price");
	   for(String aString : infor){
		   System.out.println(aString);
	   }
	   Book newBook = new Book(infor[0], infor[1], infor[2], infor[3], infor[4], infor[5]);
	  // Book oldBook = null;
	   int index = -1;
	   for(Book aBook : updatedBooks){
		   System.out.println(aBook.getTitle());
		   index++;
		   if(aBook.getISBN().equals(infor[0])){
			   break;
		   }
	   }
	   updatedBooks.remove(index);
	   updatedBooks.add(index,newBook);
	   System.out.println("updated books:");
	   System.out.println(index);
	   for(Book aBook : updatedBooks){
		   System.out.println(aBook.getTitle());
	   }
	   session.put("books", updatedBooks);
	   mainFrame.updateBookInfor(infor);
	   HashMap<String, Book> mapToBook = new HashMap<String, Book>();
		  for(int i =0;i<updatedBooks.size();i++){
			  mapToBook.put(updatedBooks.get(i).getISBN(), updatedBooks.get(i));
			  System.out.println(updatedBooks.get(i).getTitle() + "->" + updatedBooks.get(i).getPublishDate() + "->" + updatedBooks.get(i));
		  }
		  session.put("bookmap", mapToBook);
	   return SUCCESS;
   }
}