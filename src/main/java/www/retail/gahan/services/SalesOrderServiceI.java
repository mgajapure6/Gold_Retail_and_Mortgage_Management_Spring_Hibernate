package www.retail.gahan.services;

import java.util.List;

import www.retail.gahan.beans.SalesOrder;

public interface SalesOrderServiceI {

	public Integer getSalesOrderMaxId();

	public Integer getMaxSalesOrderNumber();

	public List<SalesOrder> getAllSalesOrders();

	public SalesOrder getSalesOrderBySalesOrderNumber(Integer salesOrderNumber);

	public Integer updateSalesOrder( Integer salesOrderNumber, Double newPaidAmount, Double newBalanceAmount);

	public Integer mergeNewSalesPaymentToSalesOrder(SalesOrder salesOrder);

	public Long getTotalSalesOrderCount();

	@SuppressWarnings("rawtypes")
	public List monthlySalesOrderCountReport();

}
