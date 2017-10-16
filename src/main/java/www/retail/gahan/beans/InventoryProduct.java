package www.retail.gahan.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class InventoryProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer inventoryProduct_id;
	
	@Column(name="inventoryProduct_metal_type",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String inventoryProduct_metal_type;
	
	@Column
	private Double inventoryProduct_metal_rate;
	
	
	@Column(name="inventoryProduct_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String inventoryProduct_name;
	
	@Column
	private Double inventoryProduct_cost_price;
	
	@Column
	private Integer inventoryProduct_quantity;
	
	@Column(name="inventoryProduct_create_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String inventoryProduct_create_date;
	
	@Column(name="inventoryProduct_last_modified_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String inventoryProduct_last_modified_date;

	public Integer getInventoryProduct_id() {
		return inventoryProduct_id;
	}

	public void setInventoryProduct_id(Integer inventoryProduct_id) {
		this.inventoryProduct_id = inventoryProduct_id;
	}

	public String getInventoryProduct_name() {
		return inventoryProduct_name;
	}

	public String getInventoryProduct_metal_type() {
		return inventoryProduct_metal_type;
	}

	public void setInventoryProduct_metal_type(String inventoryProduct_metal_type) {
		this.inventoryProduct_metal_type = inventoryProduct_metal_type;
	}

	public Double getInventoryProduct_metal_rate() {
		return inventoryProduct_metal_rate;
	}

	public void setInventoryProduct_metal_rate(Double inventoryProduct_metal_rate) {
		this.inventoryProduct_metal_rate = inventoryProduct_metal_rate;
	}

	public void setInventoryProduct_name(String inventoryProduct_name) {
		this.inventoryProduct_name = inventoryProduct_name;
	}

	public Double getInventoryProduct_cost_price() {
		return inventoryProduct_cost_price;
	}

	public void setInventoryProduct_cost_price(Double inventoryProduct_cost_price) {
		this.inventoryProduct_cost_price = inventoryProduct_cost_price;
	}

	public Integer getInventoryProduct_quantity() {
		return inventoryProduct_quantity;
	}

	public void setInventoryProduct_quantity(Integer inventoryProduct_quantity) {
		this.inventoryProduct_quantity = inventoryProduct_quantity;
	}

	public String getInventoryProduct_create_date() {
		return inventoryProduct_create_date;
	}

	public void setInventoryProduct_create_date(String inventoryProduct_create_date) {
		this.inventoryProduct_create_date = inventoryProduct_create_date;
	}

	public String getInventoryProduct_last_modified_date() {
		return inventoryProduct_last_modified_date;
	}

	public void setInventoryProduct_last_modified_date(String inventoryProduct_last_modified_date) {
		this.inventoryProduct_last_modified_date = inventoryProduct_last_modified_date;
	}

	@Override
	public String toString() {
		return "InventoryProduct [inventoryProduct_id=" + inventoryProduct_id + ", inventoryProduct_metal_type="
				+ inventoryProduct_metal_type + ", inventoryProduct_metal_rate=" + inventoryProduct_metal_rate
				+ ", inventoryProduct_name=" + inventoryProduct_name + ", inventoryProduct_cost_price="
				+ inventoryProduct_cost_price + ", inventoryProduct_quantity=" + inventoryProduct_quantity
				+ ", inventoryProduct_create_date=" + inventoryProduct_create_date
				+ ", inventoryProduct_last_modified_date=" + inventoryProduct_last_modified_date + "]";
	}

	
}
