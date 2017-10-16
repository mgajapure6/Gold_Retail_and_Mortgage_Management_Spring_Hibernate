package www.retail.gahan.services;

import java.util.List;

import www.retail.gahan.beans.SalesOrder;
@SuppressWarnings("rawtypes")
public interface SalesReportServiceI {


	public List<SalesOrder> getSalesOrderReport();
	public List getSalesOrderInvoiceReport();
	
	public List getSalesOrderReportList();
	public List getSalesOrderReportChart();
	public List getReceivableReport();
}
