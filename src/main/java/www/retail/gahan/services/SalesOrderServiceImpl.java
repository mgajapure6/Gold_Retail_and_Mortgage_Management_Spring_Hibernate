package www.retail.gahan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.SalesOrder;
import www.retail.gahan.daos.SalesOrderDaoI;

public class SalesOrderServiceImpl implements SalesOrderServiceI {

	@Autowired
	private SalesOrderDaoI salesOrderDaoI;
	
	public void setSalesOrderDaoI(SalesOrderDaoI salesOrderDaoI) {
		this.salesOrderDaoI = salesOrderDaoI;
	}


	@Override
	public Integer getSalesOrderMaxId() {
		return salesOrderDaoI.getSalesOrderMaxId();
	}


	@Override
	public Integer getMaxSalesOrderNumber() {
		return salesOrderDaoI.getMaxSalesOrderNumber();
	}


	@Override
	public List<SalesOrder> getAllSalesOrders() {
		return salesOrderDaoI.getAllSalesOrders();
	}


	@Override
	public SalesOrder getSalesOrderBySalesOrderNumber(Integer salesOrderNumber) {
		return salesOrderDaoI.getSalesOrderBySalesOrderNumber(salesOrderNumber);
	}


	@Override
	public Integer updateSalesOrder( Integer salesOrderNumber, Double newPaidAmount, Double newBalanceAmount) {
		return salesOrderDaoI.updateSalesOrder( salesOrderNumber, newPaidAmount,newBalanceAmount);
	}


	@Override
	public Integer mergeNewSalesPaymentToSalesOrder(SalesOrder salesOrder) {
		return salesOrderDaoI.mergeNewSalesPaymentToSalesOrder(salesOrder);
	}


	@Override
	public Long getTotalSalesOrderCount() {
		return salesOrderDaoI.getTotalSalesOrderCount();
	}


	@SuppressWarnings("rawtypes")
	@Override
	public List monthlySalesOrderCountReport() {
		return salesOrderDaoI.monthlySalesOrderCountReport();
	}

}
