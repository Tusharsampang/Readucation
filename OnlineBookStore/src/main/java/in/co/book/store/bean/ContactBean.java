package in.co.book.store.bean;

import in.co.book.store.bean.BaseBean;

public class ContactBean extends BaseBean {
	
	
	private String name;
	private String email;
	private String message;
	
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String getKey() {
		
		return null;
	}

	@Override
	public String getValue() {
		
		return null;
	}

}
