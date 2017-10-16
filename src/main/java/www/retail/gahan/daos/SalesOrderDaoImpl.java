package www.retail.gahan.daos;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.SalesOrder;

public class SalesOrderDaoImpl implements SalesOrderDaoI {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public Integer getSalesOrderMaxId() {
		Integer i = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(SalesOrder.class).setProjection(Projections.max("salesOrder_id"));
			i = (Integer)criteria.uniqueResult();
			transaction.commit();
			session.close();
			if (i==null) {
				return 0;
			} else {
				return i;
			}
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return i;
	}


	@Override
	public Integer getMaxSalesOrderNumber() {
		Integer i=0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(SalesOrder.class).setProjection(Projections.max("salesOrder_number"));
			i = (Integer)criteria.uniqueResult();
			transaction.commit();
			session.close();
			if (i==null) {
				return 0;
			} else {
				return i;
			}
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		session.close();
		return i;
	}


	@Override
	public List<SalesOrder> getAllSalesOrders() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<SalesOrder> salesOrderList = session.createQuery("From www.retail.gahan.beans.SalesOrder Order by salesOrder_number DESC").list();
		return salesOrderList;
	}


	@Override
	public SalesOrder getSalesOrderBySalesOrderNumber(Integer salesOrderNumber) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("From  www.retail.gahan.beans.SalesOrder where salesOrder_number = :salesOrderNumber");
			query.setParameter("salesOrderNumber", salesOrderNumber);
			SalesOrder salesOrder = (SalesOrder) query.uniqueResult();
			transaction.commit();
			return salesOrder;
	}


	@Override
	public Integer updateSalesOrder( Integer salesOrderNumber, Double newPaidAmount, Double newBalanceAmount) {
		Session session = sessionFactory.openSession();
		String hql = "update SalesOrder set salesOrder_paid_amount = :newPaidAmount, salesOrder_balance_amount = :newBalanceAmount  where salesOrder_number = :salesOrderNumber";
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter("salesOrderNumber", salesOrderNumber );
			query.setParameter("newPaidAmount", newPaidAmount );
			query.setParameter("newBalanceAmount", newBalanceAmount );
			int rowsAffected = query.executeUpdate();
			transaction.commit();
			session.close();
			if (rowsAffected > 0) {
				return 1;
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
			session.close();
			return 0;
		}
		return 0;
	}


	@Override
	public Integer mergeNewSalesPaymentToSalesOrder(SalesOrder salesOrder) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			SalesOrder SalesOrder1 = (SalesOrder) session.merge(salesOrder);
			transaction.commit();
			session.close();
			if(SalesOrder1 != null){
				return flag=1;
			}else{
				return flag=0;
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return flag;
	}


	@Override
	public Long getTotalSalesOrderCount() {
		Long count = (long) 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			count =  (long) ( (Number) session.createQuery("select count(*) from www.retail.gahan.beans.SalesOrder").iterate().next() ).longValue();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return count;
	}


	@SuppressWarnings("rawtypes")
	@Override
	public List monthlySalesOrderCountReport() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select date_format(str_to_date(`salesOrder_date`,'%b-%d-%Y'), '%b-%Y') as `monthYear`, count(*) as salesOrderCount from salesOrder group by date_format(str_to_date(`salesOrder_date`,'%b-%d-%Y'), '%m-%Y')";
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
