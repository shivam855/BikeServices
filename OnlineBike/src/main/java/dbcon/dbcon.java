package dbcon;

public class dbcon{
	
	public static String dbdriver() {
		return "com.mysql.jdbc.Driver";
	}
	public static String db() {
	 return "jdbc:mysql://localhost:3306/bike"; 
	 /*return "jdbc:mysql://sql6.freesqldatabase.com/sql6523538";*/ 
	}
	public static String dbname() {
		 return "root"; 
		 /*return "sql6523538";*/ 
	}
	public static String dbpass() {
		return "mysql@123"; 
		/* return "j8V3GiUWIU";*/ 
	}
	public static String createDB() {
		return "create database bike";
	}
	public static String useDB() {
		return "use bike";
	}
	public static String createadmin() {
		return "create table admin_details( admin_id varchar(20), name varchar(20), password varchar(20), PRIMARY KEY (admin_id));";
	}
	public static String deleteadmindetails() {
		return	"delete from admin_details" ;
	}
	public static String insertadmindetails() {
		return "insert into admin_details values (1 ,'admin2', 'admin')";
	}
	public static String selectadmindetails() {
		return "select * from admin_details";
	}
	public static String createpayment() {
		return "create table payment( trackid int NOT NULL AUTO_INCREMENT , bill_amt varchar(20), paymod varchar(20),debitnum varchar(20), cvv varchar(20), exp_date varchar(20), status varchar(20), PRIMARY KEY (trackid))";
	}
	public static String createeng() {
		return "create table eng(eng_id int NOT NULL AUTO_INCREMENT,name varchar(20),email varchar(20),phone varchar(20) ,adhaar varchar(20),address varchar(20),city varchar(20),state varchar(20),experiance varchar(20),password varchar(20),requirement varchar(20),approval varchar(20), PRIMARY KEY (eng_id))";
	}
	public static String createcus() {
		return	"create table cus_details(user_id int NOT NULL AUTO_INCREMENT,Name varchar(20),email varchar(20),phone varchar(20),adhaar varchar(20),address varchar(20),city varchar(20),state varchar(20),password varchar(20), PRIMARY KEY (user_id))" ;
	}
	public static String createservice() {
		return "create table service(track_id int NOT NULL AUTO_INCREMENT,user_id varchar(20),bike_name varchar(20),bike_model varchar(20),service_type varchar(20),status varchar(20),services varchar(20),eng_id varchar(20),approval varchar(20), PRIMARY KEY (track_id))";
	}
	public static String createfeed() {
		return "create table feedback(user_id varchar(20),track_id varchar(20),service varchar(20),facility varchar(20),suggestion varchar(50))";
	}
	public static String createengservice() {
		return	"create table eng_service(eng_id varchar(20),track_id int NOT NULL AUTO_INCREMENT,bike_name varchar(20),status varchar(20), PRIMARY KEY (track_id))";
	}		
	public static String createmapping() {
		return	"create table mapping(track_id int NOT NULL AUTO_INCREMENT,user_id varchar(20),eng_id varchar(20),eng_status varchar(20),approval varchar(20), PRIMARY KEY (track_id))";
	}
	
}