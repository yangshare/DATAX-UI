package com.github.esadmin.meta.service.impl;

import java.util.Date;
import java.util.List;

import com.github.esadmin.meta.dao.DBTableDao;
import com.github.esadmin.meta.model.DBTable;
import com.github.esadmin.meta.service.DBTableService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: DBTable
* @Description: DBTableserviceImpl
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class DBTableServiceImpl extends BaseServiceImpl<DBTable, Long> implements DBTableService {
	
	@Autowired
	private DBTableDao dbTableDao; 
	
	@Override
	public void save(DBTable dbtable) throws Exception {
		if(dbtable.getId() != null){
			
			DBTable table = dbTableDao.get(dbtable.getId());
			
			//保留发表者以及发表提起
			dbtable.setCreatebyId(table.getCreatebyId());
			dbtable.setCreateDate(table.getCreateDate());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			dbtable.setUpdatebyId(cuser.getId());
			dbtable.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			dbtable.setCreatebyId(cuser.getId());
			dbtable.setCreateDate(new Date());
			dbtable.setUpdatebyId(cuser.getId());
			dbtable.setUpdateDate(new Date());
		}
		super.save(dbtable);
	}

	@Override
	public List<DBTable> getTables(Long id) {
		// TODO Auto-generated method stub
		return null;
	}
}
