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
public class PurchaseOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer purchaseOrder_id;
	
	@Column
	private Integer purchaseOrder_number;
	
	@Column
	private String purchaseOrder_date;
	
	@Column
	private Double purchaseOrder_total_price_before_discount;
	
	@Column
	private Double purchaseOrder_discount;
	
	@Column
	private Double purchaseOrder_total_price_after_discount;
	
	@Column
	private Double purchaseOrder_paid_amount;
	
	@Column
	private Double purchaseOrder_balance_amount;
	
	@Column
	private Integer purchaseOrder_total_products;
	
	@Column
	private Integer purchaseOrder_total_quantities;
	
	@Column
	private Double purchaseOrder_total_weight;
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="purchaseOrder_purchaseProducts", joinColumns = {@JoinColumn(name="purchaseOrder_id")}, inverseJoinColumns = {@JoinColumn(name="purchaseProduct_id")})
	private Collection<PurchaseProduct> purchaseProducts = new ArrayList<PurchaseProduct>();
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="purchaseOrder_purchasePayments", joinColumns = {@JoinColumn(name="purchaseOrder_id")}, inverseJoinColumns = {@JoinColumn(name="purchasePayment_id")})
	private Collection<PurchasePayment> purchasePayments = new ArrayList<PurchasePayment>();
	
	@ManyToOne
	private Supplier supplier;

	public Integer getPurchaseOrder_id() {
		return purchaseOrder_id;
	}

	public void setPurchaseOrder_id(Integer purchaseOrder_id) {
		this.purchaseOrder_id = purchaseOrder_id;
	}

	public Integer getPurchaseOrder_number() {
		return purchaseOrder_number;
	}

	public void setPurchaseOrder_number(Integer purchaseOrder_number) {
		this.purchaseOrder_number = purchaseOrder_number;
	}

	public String getPurchaseOrder_date() {
		return purchaseOrder_date;
	}

	public void setPurchaseOrder_date(String purchaseOrder_date) {
		this.purchaseOrder_date = purchaseOrder_date;
	}

	public Double getPurchaseOrder_total_price_before_discount() {
		return purchaseOrder_total_price_before_discount;
	}

	public void setPurchaseOrder_total_price_before_discount(Double purchaseOrder_total_price_before_discount) {
		this.purchaseOrder_total_price_before_discount = purchaseOrder_total_price_before_discount;
	}

	public Double getPurchaseOrder_discount() {
		return purchaseOrder_discount;
	}

	public void setPurchaseOrder_discount(Double purchaseOrder_discount) {
		this.purchaseOrder_discount = purchaseOrder_discount;
	}

	public Double getPurchaseOrder_total_price_after_discount() {
		return purchaseOrder_total_price_after_discount;
	}

	public void setPurchaseOrder_total_price_after_discount(Double purchaseOrder_total_price_after_discount) {
		this.purchaseOrder_total_price_after_discount = purchaseOrder_total_price_after_discount;
	}

	public Double getPurchaseOrder_paid_amount() {
		return purchaseOrder_paid_amount;
	}

	public void setPurchaseOrder_paid_amount(Double purchaseOrder_paid_amount) {
		this.purchaseOrder_paid_amount = purchaseOrder_paid_amount;
	}

	public Double getPurchaseOrder_balance_amount() {
		return purchaseOrder_balance_amount;
	}

	public void setPurchaseOrder_balance_amount(Double purchaseOrder_balance_amount) {
		this.purchaseOrder_balance_amount = purchaseOrder_balance_amount;
	}

	public Integer getPurchaseOrder_total_products() {
		return purchaseOrder_total_products;
	}

	public void setPurchaseOrder_total_products(Integer purchaseOrder_total_products) {
		this.purchaseOrder_total_products = purchaseOrder_total_products;
	}

	public Integer getPurchaseOrder_total_quantities() {
		return purchaseOrder_total_quantities;
	}

	public void setPurchaseOrder_total_quantities(Integer purchaseOrder_total_quantities) {
		this.purchaseOrder_total_quantities = purchaseOrder_total_quantities;
	}

	public Collection<PurchaseProduct> getPurchaseProducts() {
		return purchaseProducts;
	}

	public void setPurchaseProducts(Collection<PurchaseProduct> purchaseProducts) {
		this.purchaseProducts = purchaseProducts;
	}

	public Collection<PurchasePayment> getPurchasePayments() {
		return purchasePayments;
	}

	public void setPurchasePayments(Collection<PurchasePayment> purchasePayments) {
		this.purchasePayments = purchasePayments;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Double getPurchaseOrder_total_weight() {
		return purchaseOrder_total_weight;
	}

	public void setPurchaseOrder_total_weight(Double purchaseOrder_total_weight) {
		this.purchaseOrder_total_weight = purchaseOrder_total_weight;
	}

	@Override
	public String toString() {
		return "PurchaseOrder [purchaseOrder_id=" + purchaseOrder_id + ", purchaseOrder_number=" + purchaseOrder_number
				+ ", purchaseOrder_date=" + purchaseOrder_date + ", purchaseOrder_total_price_before_discount="
				+ purchaseOrder_total_price_before_discount + ", purchaseOrder_discount=" + purchaseOrder_discount
				+ ", purchaseOrder_total_price_after_discount=" + purchaseOrder_total_price_after_discount
				+ ", purchaseOrder_paid_amount=" + purchaseOrder_paid_amount + ", purchaseOrder_balance_amount="
				+ purchaseOrder_balance_amount + ", purchaseOrder_total_products=" + purchaseOrder_total_products
				+ ", purchaseOrder_total_quantities=" + purchaseOrder_total_quantities + ", purchaseOrder_total_weight="
				+ purchaseOrder_total_weight + ", purchaseProducts=" + purchaseProducts + ", purchasePayments="
				+ purchasePayments + ", supplier=" + supplier + "]";
	}

	
	
}
