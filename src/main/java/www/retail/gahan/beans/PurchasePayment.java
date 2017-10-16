package www.retail.gahan.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class PurchasePayment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer purchasePayment_id;
	
	@Column
	private Double purchasePayment_total_amount;
	
	@Column
	private Double purchasePayment_paid_amount;
	
	@Column
	private String purchasePayment_paid_amount_date;
	
	@Column
	private String purchasePayment_paid_method;
	
	@Column
	private Double purchasePayment_balance_amount;
	
	@ManyToOne
	private PurchaseOrder purchaseOrder;

	public Integer getPurchasePayment_id() {
		return purchasePayment_id;
	}

	public void setPurchasePayment_id(Integer purchasePayment_id) {
		this.purchasePayment_id = purchasePayment_id;
	}

	public Double getPurchasePayment_total_amount() {
		return purchasePayment_total_amount;
	}

	public void setPurchasePayment_total_amount(Double purchasePayment_total_amount) {
		this.purchasePayment_total_amount = purchasePayment_total_amount;
	}

	public Double getPurchasePayment_paid_amount() {
		return purchasePayment_paid_amount;
	}

	public void setPurchasePayment_paid_amount(Double purchasePayment_paid_amount) {
		this.purchasePayment_paid_amount = purchasePayment_paid_amount;
	}

	public String getPurchasePayment_paid_amount_date() {
		return purchasePayment_paid_amount_date;
	}

	public void setPurchasePayment_paid_amount_date(String purchasePayment_paid_amount_date) {
		this.purchasePayment_paid_amount_date = purchasePayment_paid_amount_date;
	}

	public String getPurchasePayment_paid_method() {
		return purchasePayment_paid_method;
	}

	public void setPurchasePayment_paid_method(String purchasePayment_paid_method) {
		this.purchasePayment_paid_method = purchasePayment_paid_method;
	}

	public Double getPurchasePayment_balance_amount() {
		return purchasePayment_balance_amount;
	}

	public void setPurchasePayment_balance_amount(Double purchasePayment_balance_amount) {
		this.purchasePayment_balance_amount = purchasePayment_balance_amount;
	}

	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	@Override
	public String toString() {
		return "PurchasePayment [purchasePayment_id=" + purchasePayment_id + ", purchasePayment_total_amount="
				+ purchasePayment_total_amount + ", purchasePayment_paid_amount=" + purchasePayment_paid_amount
				+ ", purchasePayment_paid_amount_date=" + purchasePayment_paid_amount_date
				+ ", purchasePayment_balance_amount=" + purchasePayment_balance_amount + ", purchaseOrder="
				+ purchaseOrder + "]";
	}
	
	
}
