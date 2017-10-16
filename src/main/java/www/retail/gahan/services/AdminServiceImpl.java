package www.retail.gahan.services;

import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.Admin;
import www.retail.gahan.daos.AdminDaoI;

public class AdminServiceImpl implements AdminServiceI {

	@Autowired
	private AdminDaoI adminDaoI;
	
	
	public void setAdminDaoI(AdminDaoI adminDaoI) {
		this.adminDaoI = adminDaoI;
	}


	@Override
	public Integer saveAdmin(Admin admin) {
		return adminDaoI.saveAdmin(admin);
	}


	@Override
	public Admin adminLogin(Admin admin) {
		
		return adminDaoI.adminLogin(admin);
	}


	@Override
	public Admin adminLock(Admin admin) {
		
		return adminDaoI.adminLock(admin);
	}


	@Override
	public boolean isAdminExist() {
		
		return adminDaoI.isAdminExist();
	}


	@Override
	public Long countTotalCustomers() {
		
		return adminDaoI.countTotalCustomers();
	}


	@Override
	public String getPassword(Integer aid) {
		return adminDaoI.getPassword(aid);
	}


	@Override
	public String changePassword(String newPassword, Integer aid) {
		return adminDaoI.changePassword(newPassword, aid);
	}



}
