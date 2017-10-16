package www.retail.gahan.services;

import www.retail.gahan.beans.Admin;

public interface AdminServiceI {

	public Integer saveAdmin(Admin admin);

	public Admin adminLogin(Admin admin);

	public Admin adminLock(Admin admin);
	
	public boolean isAdminExist();

	public Long countTotalCustomers();
	
	public String getPassword(Integer aid);
	
	public String changePassword(String newPassword, Integer aid);
	
}
