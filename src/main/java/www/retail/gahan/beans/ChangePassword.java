package www.retail.gahan.beans;

import java.io.Serializable;

public class ChangePassword implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer admin_id;
	private String old_password;
	private String new_password;
	
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getOld_password() {
		return old_password;
	}
	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}
	public String getNew_password() {
		return new_password;
	}
	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}
	@Override
	public String toString() {
		return "ChangePassword [old_password=" + old_password + ", new_password=" + new_password + "]";
	}
	
	
}
