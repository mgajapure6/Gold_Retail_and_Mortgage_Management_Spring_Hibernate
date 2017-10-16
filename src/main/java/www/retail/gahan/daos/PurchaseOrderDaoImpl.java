package www.retail.gahan.daos;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.PurchaseOrder;

public class PurchaseOrderDaoImpl implements PurchaseOrderDaoI {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public Integer getPurchaseOrderMaxId() {
		Integer i = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(PurchaseOrder.class).setProjection(Projections.max("purchaseOrder_id"));
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
	public Integer getMaxPurchseOrderNumber() {
		Integer i=0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(PurchaseOrder.class).setProjection(Projections.max("purchaseOrder_number"));
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
	public List<PurchaseOrder> getAllPurchaseOrders() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<PurchaseOrder> purchaseOrderList = session.createQuery("From www.retail.gahan.beans.PurchaseOrder Order by purchaseOrder_number DESC").list();
		return purchaseOrderList;
	}


	@Override
	public PurchaseOrder getPurchaseOrderByPurchaseOrderNumber(Integer purchaseOrderNumber) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("From  www.retail.gahan.beans.PurchaseOrder where purchaseOrder_number = :purchaseOrderNumber");
			query.setParameter("purchaseOrderNumber", purchaseOrderNumber);
			PurchaseOrder purchaseOrder = (PurchaseOrder) query.uniqueResult();
			transaction.commit();
			return purchaseOrder;
	}


	@Override
	public Integer updatePurchaseOrder( Integer purchaseOrderNumber, Double newPaidAmount, Double newBalanceAmount) {
		Session session = sessionFactory.openSession();
		String hql = "update PurchaseOrder set purchaseOrder_paid_amount = :newPaidAmount, purchaseOrder_balance_amount = :newBalanceAmount  where purchaseOrder_number = :purchaseOrderNumber";
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter("purchaseOrderNumber", purchaseOrderNumber );
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
	public Integer mergeNewPurchasePaymentToPurchaseOrder(PurchaseOrder purchaseOrder) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			PurchaseOrder purchaseOrder1 = (PurchaseOrder) session.merge(purchaseOrder);
			transaction.commit();
			session.close();
			if(purchaseOrder1 != null){
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
	public Long getTotalPurchaseOrdersCount() {
		Long count = (long) 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			count =  (long) ( (Number) session.createQuery("select count(*) from www.retail.gahan.beans.PurchaseOrder").iterate().next() ).longValue();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return count;
	}

}
