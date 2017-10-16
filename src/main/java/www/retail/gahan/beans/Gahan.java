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
public class Gahan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer gahan_id;
	
	@Column
	private Integer gahan_number;
	
	@Column(name="gahan_making_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gahan_making_date;
	
	@Column
	private Double gahanProducts_total_net_weight;
	
	@Column
	private Double gahan_widthdraw_money;
	
	@Column
	private Integer gahan_month_period;
	
	@Column
	private Double gahan_interest_rate;
	
	@Column
	private Double gahan_interest_amount;
	
	@Column
	private Double gahan_total_money_to_be_paid;
	
	@Column
	private Integer gahan_total_products;
	
	@Column(name="gahan_money_deposit_last_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gahan_money_deposit_last_date;
	
	@Column(name="gahan_status",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gahan_status;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name="gahan_gahanProducts", joinColumns = {@JoinColumn(name="gahan_id")}, inverseJoinColumns = {@JoinColumn(name="gp_id")})
	private Collection<GahanProduct> gahanProducts = new ArrayList<GahanProduct>();
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name="gahan_gahanPayments", joinColumns = {@JoinColumn(name="gahan_id")}, inverseJoinColumns = {@JoinColumn(name="gp_payment_id")})
	private Collection<GahanPayment> gahanPayments = new ArrayList<GahanPayment>();
	
	@ManyToOne
	private Customer customer;

	public Integer getGahan_id() {
		return gahan_id;
	}

	public void setGahan_id(Integer gahan_id) {
		this.gahan_id = gahan_id;
	}

	public Integer getGahan_number() {
		return gahan_number;
	}

	public void setGahan_number(Integer gahan_number) {
		this.gahan_number = gahan_number;
	}

	public String getGahan_making_date() {
		return gahan_making_date;
	}

	public void setGahan_making_date(String gahan_making_date) {
		this.gahan_making_date = gahan_making_date;
	}

	public Double getGahanProducts_total_net_weight() {
		return gahanProducts_total_net_weight;
	}

	public void setGahanProducts_total_net_weight(Double gahanProducts_total_net_weight) {
		this.gahanProducts_total_net_weight = gahanProducts_total_net_weight;
	}

	public Double getGahan_widthdraw_money() {
		return gahan_widthdraw_money;
	}

	public void setGahan_widthdraw_money(Double gahan_widthdraw_money) {
		this.gahan_widthdraw_money = gahan_widthdraw_money;
	}

	public Integer getGahan_month_period() {
		return gahan_month_period;
	}

	public void setGahan_month_period(Integer gahan_month_period) {
		this.gahan_month_period = gahan_month_period;
	}

	public Double getGahan_interest_rate() {
		return gahan_interest_rate;
	}

	public void setGahan_interest_rate(Double gahan_interest_rate) {
		this.gahan_interest_rate = gahan_interest_rate;
	}

	public Double getGahan_interest_amount() {
		return gahan_interest_amount;
	}

	public void setGahan_interest_amount(Double gahan_interest_amount) {
		this.gahan_interest_amount = gahan_interest_amount;
	}

	public Double getGahan_total_money_to_be_paid() {
		return gahan_total_money_to_be_paid;
	}

	public void setGahan_total_money_to_be_paid(Double gahan_total_money_to_be_paid) {
		this.gahan_total_money_to_be_paid = gahan_total_money_to_be_paid;
	}

	public Integer getGahan_total_products() {
		return gahan_total_products;
	}

	public void setGahan_total_products(Integer gahan_total_products) {
		this.gahan_total_products = gahan_total_products;
	}

	public String getGahan_money_deposit_last_date() {
		return gahan_money_deposit_last_date;
	}

	public void setGahan_money_deposit_last_date(String gahan_money_deposit_last_date) {
		this.gahan_money_deposit_last_date = gahan_money_deposit_last_date;
	}

	public String getGahan_status() {
		return gahan_status;
	}

	public void setGahan_status(String gahan_status) {
		this.gahan_status = gahan_status;
	}

	public Collection<GahanProduct> getGahanProducts() {
		return gahanProducts;
	}

	public void setGahanProducts(Collection<GahanProduct> gahanProducts) {
		this.gahanProducts = gahanProducts;
	}

	public Collection<GahanPayment> getGahanPayments() {
		return gahanPayments;
	}

	public void setGahanPayments(Collection<GahanPayment> gahanPayments) {
		this.gahanPayments = gahanPayments;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	
}
