package www.retail.gahan.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
public class SalesProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer salesProduct_id;
	
	@Column(name="sales_product_metal_type",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String sales_product_metal_type;
	
	@Column
	private Double todays_metal_rate;
	
	@Column(name="sales_product_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String sales_product_name;
	
	@Column
	private Double sales_product_weight;
	
	@Column
	private Double sales_product_making_charge;
	
	@Column(name="sales_product_karret",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String sales_product_karret;
	
	
	@Column(name="sales_product_image_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String sales_product_image_name;
	
	@Transient
	private MultipartFile sales_product_imageFile;
	
	@Column
	private Double sales_product_price;
	
	@Column
	private Integer sales_product_quantity;
	
	@Column
	private Double sales_product_quantity_price;
	
	@Column(name="sales_product_create_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String sales_product_create_date;
	
	@Column(name="sales_product_last_modify_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String sales_product_last_modify_date;
	
	@ManyToOne
	private SalesOrder salesOrder;

	public Integer getSalesProduct_id() {
		return salesProduct_id;
	}

	public void setSalesProduct_id(Integer salesProduct_id) {
		this.salesProduct_id = salesProduct_id;
	}

	public String getSales_product_metal_type() {
		return sales_product_metal_type;
	}

	public void setSales_product_metal_type(String sales_product_metal_type) {
		this.sales_product_metal_type = sales_product_metal_type;
	}

	public Double getTodays_metal_rate() {
		return todays_metal_rate;
	}

	public void setTodays_metal_rate(Double todays_metal_rate) {
		this.todays_metal_rate = todays_metal_rate;
	}

	public String getSales_product_name() {
		return sales_product_name;
	}

	public void setSales_product_name(String sales_product_name) {
		this.sales_product_name = sales_product_name;
	}

	public Double getSales_product_weight() {
		return sales_product_weight;
	}

	public void setSales_product_weight(Double sales_product_weight) {
		this.sales_product_weight = sales_product_weight;
	}

	public Double getSales_product_making_charge() {
		return sales_product_making_charge;
	}

	public void setSales_product_making_charge(Double sales_product_making_charge) {
		this.sales_product_making_charge = sales_product_making_charge;
	}

	public Double getSales_product_price() {
		return sales_product_price;
	}

	public void setSales_product_price(Double sales_product_price) {
		this.sales_product_price = sales_product_price;
	}

	public Integer getSales_product_quantity() {
		return sales_product_quantity;
	}

	public void setSales_product_quantity(Integer sales_product_quantity) {
		this.sales_product_quantity = sales_product_quantity;
	}

	public Double getSales_product_quantity_price() {
		return sales_product_quantity_price;
	}

	public void setSales_product_quantity_price(Double sales_product_quantity_price) {
		this.sales_product_quantity_price = sales_product_quantity_price;
	}

	public String getSales_product_create_date() {
		return sales_product_create_date;
	}

	public void setSales_product_create_date(String sales_product_create_date) {
		this.sales_product_create_date = sales_product_create_date;
	}

	public String getSales_product_last_modify_date() {
		return sales_product_last_modify_date;
	}

	public void setSales_product_last_modify_date(String sales_product_last_modify_date) {
		this.sales_product_last_modify_date = sales_product_last_modify_date;
	}

	public String getSales_product_image_name() {
		return sales_product_image_name;
	}

	public void setSales_product_image_name(String sales_product_image_name) {
		this.sales_product_image_name = sales_product_image_name;
	}

	public MultipartFile getSales_product_imageFile() {
		return sales_product_imageFile;
	}

	public void setSales_product_imageFile(MultipartFile sales_product_imageFile) {
		this.sales_product_imageFile = sales_product_imageFile;
	}

	public SalesOrder getSalesOrder() {
		return salesOrder;
	}

	public void setSalesOrder(SalesOrder salesOrder) {
		this.salesOrder = salesOrder;
	}

	public String getSales_product_karret() {
		return sales_product_karret;
	}

	public void setSales_product_karret(String sales_product_karret) {
		this.sales_product_karret = sales_product_karret;
	}

	@Override
	public String toString() {
		return "SalesProduct [salesProduct_id=" + salesProduct_id + ", sales_product_metal_type="
				+ sales_product_metal_type + ", todays_metal_rate=" + todays_metal_rate + ", sales_product_name="
				+ sales_product_name + ", sales_product_weight=" + sales_product_weight
				+ ", sales_product_making_charge=" + sales_product_making_charge + ", sales_product_image_name="
				+ sales_product_image_name + ", sales_product_imageFile=" + sales_product_imageFile
				+ ", sales_product_price=" + sales_product_price + ", sales_product_quantity=" + sales_product_quantity
				+ ", sales_product_quantity_price=" + sales_product_quantity_price + ", sales_product_create_date="
				+ sales_product_create_date + ", sales_product_last_modify_date=" + sales_product_last_modify_date
				+ ", salesOrder=" + salesOrder + "]";
	}

	

	
	
}
