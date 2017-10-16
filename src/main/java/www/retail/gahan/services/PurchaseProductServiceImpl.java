package www.retail.gahan.services;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.daos.PurchaseProductDaoI;

public class PurchaseProductServiceImpl implements PurchaseProductServiceI {
	@Autowired
	private PurchaseProductDaoI purchaseProductDaoI;
	
	public void setPurchaseProductDaoI(PurchaseProductDaoI purchaseProductDaoI) {
		this.purchaseProductDaoI = purchaseProductDaoI;
	}

	@Override
	public Integer getPurchaseProductMaxId() {
		return purchaseProductDaoI.getPurchaseProductMaxId();
	}

}
