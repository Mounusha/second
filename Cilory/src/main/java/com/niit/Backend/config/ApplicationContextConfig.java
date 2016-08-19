package com.niit.Backend.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.Backend.model.Category;
import com.niit.Backend.model.Product;
import com.niit.Backend.model.Supplier;
import com.niit.Backend.model.UserDetails;
import com.niit.Backend.dao.CartDAOImpl;
import com.niit.Backend.model.Cart;
import com.niit.Backend.dao.CategoryDAOImpl;
import com.niit.Backend.dao.ProductDAO;
import com.niit.Backend.dao.ProductDAOImpl;
import com.niit.Backend.dao.SupplierDAO;
import com.niit.Backend.dao.SupplierDAOImpl;
import com.niit.Backend.dao.UserDetailsDAO;
import com.niit.Backend.dao.UserDetailsDAOImpl;
import com.niit.Backend.dao.CategoryDAO;

@Configuration
@ComponentScan("com.niit")
@EnableTransactionManagement

public class ApplicationContextConfig {

	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:~/Shoping");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		System.out.println("Datasource");
		return dataSource;
	}
	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		System.out.println("Hibernate Properties");
		return properties;

	}
	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClasses(Category.class);
		sessionBuilder.addAnnotatedClasses(Supplier.class);
		sessionBuilder.addAnnotatedClasses(Product.class);
		sessionBuilder.addAnnotatedClasses(UserDetails.class);
		sessionBuilder.addAnnotatedClasses(Cart.class);

		System.out.println("Session");
		return sessionBuilder.buildSessionFactory();
		
	}
	
	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		System.out.println("Transaction");
		return transactionManager;
	}
	
	@Autowired
	@Bean(name = "categoryDAO")
	public CategoryDAO geCategorDao(SessionFactory sessionFactory) {
		return new CategoryDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "supplierDAO")
	public SupplierDAO geSupplisDao(SessionFactory sessionFactory) {
		return new SupplierDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "productDAO")
	public ProductDAO geProductDao(SessionFactory sessionFactory) {
		return new ProductDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "userDetailsDAO")
	public UserDetailsDAO geUserDao(SessionFactory sessionFactory) {
		return new UserDetailsDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "cartDAO")
	public CartDAOImpl getCartDAO(SessionFactory sessionFactory) {
			return new CartDAOImpl(sessionFactory);
	}

}



