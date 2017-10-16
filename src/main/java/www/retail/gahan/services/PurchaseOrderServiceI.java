package www.retail.gahan.services;

import java.util.List;

import www.retail.gahan.beans.PurchaseOrder;

public interface PurchaseOrderServiceI {

	public Integer getPurchaseOrderMaxId();

	public Integer getMaxPurchseOrderNumber();

	public List<PurchaseOrder> getAllPurchaseOrders();

	public PurchaseOrder getPurchaseOrderByPurchaseOrderNumber(Integer purchaseOrderNumber);

	public Integer updatePurchaseOrder( Integer purchaseOrderNumber, Double newPaidAmount, Double newBalanceAmount);

	public Integer mergeNewPurchasePaymentToPurchaseOrder(PurchaseOrder purchaseOrder);

	public Long getTotalPurchaseOrdersCount();

}
