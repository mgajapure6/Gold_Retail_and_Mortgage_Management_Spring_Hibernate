/**
 * 
 */
package www.retail.gahan.daos;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.SalesOrder;

/**
 * @author mgg
 *
 */
@SuppressWarnings("rawtypes")
public class SalesReportDaoImpl implements SalesReportDaoI {

	/* (non-Javadoc)
	 * @see www.retail.customer.daos.SalesReportDaoI#getSalesOrderReport()
	 */
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<SalesOrder> getSalesOrderReport() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select date_format(str_to_date(`salesOrder_date`,'%h:%i %p %d-%m-%Y'), '%b-%Y'), sum(salesOrder_total_quantities) "
				+"sum(salesOrder_total_price_before_discount)"+ "from salesorder group by date_format(str_to_date(`salesOrder_date`,'%h:%i %p %d-%m-%Y'), '%m/%Y'))";
		try {
			Criteria criteria = session.createCriteria(SalesOrder.class);
			criteria.add(Restrictions.sqlRestriction(mySqlFunctionQuery));
			@SuppressWarnings("unchecked")
			List<SalesOrder> list=criteria.list();
			transaction.commit();
			session.close();
			if (list!=null) {
				return list;
			}
			
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return new ArrayList<>();
	}
	
	public List getSalesOrderReportList() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select date_format(str_to_date(`salesOrder_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y') as `monthYear`, sum(salesOrder_total_quantities) as `totalSoldQuntities`, sum(salesOrder_paid_amount) as `totalPaidAmount`, sum(salesOrder_balance_amount) as `totalBalanceAmount`, sum(salesOrder_total_price_after_discount) as `totalAmount`, count(*) as `totalOrders` from salesorder group by date_format(str_to_date(`salesOrder_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y')";
		try {
			SQLQuery sqlQuery = session.createSQLQuery(mySqlFunctionQuery);
			sqlQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List list=sqlQuery.list();
			transaction.commit();
			session.close();
			if (list!=null) {
				return list;
			}
			
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return new ArrayList();
	}

	@Override
	public List getSalesOrderInvoiceReport() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select salesOrder_date as `invoiceDate`, salesOrder_number as `invoiceNo`,  salesOrder_discount as `invoiceDiscount`,salesOrder_total_price_after_discount as `invoiceAmount`,salesOrder_paid_amount as `invoicePaid`, salesOrder_balance_amount as `invoiceBalance`,salesOrder_total_products as `invoiceProducts` from salesorder group by salesOrder_number DESC";
		try {
			SQLQuery sqlQuery = session.createSQLQuery(mySqlFunctionQuery);
			sqlQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List invoiceList=sqlQuery.list();
			transaction.commit();
			session.close();
			if (invoiceList!=null) {
				return invoiceList;
			}
			
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return new ArrayList();
	}
	
	
	@Override
	public List getSalesOrderReportChart() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = " select date_format(str_to_date(`salesOrder_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y') as `month/year`, sum(salesOrder_total_quantities) as `totalQuantities`, sum(salesOrder_total_price_after_discount) as `totalCostPrice` from salesorder group by date_format(str_to_date(`salesOrder_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y')";
		try {
			SQLQuery sqlQuery = session.createSQLQuery(mySqlFunctionQuery);
			sqlQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List list=sqlQuery.list();
			transaction.commit();
			session.close();
			if (list!=null) {
				return list;
			}
			
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return new ArrayList();
	}
	
	@Override
	public List getReceivableReport() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select date_format(str_to_date(`salesOrder_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y') as `monthYear`, sum(salesOrder_balance_amount) as receivableAmount from salesorder group by date_format(str_to_date(`salesOrder_date`,'%h:%i %p %b-%d-%Y'), '%m-%Y')";
		try {
			SQLQuery sqlQuery = session.createSQLQuery(mySqlFunctionQuery);
			sqlQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List recevableList=sqlQuery.list();
			transaction.commit();
			session.close();
			if (recevableList!=null) {
				return recevableList;
			}
			
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return new ArrayList();
	}

}
