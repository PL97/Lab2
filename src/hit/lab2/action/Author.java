package hit.lab2.action;//Author {AuthorID (PK), Name, Age, Country} 
public class Author {
	private String AuthorID;
	private String Name;
	private String Age;
	private String Country;
	
	public Author(String AuthorID, String Name, String Age, String Country){
		this.setAge(Age);
		this.setName(Name);
		this.setAuthorID(AuthorID);
		this.setCountry(Country);
	}

	public String getAuthorID() {
		return AuthorID;
	}

	public void setAuthorID(String authorID) {
		AuthorID = authorID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getAge() {
		return Age;
	}

	public void setAge(String age) {
		Age = age;
	}
}
