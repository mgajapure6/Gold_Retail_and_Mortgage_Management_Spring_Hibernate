package www.retail.gahan.daos;

import java.util.List;

import www.retail.gahan.beans.SalesOrder;

@SuppressWarnings("rawtypes")
public interface SalesReportDaoI {

	public List<SalesOrder> getSalesOrderReport();
	public List getSalesOrderInvoiceReport();
	
	public List getSalesOrderReportList();
	public List getSalesOrderReportChart();
	List getReceivableReport();
}
