package www.retail.gahan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.PurchaseOrder;
import www.retail.gahan.daos.PurchaseOrderDaoI;

public class PurchaseOrderServiceImpl implements PurchaseOrderServiceI {

	@Autowired
	private PurchaseOrderDaoI purchaseOrderDaoI;
	
	public void setPurchaseOrderDaoI(PurchaseOrderDaoI purchaseOrderDaoI) {
		this.purchaseOrderDaoI = purchaseOrderDaoI;
	}


	@Override
	public Integer getPurchaseOrderMaxId() {
		return purchaseOrderDaoI.getPurchaseOrderMaxId();
	}


	@Override
	public Integer getMaxPurchseOrderNumber() {
		return purchaseOrderDaoI.getMaxPurchseOrderNumber();
	}


	@Override
	public List<PurchaseOrder> getAllPurchaseOrders() {
		return purchaseOrderDaoI.getAllPurchaseOrders();
	}


	@Override
	public PurchaseOrder getPurchaseOrderByPurchaseOrderNumber(Integer purchaseOrderNumber) {
		return purchaseOrderDaoI.getPurchaseOrderByPurchaseOrderNumber(purchaseOrderNumber);
	}


	@Override
	public Integer updatePurchaseOrder( Integer purchaseOrderNumber, Double newPaidAmount, Double newBalanceAmount) {
		return purchaseOrderDaoI.updatePurchaseOrder( purchaseOrderNumber, newPaidAmount,newBalanceAmount);
	}


	@Override
	public Integer mergeNewPurchasePaymentToPurchaseOrder(PurchaseOrder purchaseOrder) {
		return purchaseOrderDaoI.mergeNewPurchasePaymentToPurchaseOrder(purchaseOrder);
	}


	@Override
	public Long getTotalPurchaseOrdersCount() {
		// TODO Auto-generated method stub
		return purchaseOrderDaoI.getTotalPurchaseOrdersCount();
	}

}
