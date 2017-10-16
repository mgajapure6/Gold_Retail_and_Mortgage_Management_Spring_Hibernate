package www.retail.gahan.daos;

import java.util.List;
import www.retail.gahan.beans.Customer;

public interface CustomerDaoI {
	
	public Integer getCustomerMaxId();

	public String getCustomerMobileByMobile(String customer_mobile);

	public Integer saveCustomer(Customer customer);

	public Customer getCustomerById(Integer cid);
	
	public List<Customer> getAllCustomers();

	public Integer mergeSalesOrderToCustomer(Customer customer);

	public Integer updateCustomer(Customer customer);

	public Long getTotalCustomersCount();

	@SuppressWarnings("rawtypes")
	public List monthlyCustomerCountReport();


}
