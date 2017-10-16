package www.retail.gahan.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.Customer;
import www.retail.gahan.daos.CustomerDaoI;
import www.retail.gahan.utility.DateFormate;

public class CustomerServiceImpl implements CustomerServiceI {
	
	@Autowired
	private CustomerDaoI customerDaoI;

	public void setCustomerDaoI(CustomerDaoI customerDaoI) {
		this.customerDaoI = customerDaoI;
	}
	
	

	@Override
	public String getCustomerMobileByMobile(String customer_mobile) {
		return customerDaoI.getCustomerMobileByMobile(customer_mobile);
	}

	@Override
	public Integer saveCustomer(Customer customer) {
		Integer maxId = customerDaoI.getCustomerMaxId();
		if (maxId == 0 || maxId == null) {
			maxId = 1;
		} else {
			maxId = maxId+1;
		}
		customer.setCustomer_id(maxId);
		customer.setCustomer_create_date(DateFormate.dateTimeToString(new Date()));
		customer.setCustomer_last_modified_date("");
		Integer flag =customerDaoI.saveCustomer(customer);
		if (flag!=null && flag>0 ) {
			return flag=1;
		}
		return flag=0;
	}

	@Override
	public Customer getCustomerById(Integer cid) {
		return customerDaoI.getCustomerById(cid);
	}



	@Override
	public Integer mergeSalesOrderToCustomer(Customer customer) {
		return customerDaoI.mergeSalesOrderToCustomer(customer);
	}



	@Override
	public List<Customer> getAllCustomers() {
		return customerDaoI.getAllCustomers();
	}



	@Override
	public Integer updateCustomer(Customer customer) {
		return customerDaoI.updateCustomer(customer);
	}



	@Override
	public Long getTotalCustomersCount() {
		return customerDaoI.getTotalCustomersCount();
	}



	@SuppressWarnings("rawtypes")
	@Override
	public List monthlyCustomerCountReport() {
		return customerDaoI.monthlyCustomerCountReport();
	}




}
