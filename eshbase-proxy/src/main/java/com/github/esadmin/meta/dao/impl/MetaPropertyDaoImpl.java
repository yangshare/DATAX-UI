package com.github.esadmin.meta.dao.impl;

import java.util.List;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.github.esadmin.meta.dao.MetaPropertyDao;
import com.github.esadmin.meta.model.DataSource;
import com.github.esadmin.meta.model.MetaProperty;

/**
* 
* @ClassName: MetaProperty
* @Description: MetaPropertydaoImpl
* @author Joe.zhang
* @date  2016-5-18 14:20:22
*
*/
@Repository
public class MetaPropertyDaoImpl extends HibernateDao<MetaProperty,Long> implements MetaPropertyDao {

	@Override
	public List<MetaProperty> getProperties(int refType, long refId) {
		return this.find("from MetaProperty where refType=? and refId=? order by group,sortId ", refType,refId);
	}
	
	@Override
	public void save(MetaProperty datasource) {
		Session session = getSession();
		session.merge(datasource);
		session.flush();
	}

}
