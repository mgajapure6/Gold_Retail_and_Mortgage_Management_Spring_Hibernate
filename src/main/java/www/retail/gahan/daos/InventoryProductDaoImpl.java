package www.retail.gahan.daos;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.InventoryProduct;
import www.retail.gahan.utility.DateFormate;

public class InventoryProductDaoImpl implements InventoryProductDaoI {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public List<InventoryProduct> getAllInventoryProducts() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<InventoryProduct> i_plist = session.createQuery("From www.retail.gahan.beans.InventoryProduct").list();
		session.close();
		return i_plist;
	}

	@Override
	public InventoryProduct getInventoryProductByName(String productName) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery("From  www.retail.gahan.beans.InventoryProduct where inventoryProduct_name = :productName");
			query.setParameter("productName", productName);
			InventoryProduct inventoryProduct = (InventoryProduct) query.uniqueResult();
			transaction.commit();
			session.close();
			if (inventoryProduct != null) {
				return inventoryProduct;
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
			session.close();
		}
		return new InventoryProduct();
	}

	@Override
	public Integer updateInventoryProduct(Integer inventoryProduct_id, Integer inventoryProduct_quantity,
			Double inventoryProduct_cost_price, Double inventoryProduct_selling_price) {
		String date = DateFormate.dateTimeToString(new Date());
		Session session = sessionFactory.openSession();
		String hql = "update InventoryProduct set inventoryProduct_quantity = :quantity, inventoryProduct_cost_price = :costPrice, inventoryProduct_selling_price = :sellingPrice, inventoryProduct_last_modified_date = :date where inventoryProduct_id = :ipid";
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter("ipid",inventoryProduct_id );
			query.setParameter("quantity",inventoryProduct_quantity );
			query.setParameter("costPrice",inventoryProduct_cost_price );
			query.setParameter("sellingPrice",inventoryProduct_selling_price );
			query.setParameter("date",date );
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
	public Integer saveInventoryProduct(InventoryProduct inventoryProduct) {
		Integer flag = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(inventoryProduct);
			transaction.commit();
			session.close();
			return flag=1;
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
			session.close();
		}
		session.close();
		return flag;
	}


	@Override
	public Integer getInventoryProductMaxId() {
		Integer i = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(InventoryProduct.class).setProjection(Projections.max("inventoryProduct_id"));
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
