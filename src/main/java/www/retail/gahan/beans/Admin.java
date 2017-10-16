package www.retail.gahan.beans;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
public class Admin implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer admin_id;
	
	@Column(name="admin_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_name;
	
	@Column(name="admin_email",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_email;
	
	@Column(name="admin_address",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_address;
	
	@Column(name="admin_town",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_town;
	
	@Column(name="admin_country",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_country;
	
	@Column(name="admin_username",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_username;
	
	@Column(name="admin_password",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_password;
	
	@Transient
	private MultipartFile admin_image;
	
	@Column(name="admin_image_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String admin_image_name;
	
	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getAdmin_address() {
		return admin_address;
	}

	public void setAdmin_address(String admin_address) {
		this.admin_address = admin_address;
	}

	public String getAdmin_town() {
		return admin_town;
	}

	public void setAdmin_town(String admin_town) {
		this.admin_town = admin_town;
	}

	public String getAdmin_country() {
		return admin_country;
	}

	public void setAdmin_country(String admin_country) {
		this.admin_country = admin_country;
	}

	public String getAdmin_username() {
		return admin_username;
	}

	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}


	public MultipartFile getAdmin_image() {
		return admin_image;
	}

	public void setAdmin_image(MultipartFile admin_image) {
		this.admin_image = admin_image;
	}

	public String getAdmin_image_name() {
		return admin_image_name;
	}

	public void setAdmin_image_name(String admin_image_name) {
		this.admin_image_name = admin_image_name;
	}

	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_email=" + admin_email
				+ ", admin_address=" + admin_address + ", admin_town=" + admin_town + ", admin_country=" + admin_country
				+ ", admin_username=" + admin_username + ", admin_password=" + admin_password + "]";
	}

//	public Collection<Employee> getEmployees() {
//		return employees;
//	}
//
//	public void setEmployees(Collection<Employee> employees) {
//		this.employees = employees;
//	}
//
//	public Collection<Customer> getCustomers() {
//		return customers;
//	}
//
//	public void setCustomers(Collection<Customer> customers) {
//		this.customers = customers;
//	}
//
//	public Collection<Inventory> getInventories() {
//		return inventories;
//	}
//
//	public void setInventories(Collection<Inventory> inventories) {
//		this.inventories = inventories;
//	}
//
//	public Collection<Invoice> getInvoices() {
//		return invoices;
//	}
//
//	public void setInvoices(Collection<Invoice> invoices) {
//		this.invoices = invoices;
//	}
//
//	public Collection<OrderData> getOrderDatas() {
//		return orderDatas;
//	}
//
//	public void setOrderDatas(Collection<OrderData> orderDatas) {
//		this.orderDatas = orderDatas;
//	}
//
//	public Collection<OrderPayment> getOrderPayments() {
//		return orderPayments;
//	}
//
//	public void setOrderPayments(Collection<OrderPayment> orderPayments) {
//		this.orderPayments = orderPayments;
//	}
//
//	public Collection<Product> getProducts() {
//		return products;
//	}
//
//	public void setProducts(Collection<Product> products) {
//		this.products = products;
//	}
//
//	public Collection<ProductCategory> getProductCategories() {
//		return productCategories;
//	}
//
//	public void setProductCategories(Collection<ProductCategory> productCategories) {
//		this.productCategories = productCategories;
//	}
//
//	public Collection<PurchaseData> getPurchases() {
//		return purchases;
//	}
//
//	public void setPurchases(Collection<PurchaseData> purchases) {
//		this.purchases = purchases;
//	}
//
//	public Collection<Report> getReports() {
//		return reports;
//	}
//
//	public void setReports(Collection<Report> reports) {
//		this.reports = reports;
//	}
//
//	public Collection<Store> getStores() {
//		return stores;
//	}
//
//	public void setStores(Collection<Store> stores) {
//		this.stores = stores;
//	}
//
//	public Collection<Supplier> getSuppliers() {
//		return suppliers;
//	}
//
//	public void setSuppliers(Collection<Supplier> suppliers) {
//		this.suppliers = suppliers;
//	}
//
//	public Collection<Notifications> getNotifications() {
//		return notifications;
//	}
//
//	public void setNotifications(Collection<Notifications> notifications) {
//		this.notifications = notifications;
//	}
//
//	public Collection<PurchasePayment> getPurchasePayments() {
//		return purchasePayments;
//	}
//
//	public void setPurchasePayments(Collection<PurchasePayment> purchasePayments) {
//		this.purchasePayments = purchasePayments;
//	}

	
	
}
