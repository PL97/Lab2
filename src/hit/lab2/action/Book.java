package hit.lab2.action;
import java.sql.Date;

//Book {ISBN (PK), Title, AuthorID (FK), Publisher, PublishDate, Price} 
public class Book {
	private String ISBN;
	private String Title;
	private String AuthorID;
	private String publishDate;
	private String Publisher;
	private String Price;
	private String profile;
	
	public Book(String ISBN, String Title, String AuthorID, String Publisher, String publishDate, String Price){
		this.ISBN = ISBN;
		this.Title = Title;
		this.AuthorID = AuthorID;
		this.setPublishDate(publishDate);
		this.setPrice(Price);
		this.setPublisher(Publisher);
	}
	
	public String getISBN() {
		return ISBN;
	}
	
	public void setISBN(String ISBN){
		this.ISBN = ISBN;
	}
	
	public String getTitle(){
		return Title;
	}
	
	public void setTitle(String Title){
		this.Title = Title;
	}
	
	public String getAuthorID(){
		return AuthorID;
	}
	
	public void setAuthorID(String AuthorID){
		this.AuthorID = AuthorID;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getPublisher() {
		return Publisher;
	}

	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	
}
