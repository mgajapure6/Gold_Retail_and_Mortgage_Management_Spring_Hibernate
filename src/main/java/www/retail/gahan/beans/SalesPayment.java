package www.retail.gahan.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class SalesPayment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer salesPayment_id;
	
	@Column
	private Double salesPayment_total_amount;
	
	@Column
	private Double salesPayment_paid_amount;
	
	@Column(name="salesPayment_paid_amount_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String salesPayment_paid_amount_date;
	
	@Column(name="salesPayment_paid_method",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String salesPayment_paid_method;
	
	@Column
	private Double salesPayment_balance_amount;
	
	@ManyToOne
	private SalesOrder salesOrder;

	public Integer getSalesPayment_id() {
		return salesPayment_id;
	}

	public void setSalesPayment_id(Integer salesPayment_id) {
		this.salesPayment_id = salesPayment_id;
	}

	public Double getSalesPayment_total_amount() {
		return salesPayment_total_amount;
	}

	public void setSalesPayment_total_amount(Double salesPayment_total_amount) {
		this.salesPayment_total_amount = salesPayment_total_amount;
	}

	public Double getSalesPayment_paid_amount() {
		return salesPayment_paid_amount;
	}

	public void setSalesPayment_paid_amount(Double salesPayment_paid_amount) {
		this.salesPayment_paid_amount = salesPayment_paid_amount;
	}

	public String getSalesPayment_paid_amount_date() {
		return salesPayment_paid_amount_date;
	}

	public void setSalesPayment_paid_amount_date(String salesPayment_paid_amount_date) {
		this.salesPayment_paid_amount_date = salesPayment_paid_amount_date;
	}

	public String getSalesPayment_paid_method() {
		return salesPayment_paid_method;
	}

	public void setSalesPayment_paid_method(String salesPayment_paid_method) {
		this.salesPayment_paid_method = salesPayment_paid_method;
	}

	public Double getSalesPayment_balance_amount() {
		return salesPayment_balance_amount;
	}

	public void setSalesPayment_balance_amount(Double salesPayment_balance_amount) {
		this.salesPayment_balance_amount = salesPayment_balance_amount;
	}

	public SalesOrder getSalesOrder() {
		return salesOrder;
	}

	public void setSalesOrder(SalesOrder salesOrder) {
		this.salesOrder = salesOrder;
	}

	@Override
	public String toString() {
		return "SalesPayment [salesPayment_id=" + salesPayment_id + ", salesPayment_total_amount="
				+ salesPayment_total_amount + ", salesPayment_paid_amount=" + salesPayment_paid_amount
				+ ", salesPayment_paid_amount_date=" + salesPayment_paid_amount_date + ", salesPayment_paid_method="
				+ salesPayment_paid_method + ", salesPayment_balance_amount=" + salesPayment_balance_amount
				+ ", salesOrder=" + salesOrder + "]";
	}

	
}
