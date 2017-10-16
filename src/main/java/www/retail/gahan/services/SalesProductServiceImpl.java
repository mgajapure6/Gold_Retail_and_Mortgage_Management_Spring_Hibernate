package www.retail.gahan.services;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.daos.SalesProductDaoI;

public class SalesProductServiceImpl implements SalesProductServiceI {
	@Autowired
	private SalesProductDaoI salesProductDaoI;
	
	public void setSalesProductDaoI(SalesProductDaoI salesProductDaoI) {
		this.salesProductDaoI = salesProductDaoI;
	}

	@Override
	public Integer getSalesProductMaxId() {
		return salesProductDaoI.getSalesProductMaxId();
	}

}
