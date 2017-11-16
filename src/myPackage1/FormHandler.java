package myPackage1;
import java.text.ParseException;


public interface FormHandler {
	
	public void setAllFields() throws ParseException;
	public String log(Boolean success, String user);
	public String logError(String user, Exception e);
	
}
