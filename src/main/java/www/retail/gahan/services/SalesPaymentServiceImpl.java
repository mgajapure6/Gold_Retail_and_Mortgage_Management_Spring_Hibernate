package www.retail.gahan.services;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.daos.SalesPaymentDaoI;

public class SalesPaymentServiceImpl implements SalesPaymentServiceI {
	@Autowired
	private SalesPaymentDaoI salesPaymentDaoI;
	
	public void setSalesPaymentDaoI(SalesPaymentDaoI salesPaymentDaoI) {
		this.salesPaymentDaoI = salesPaymentDaoI;
	}


	@Override
	public Integer getSalesPaymentMaxId() {
		return salesPaymentDaoI.getSalesPaymentMaxId();
	}

}
