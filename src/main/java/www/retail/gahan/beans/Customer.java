package www.retail.gahan.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private Integer customer_id;
	
	@Column(name="customer_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_name;
	
	@Column
	private Long customer_aadhar_number;
	
	@Column(name="customer_gender",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_gender;
	
	@Column(name="customer_email",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_email;
	
	@Column(name="customer_mobile",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_mobile;
	
	@Column(name="customer_full_address",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_full_address;
	
	@Transient
	private MultipartFile customer_image;
	
	@Column(name="customer_image_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_image_name;
	
	@Column(name="customer_create_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_create_date;
	
	@Column(name="customer_last_modified_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_last_modified_date;
	
	@Column(name="customer_status",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String customer_status;
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="customer_salesOrders", joinColumns = {@JoinColumn(name="customer_id")}, inverseJoinColumns = {@JoinColumn(name="salesOrder_id")})
	private Collection<SalesOrder> salesOrders = new ArrayList<SalesOrder>();
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="customer_gahans", joinColumns = {@JoinColumn(name="customer_id")}, inverseJoinColumns = {@JoinColumn(name="gahan_id")})
	private Collection<Gahan> gahans = new ArrayList<Gahan>();

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_gender() {
		return customer_gender;
	}

	public void setCustomer_gender(String customer_gender) {
		this.customer_gender = customer_gender;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_mobile() {
		return customer_mobile;
	}

	public void setCustomer_mobile(String customer_mobile) {
		this.customer_mobile = customer_mobile;
	}

	public String getCustomer_full_address() {
		return customer_full_address;
	}

	public void setCustomer_full_address(String customer_full_address) {
		this.customer_full_address = customer_full_address;
	}

	public MultipartFile getCustomer_image() {
		return customer_image;
	}

	public void setCustomer_image(MultipartFile customer_image) {
		this.customer_image = customer_image;
	}

	public String getCustomer_image_name() {
		return customer_image_name;
	}

	public void setCustomer_image_name(String customer_image_name) {
		this.customer_image_name = customer_image_name;
	}

	public String getCustomer_create_date() {
		return customer_create_date;
	}

	public void setCustomer_create_date(String customer_create_date) {
		this.customer_create_date = customer_create_date;
	}

	public String getCustomer_last_modified_date() {
		return customer_last_modified_date;
	}

	public void setCustomer_last_modified_date(String customer_last_modified_date) {
		this.customer_last_modified_date = customer_last_modified_date;
	}

	public String getCustomer_status() {
		return customer_status;
	}

	public void setCustomer_status(String customer_status) {
		this.customer_status = customer_status;
	}

	public Collection<SalesOrder> getSalesOrders() {
		return salesOrders;
	}

	public void setSalesOrders(Collection<SalesOrder> salesOrders) {
		this.salesOrders = salesOrders;
	}

	public Collection<Gahan> getGahans() {
		return gahans;
	}

	public void setGahans(Collection<Gahan> gahans) {
		this.gahans = gahans;
	}

	public Long getCustomer_aadhar_number() {
		return customer_aadhar_number;
	}

	public void setCustomer_aadhar_number(Long customer_aadhar_number) {
		this.customer_aadhar_number = customer_aadhar_number;
	}

	@Override
	public String toString() {
		return "Customer [customer_id=" + customer_id + ", customer_name=" + customer_name + ", customer_gender="
				+ customer_gender + ", customer_email=" + customer_email + ", customer_mobile=" + customer_mobile
				+ ", customer_full_address=" + customer_full_address + ", customer_image=" + customer_image
				+ ", customer_image_name=" + customer_image_name + ", customer_create_date=" + customer_create_date
				+ ", customer_last_modified_date=" + customer_last_modified_date + ", customer_status="
				+ customer_status + ", salesOrders=" + salesOrders + "]";
	}

	
	
}
