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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class SalesOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer salesOrder_id;
	
	@Column
	private Integer salesOrder_number;
	
	@Column(name="salesOrder_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String salesOrder_date;
	
	@Column(name="salesOrder_return_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String salesOrder_return_date;
	
	@Column
	private Double salesOrder_total_price_before_discount;
	
	@Column
	private Double salesOrder_discount;
	
	@Column
	private Double salesOrder_total_price_after_discount;
	
	@Column
	private Double salesOrder_paid_amount;
	
	@Column
	private Double salesOrder_balance_amount;
	
	@Column
	private Integer salesOrder_total_products;
	
	@Column
	private Integer salesOrder_total_quantities;
	
	@Column
	private Double salesOrder_total_weight;
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="salesOrder_salesProducts", joinColumns = {@JoinColumn(name="salesOrder_id")}, inverseJoinColumns = {@JoinColumn(name="salesProduct_id")})
	private Collection<SalesProduct> salesProducts = new ArrayList<SalesProduct>();
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="salesOrder_salesPayments", joinColumns = {@JoinColumn(name="salesOrder_id")}, inverseJoinColumns = {@JoinColumn(name="salesPayment_id")})
	private Collection<SalesPayment> salesPayments = new ArrayList<SalesPayment>();
	
	@ManyToOne
	private Customer customer;

	public Integer getSalesOrder_id() {
		return salesOrder_id;
	}

	public void setSalesOrder_id(Integer salesOrder_id) {
		this.salesOrder_id = salesOrder_id;
	}

	public Integer getSalesOrder_number() {
		return salesOrder_number;
	}

	public void setSalesOrder_number(Integer salesOrder_number) {
		this.salesOrder_number = salesOrder_number;
	}

	public String getSalesOrder_date() {
		return salesOrder_date;
	}

	public void setSalesOrder_date(String salesOrder_date) {
		this.salesOrder_date = salesOrder_date;
	}

	public Double getSalesOrder_total_price_before_discount() {
		return salesOrder_total_price_before_discount;
	}

	public void setSalesOrder_total_price_before_discount(Double salesOrder_total_price_before_discount) {
		this.salesOrder_total_price_before_discount = salesOrder_total_price_before_discount;
	}

	public Double getSalesOrder_discount() {
		return salesOrder_discount;
	}

	public void setSalesOrder_discount(Double salesOrder_discount) {
		this.salesOrder_discount = salesOrder_discount;
	}

	public Double getSalesOrder_total_price_after_discount() {
		return salesOrder_total_price_after_discount;
	}

	public void setSalesOrder_total_price_after_discount(Double salesOrder_total_price_after_discount) {
		this.salesOrder_total_price_after_discount = salesOrder_total_price_after_discount;
	}

	public Double getSalesOrder_paid_amount() {
		return salesOrder_paid_amount;
	}

	public void setSalesOrder_paid_amount(Double salesOrder_paid_amount) {
		this.salesOrder_paid_amount = salesOrder_paid_amount;
	}

	public Double getSalesOrder_balance_amount() {
		return salesOrder_balance_amount;
	}

	public void setSalesOrder_balance_amount(Double salesOrder_balance_amount) {
		this.salesOrder_balance_amount = salesOrder_balance_amount;
	}

	public Integer getSalesOrder_total_products() {
		return salesOrder_total_products;
	}

	public void setSalesOrder_total_products(Integer salesOrder_total_products) {
		this.salesOrder_total_products = salesOrder_total_products;
	}

	public Integer getSalesOrder_total_quantities() {
		return salesOrder_total_quantities;
	}

	public void setSalesOrder_total_quantities(Integer salesOrder_total_quantities) {
		this.salesOrder_total_quantities = salesOrder_total_quantities;
	}

	public Double getSalesOrder_total_weight() {
		return salesOrder_total_weight;
	}

	public void setSalesOrder_total_weight(Double salesOrder_total_weight) {
		this.salesOrder_total_weight = salesOrder_total_weight;
	}

	public Collection<SalesProduct> getSalesProducts() {
		return salesProducts;
	}

	public void setSalesProducts(Collection<SalesProduct> salesProducts) {
		this.salesProducts = salesProducts;
	}

	public Collection<SalesPayment> getSalesPayments() {
		return salesPayments;
	}

	public void setSalesPayments(Collection<SalesPayment> salesPayments) {
		this.salesPayments = salesPayments;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "SalesOrder [salesOrder_id=" + salesOrder_id + ", salesOrder_number=" + salesOrder_number
				+ ", salesOrder_date=" + salesOrder_date + ", salesOrder_total_price_before_discount="
				+ salesOrder_total_price_before_discount + ", salesOrder_discount=" + salesOrder_discount
				+ ", salesOrder_total_price_after_discount=" + salesOrder_total_price_after_discount
				+ ", salesOrder_paid_amount=" + salesOrder_paid_amount + ", salesOrder_balance_amount="
				+ salesOrder_balance_amount + ", salesOrder_total_products=" + salesOrder_total_products
				+ ", salesOrder_total_quantities=" + salesOrder_total_quantities + ", salesOrder_total_weight="
				+ salesOrder_total_weight + ", salesProducts=" + salesProducts + ", salesPayments=" + salesPayments
				+ ", customer=" + customer + "]";
	}

	

	
}
