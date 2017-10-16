package www.retail.gahan.daos;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.SalesProduct;

public class SalesProductDaoImpl implements SalesProductDaoI {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public Integer getSalesProductMaxId() {
		Integer i = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(SalesProduct.class).setProjection(Projections.max("salesProduct_id"));
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

}
