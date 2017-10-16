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
public class Supplier implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private Integer supplier_id;
	
	@Column(name="supplier_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_name;
	
	@Column(name="supplier_gender",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_gender;
	
	@Column(name="supplier_email",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_email;
	
	@Column(name="supplier_mobile",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_mobile;
	
	@Column(name="supplier_company_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_company_name;
	
	@Column(name="supplier_full_address",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_full_address;
	
	@Column(name="supplier_licence_number",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_licence_number;
	
	@Transient
	private MultipartFile supplier_image;
	
	@Column(name="supplier_image_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_image_name;
	
	@Column(name="supplier_create_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_create_date;
	
	@Column(name="supplier_last_modified_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_last_modified_date;
	
	@Column(name="supplier_status",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String supplier_status;
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="supplier_purchaseOrders", joinColumns = {@JoinColumn(name="supplier_id")}, inverseJoinColumns = {@JoinColumn(name="purchaseOrder_id")})
	private Collection<PurchaseOrder> purchaseOrders = new ArrayList<PurchaseOrder>();

	public Integer getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(Integer supplier_id) {
		this.supplier_id = supplier_id;
	}

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}

	public String getSupplier_gender() {
		return supplier_gender;
	}

	public void setSupplier_gender(String supplier_gender) {
		this.supplier_gender = supplier_gender;
	}

	public String getSupplier_email() {
		return supplier_email;
	}

	public void setSupplier_email(String supplier_email) {
		this.supplier_email = supplier_email;
	}

	public String getSupplier_mobile() {
		return supplier_mobile;
	}

	public void setSupplier_mobile(String supplier_mobile) {
		this.supplier_mobile = supplier_mobile;
	}

	public String getSupplier_company_name() {
		return supplier_company_name;
	}

	public void setSupplier_company_name(String supplier_company_name) {
		this.supplier_company_name = supplier_company_name;
	}

	public String getSupplier_full_address() {
		return supplier_full_address;
	}

	public void setSupplier_full_address(String supplier_full_address) {
		this.supplier_full_address = supplier_full_address;
	}

	public String getSupplier_licence_number() {
		return supplier_licence_number;
	}

	public void setSupplier_licence_number(String supplier_licence_number) {
		this.supplier_licence_number = supplier_licence_number;
	}

	public MultipartFile getSupplier_image() {
		return supplier_image;
	}

	public void setSupplier_image(MultipartFile supplier_image) {
		this.supplier_image = supplier_image;
	}

	public String getSupplier_image_name() {
		return supplier_image_name;
	}

	public void setSupplier_image_name(String supplier_image_name) {
		this.supplier_image_name = supplier_image_name;
	}

	public String getSupplier_create_date() {
		return supplier_create_date;
	}

	public void setSupplier_create_date(String supplier_create_date) {
		this.supplier_create_date = supplier_create_date;
	}

	public String getSupplier_last_modified_date() {
		return supplier_last_modified_date;
	}

	public void setSupplier_last_modified_date(String supplier_last_modified_date) {
		this.supplier_last_modified_date = supplier_last_modified_date;
	}

	public String getSupplier_status() {
		return supplier_status;
	}

	public void setSupplier_status(String supplier_status) {
		this.supplier_status = supplier_status;
	}

	public Collection<PurchaseOrder> getPurchaseOrders() {
		return purchaseOrders;
	}

	public void setPurchaseOrders(Collection<PurchaseOrder> purchaseOrders) {
		this.purchaseOrders = purchaseOrders;
	}

	@Override
	public String toString() {
		return "Supplier [supplier_id=" + supplier_id + ", supplier_name=" + supplier_name + ", supplier_gender="
				+ supplier_gender + ", supplier_email=" + supplier_email + ", supplier_mobile=" + supplier_mobile
				+ ", supplier_company_name=" + supplier_company_name + ", supplier_full_address="
				+ supplier_full_address + ", supplier_licence_number=" + supplier_licence_number + ", supplier_image="
				+ supplier_image + ", supplier_image_name=" + supplier_image_name + ", supplier_create_date="
				+ supplier_create_date + ", supplier_last_modified_date=" + supplier_last_modified_date
				+ ", supplier_status=" + supplier_status + ", purchaseOrders=" + purchaseOrders + "]";
	}
	
	
}
