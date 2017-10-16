package www.retail.gahan.services;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.daos.PurchasePaymentDaoI;

public class PurchasePaymentServiceImpl implements PurchasePaymentServiceI {
	@Autowired
	private PurchasePaymentDaoI purchasePaymentDaoI;
	
	public void setPurchasePaymentDaoI(PurchasePaymentDaoI purchasePaymentDaoI) {
		this.purchasePaymentDaoI = purchasePaymentDaoI;
	}


	@Override
	public Integer getPurchasePaymentMaxId() {
		return purchasePaymentDaoI.getPurchasePaymentMaxId();
	}

}
