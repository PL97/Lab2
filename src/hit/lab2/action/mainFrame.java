package hit.lab2.action;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

//Author {AuthorID (PK), Name, Age, Country} 
//Book {ISBN (PK), Title, AuthorID (FK), Publisher, PublishDate, Price} 
public class mainFrame {
	//for book database connection
	private static String BinsertCmd = "INSERT INTO BOOK VALUES(?,?,?,?,?,?)";
	private static String BdeleteCmd = "DELETE FROM BOOK WHERE ISBN=?";
	private static String BupdateCmd = "UPDATE BOOK SET ";
	private static String BselectCmd = "SELECT * FROM BOOK WHERE ";
	private static DB BookDB= new DB();
	
	//for author database connection
	private static String AinsertCmd = "INSERT INTO Author VALUES(?,?,?,?)";
	private static String AdeleteCmd = "DELETE FROM Author WHERE ";
	private static String AupdateCmd = "UPDATE Author SET ISBN = ? WHERE ";
	private static String AselectCmd = "SELECT * FROM Author WHERE ";
	private static DB AuthorDB = new DB();
	
	public static void main(String[] args) throws IOException{
		scanFromFile("author.txt", 1);
		scanFromFile("books.txt", 0);
		int opt = 0;
		Scanner in = new Scanner(System.in);
		//opt = in.nextInt();
		opt = 2;
		for(int i =0;i<100;i++){
		switch(opt){
		case 1: //add books
			System.out.println("Please input the new book information:");
			System.out.println("format: ISBN (PK), Title, AuthorID (FK), Publisher, PublishDate, Price");
			inputNewBook(in.nextLine().split(" "));
			break;
		case 2://find books based on the author
			System.out.println("Please input the author name that you want to find:");
			List<Book> bookList = SearchByAuthor(in.nextLine());
//			List<Author> authorList = selectAuthor("Name", in.nextLine().split(" "));//find all the authors that share the same name which is input by the users
//			if(!authorList.isEmpty()){
//				for(Author author : authorList){//traverse all the author
//					String[] temp = new String[1];
//					temp[0] = author.getAuthorID();
//					//find the books that belong to the author
//					List<Book> bookList = selectBook("AuthorID", temp);
//					if(!bookList.isEmpty()){
//						for(Book tb : bookList){
//							System.out.println("ISBN (PK), Title, AuthorID (FK), Publisher, PublishDate, Price");
//							System.out.println(tb.getISBN() + "  " +tb.getTitle()+ "  " +tb.getAuthorID()+ "  " +tb.getPublisher()+ "  " +tb.getPublishDate()+ "  " +tb.getPrice());
//						}
//					}
//				}
//			}
//			else {
//				System.out.println("No books qualified!");
//			}
			break;
		case 3://update the new information for a certain book
			System.out.println("Please the update information:");
			updateBookInfor(in.nextLine().split("	"));
			break;
		case 4://delete one book
			System.out.println("Input the book you want to delete:");
			deleteBook(in.nextLine().split(" "));
			break;
		}
		}
		in.close();
	}
	//test update: 100100 Title pl'book AuthorID 456
	
	//add a function to scan the file
	private static void scanFromFile(String fname, int mode) throws IOException{
//		 File file = new File(fname);
//         BufferedReader reader = null;
//         String[] result = null;
//         //read the file 
//         try {
//             reader = new BufferedReader(new FileReader(file));
//             StringBuffer tmp = new StringBuffer();
//             String temp = null;
//             while ((temp = reader.readLine()) != null) {
//                 tmp.append(temp + "%%");
//             }
//             result = tmp.toString().split("%%");
//             reader.close();
//         } catch (IOException e) {
//             e.printStackTrace();
//         } finally {
//             if (reader != null) {
//                 try {
//                     reader.close();
//                 } catch (IOException e1) {
//                 }
//             }
//         }
//         // add the information to the database
//         if(result!= null){
//        	 for(String data : result){
//        		 if(mode == 0)
//        			 inputNewBook(data.split("	"));
//        		 else
//        			 addAuthor(data.split("	"));
//        	 }
//         }
		List<String> lines=new ArrayList<String>();  
		BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream(fname),"UTF-8"));  
		String line = null;  
		while ((line = br.readLine()) != null) {  
		      lines.add(line);  
		}  
		br.close();
		if(!lines.isEmpty()){
       	 	for(String data : lines){
       	 		//String input = new String(data.getBytes("gb2312"), "iso-8859-1");
       	 		String input = data;
	       		if(mode == 0)
	   			 	inputNewBook(input.split("	"));
	   		 	else
	   			 	addAuthor(input.split("	"));
       	 	}
		}
	}

	
	
	
	public static int inputNewBook(String [] parameter){
		try {
			String[] temp = new String[1];
			temp[0] = parameter[0];
			if(selectBook("ISBN", temp).size()!=0)
				return -1;
			BookDB.getConnection();
			BookDB.executeUpdate(BinsertCmd, parameter);
			BookDB.closeAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		//String[] temp = new String[1];
		//temp[0] = parameter[2];
		//selectAuthor("AuthorID", temp);
//		if(selectAuthor("AuthorID", temp).isEmpty()){
//			addAuthor(AuthorInfor);
//			System.out.println("Author does not exist please input the detail information about him/her.");
//			System.out.println("Format: Name, Age, Country");
//			Scanner in = new Scanner(System.in);
//			String authorInfor = parameter[2] + " ";
//			authorInfor += in.nextLine();
//			addAuthor(authorInfor.split(" "));
//		}
	}
	//input new book infromation to the database
	
	public static void deleteBook(String[] parameter){
		try {
			BookDB.getConnection();
			BookDB.executeUpdate(BdeleteCmd, parameter);
			BookDB.closeAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//delete the book from the database
	
	public static List<Book> SearchByAuthor(String authorName){
		String[] tempstring = new String[1];
		tempstring[0] = authorName;
		List<Author> authorList = selectAuthor("Name", tempstring);//find all the authors that share the same name which is input by the users
		List<Book> bookList = new ArrayList<Book>();
		if(!authorList.isEmpty()){
			for(Author author : authorList){//traverse all the author
				String[] temp = new String[1];
				temp[0] = author.getAuthorID();
				//find the books that belong to the author
				List<Book> tempList = selectBook("AuthorID", temp);
				if(!tempList.isEmpty()){
					for(Book tb : tempList){
						System.out.println(tb.getTitle());
						bookList.add(tb);
						System.out.println("ISBN (PK), Title, AuthorID (FK), Publisher, PublishDate, Price");
						System.out.println(tb.getISBN() + "  " +tb.getTitle()+ "  " +tb.getAuthorID()+ "  " +tb.getPublisher()+ "  " +tb.getPublishDate()+ "  " +tb.getPrice());
					}
				}
			}
		}
		return bookList;
	}
	
	public static void updateBookInfor1(String[] parameter){
		try {
			//find old book information
			String[] tempstring = new String[1];
			tempstring[0] = parameter[0];
			Book tempBook = selectBook("ISBN", tempstring).get(0);
			System.out.println("the old information is:");
			System.out.println(tempBook.getISBN()+"  "+tempBook.getTitle() + "  "+tempBook.getAuthorID()+"  "+tempBook.getPublishDate()+"  "+tempBook.getTitle()+"  "+tempBook.getPrice());
			BookDB.getConnection();
			//update new information
			StringBuffer updateCmd = new StringBuffer(BupdateCmd);
			String[] param = new String[parameter.length/2+1];
			int len = 0;
			//get all the parameter & command 
			for(int i = 1;i<parameter.length;i = i+2){
				updateCmd.append(parameter[i] + "=?, ");
				param[len++] = parameter[i+1];
			}
			param[len] = parameter[0];//ISBN
			BookDB.executeUpdate(updateCmd.toString().substring(0,updateCmd.length()-2)+" where ISBN=?", param);
			BookDB.closeAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateBookInfor(String[] parameter){
		try {
			//find old book information
			String[] attrName = {"ISBN", "Title", "AuthorID", "Publisher", "PublishDate", "Price"};
			String[] tempstring = new String[1];
			tempstring[0] = parameter[0];
			Book tempBook = selectBook("ISBN", tempstring).get(0);
			System.out.println("the old information is:");
			System.out.println(tempBook.getISBN()+"  "+tempBook.getTitle() + "  "+tempBook.getAuthorID()+"  "+tempBook.getPublishDate()+"  "+tempBook.getTitle()+"  "+tempBook.getPrice());
			BookDB.getConnection();
			//update new information
			StringBuffer updateCmd = new StringBuffer(BupdateCmd);
			String[] param = new String[6];
			int len = 0;
			//get all the parameter & command 
			for(int i = 1;i<parameter.length;i++){
				updateCmd.append(attrName[i] + "=?, ");
				param[i-1] = parameter[i];
			}
			param[5] = parameter[0];
			BookDB.executeUpdate(updateCmd.toString().substring(0,updateCmd.length()-2) + " where ISBN=?", param);
			BookDB.closeAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static List<Book> selectBook(String Column, String[] parameter){
		LinkedList<Book> list = new LinkedList<Book>();
		try {
			BookDB.getConnection();
			//only for one limitation
			ResultSet rs = BookDB.executeSelect(BselectCmd + Column + "=?", parameter);
			while(rs.next()){
				Book tempBook = new Book(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
				list.add(tempBook);
			}
			BookDB.closeAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	//select book from the database
	
	//100100 AuthorID 321 Publisher mark
	public static void addAuthor(String[] parameter) {
		try {
			String[] temp = new String[1];
			temp[0] = parameter[0];
			if(selectAuthor("AuthorID", temp).size()!=0)
				return;
			AuthorDB.getConnection();
			AuthorDB.executeUpdate(AinsertCmd, parameter);
			AuthorDB.closeAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//add Author into the dataBase
	
	public static List<Author> selectAuthor(String Column, String[] parameter){
		LinkedList<Author> list = new LinkedList<Author>();
		try {
			AuthorDB.getConnection();
			//only for one limitation
			ResultSet rs = AuthorDB.executeSelect(AselectCmd + Column + "=?", parameter);
			while(rs.next()){
				Author tempAuthor = new Author(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(tempAuthor);
			}
			AuthorDB.closeAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	//select the author from the database
	
}
