package www.retail.gahan.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class PurchaseProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer purchaseProduct_id;
	
	@Column(name="purchaseProduct_metal_type",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String purchaseProduct_metal_type;
	
	@Column
	private Double purchaseProduct_metal_rate;
	
	@Column(name="purchaseProduct_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String purchaseProduct_name;
	
	@Column
	private Double purchaseProduct_cost_price;
	
	@Column
	private Double purchaseProduct_selling_price;
	
	@Column
	private Integer purchaseProduct_quantity;
	
	@Column
	private Double purchaseProduct_quantity_price;
	
	@Column(name="purchaseProduct_create_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String purchaseProduct_create_date;
	
	@Column(name="purchaseProduct_last_modify_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String purchaseProduct_last_modify_date;
	
	@ManyToOne
	private PurchaseOrder purchaseOrder;

	public Integer getPurchaseProduct_id() {
		return purchaseProduct_id;
	}

	public void setPurchaseProduct_id(Integer purchaseProduct_id) {
		this.purchaseProduct_id = purchaseProduct_id;
	}

	public String getPurchaseProduct_name() {
		return purchaseProduct_name;
	}

	public void setPurchaseProduct_name(String purchaseProduct_name) {
		this.purchaseProduct_name = purchaseProduct_name;
	}

	public Double getPurchaseProduct_cost_price() {
		return purchaseProduct_cost_price;
	}

	public void setPurchaseProduct_cost_price(Double purchaseProduct_cost_price) {
		this.purchaseProduct_cost_price = purchaseProduct_cost_price;
	}

	public Double getPurchaseProduct_selling_price() {
		return purchaseProduct_selling_price;
	}

	public void setPurchaseProduct_selling_price(Double purchaseProduct_selling_price) {
		this.purchaseProduct_selling_price = purchaseProduct_selling_price;
	}

	public Integer getPurchaseProduct_quantity() {
		return purchaseProduct_quantity;
	}

	public void setPurchaseProduct_quantity(Integer purchaseProduct_quantity) {
		this.purchaseProduct_quantity = purchaseProduct_quantity;
	}

	public Double getPurchaseProduct_quantity_price() {
		return purchaseProduct_quantity_price;
	}

	public void setPurchaseProduct_quantity_price(Double purchaseProduct_quantity_price) {
		this.purchaseProduct_quantity_price = purchaseProduct_quantity_price;
	}

	public String getPurchaseProduct_create_date() {
		return purchaseProduct_create_date;
	}

	public void setPurchaseProduct_create_date(String purchaseProduct_create_date) {
		this.purchaseProduct_create_date = purchaseProduct_create_date;
	}

	public String getPurchaseProduct_last_modify_date() {
		return purchaseProduct_last_modify_date;
	}

	public void setPurchaseProduct_last_modify_date(String purchaseProduct_last_modify_date) {
		this.purchaseProduct_last_modify_date = purchaseProduct_last_modify_date;
	}

	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	@Override
	public String toString() {
		return "PurchaseProduct [purchaseProduct_id=" + purchaseProduct_id + ", purchaseProduct_name="
				+ purchaseProduct_name + ", purchaseProduct_cost_price=" + purchaseProduct_cost_price
				+ ", purchaseProduct_selling_price=" + purchaseProduct_selling_price + ", purchaseProduct_quantity="
				+ purchaseProduct_quantity + ", purchaseProduct_quantity_price=" + purchaseProduct_quantity_price
				+ ", purchaseProduct_create_date=" + purchaseProduct_create_date + ", purchaseProduct_last_modify_date="
				+ purchaseProduct_last_modify_date + ", purchaseOrder=" + purchaseOrder + "]";
	}
	
	
}
