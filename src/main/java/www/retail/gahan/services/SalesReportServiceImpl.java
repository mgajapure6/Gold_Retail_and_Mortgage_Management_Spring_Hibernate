package www.retail.gahan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.SalesOrder;
import www.retail.gahan.daos.SalesReportDaoI;
@SuppressWarnings("rawtypes")
public class SalesReportServiceImpl implements SalesReportServiceI {
	
	@Autowired
	private SalesReportDaoI salesReportDaoI;

	public void setSalesReportDaoI(SalesReportDaoI salesReportDaoI) {
		this.salesReportDaoI = salesReportDaoI;
	}

	@Override
	public List<SalesOrder> getSalesOrderReport() {
		return salesReportDaoI.getSalesOrderReport();
	}

	@Override
	public List getSalesOrderInvoiceReport() {
		return  salesReportDaoI.getSalesOrderInvoiceReport();
	}

	@Override
	public List getSalesOrderReportList() {
		return salesReportDaoI.getSalesOrderReportList();
	}

	@Override
	public List getSalesOrderReportChart() {
		return salesReportDaoI.getSalesOrderReportChart();
	}

	@Override
	public List getReceivableReport() {
		return salesReportDaoI.getReceivableReport();
	}

}
