package www.retail.gahan.services;

import java.util.List;

import www.retail.gahan.beans.Customer;


public interface CustomerServiceI {

	public String getCustomerMobileByMobile(String customer_mobile);

	public Integer saveCustomer(Customer customer);

	public Customer getCustomerById(Integer cid);

	public Integer mergeSalesOrderToCustomer(Customer customer);

	public List<Customer> getAllCustomers();

	public Integer updateCustomer(Customer customer);

	public Long getTotalCustomersCount();

	@SuppressWarnings("rawtypes")
	public List monthlyCustomerCountReport();



}
