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
public class GahanPayment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer gp_payment_id;
	
	@Column
	private Double gp_withdrawal_amt;
	
	@Column(name="gp_gahan_making_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gp_gahan_making_date;
	
	@Column
	private Double gp_i_amt_from_last_paid_date;
	
	@Column
	private Double gp_paid_amount;
	
	@Column(name="gp_paid_amount_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gp_paid_amount_date;
	
	@Column(name="gp_paying_method",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gp_paying_method;
	
	@Column
	private Double preBalance_of_ia;
	
	@Column
	private Double preBalance_of_ia_plus_new_ia;
	
	@Column
	private Double gp_total_pending_amount;
	
	@ManyToOne
	private GahanProduct gahanProduct;

	public Integer getGp_payment_id() {
		return gp_payment_id;
	}

	public void setGp_payment_id(Integer gp_payment_id) {
		this.gp_payment_id = gp_payment_id;
	}

	public Double getGp_withdrawal_amt() {
		return gp_withdrawal_amt;
	}

	public void setGp_withdrawal_amt(Double gp_withdrawal_amt) {
		this.gp_withdrawal_amt = gp_withdrawal_amt;
	}

	public String getGp_gahan_making_date() {
		return gp_gahan_making_date;
	}

	public void setGp_gahan_making_date(String gp_gahan_making_date) {
		this.gp_gahan_making_date = gp_gahan_making_date;
	}

	public Double getGp_i_amt_from_last_paid_date() {
		return gp_i_amt_from_last_paid_date;
	}

	public void setGp_i_amt_from_last_paid_date(Double gp_i_amt_from_last_paid_date) {
		this.gp_i_amt_from_last_paid_date = gp_i_amt_from_last_paid_date;
	}

	public Double getGp_paid_amount() {
		return gp_paid_amount;
	}

	public void setGp_paid_amount(Double gp_paid_amount) {
		this.gp_paid_amount = gp_paid_amount;
	}

	public String getGp_paid_amount_date() {
		return gp_paid_amount_date;
	}

	public void setGp_paid_amount_date(String gp_paid_amount_date) {
		this.gp_paid_amount_date = gp_paid_amount_date;
	}

	public String getGp_paying_method() {
		return gp_paying_method;
	}

	public void setGp_paying_method(String gp_paying_method) {
		this.gp_paying_method = gp_paying_method;
	}

	public Double getPreBalance_of_ia() {
		return preBalance_of_ia;
	}

	public void setPreBalance_of_ia(Double preBalance_of_ia) {
		this.preBalance_of_ia = preBalance_of_ia;
	}

	public Double getPreBalance_of_ia_plus_new_ia() {
		return preBalance_of_ia_plus_new_ia;
	}

	public void setPreBalance_of_ia_plus_new_ia(Double preBalance_of_ia_plus_new_ia) {
		this.preBalance_of_ia_plus_new_ia = preBalance_of_ia_plus_new_ia;
	}

	public Double getGp_total_pending_amount() {
		return gp_total_pending_amount;
	}

	public void setGp_total_pending_amount(Double gp_total_pending_amount) {
		this.gp_total_pending_amount = gp_total_pending_amount;
	}

	public GahanProduct getGahanProduct() {
		return gahanProduct;
	}

	public void setGahanProduct(GahanProduct gahanProduct) {
		this.gahanProduct = gahanProduct;
	}

	@Override
	public String toString() {
		return "GahanPayment [gp_payment_id=" + gp_payment_id + ", gp_withdrawal_amt=" + gp_withdrawal_amt
				+ ", gp_gahan_making_date=" + gp_gahan_making_date + ", gp_i_amt_from_last_paid_date="
				+ gp_i_amt_from_last_paid_date + ", gp_paid_amount=" + gp_paid_amount + ", gp_paid_amount_date="
				+ gp_paid_amount_date + ", gp_paying_method=" + gp_paying_method + ", preBalance_of_ia="
				+ preBalance_of_ia + ", preBalance_of_ia_plus_new_ia=" + preBalance_of_ia_plus_new_ia
				+ ", gp_total_pending_amount=" + gp_total_pending_amount + ", gahanProduct=" + gahanProduct + "]";
	}

	
	
	
}
