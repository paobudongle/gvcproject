/**
 *  Copyright 2008-2010 biaoping.yin
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package com.pcloud.serialnumber.service;

import com.common.DateUtils;
import com.common.StringUtils;
import com.frameworkset.util.StringUtil;
import com.pcloud.serialnumber.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.UUID;

import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: SerialNumberServiceImpl</p> <p>Description: 序列号业务处理类 </p> <p>xx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-02-23 09:05:22 @author lijia @version
 * v1.0
 */
public class SerialNumberServiceImpl implements SerialNumberService {

	private static Logger log = LoggerFactory.getLogger(SerialNumberServiceImpl.class);

	private ConfigSQLExecutor executor;

	public void addSerialNumber(SerialNumber serialNumber) throws SerialNumberException {
		// 业务组件
		try {
			serialNumber.setCreateTime(DateUtils.getLongDateStr());

			executor.insertBean("addSerialNumber", serialNumber);
		} catch (Throwable e) {
			throw new SerialNumberException("add SerialNumber failed:", e);
		}

	}
	public void deleteSerialNumber(String sn) throws SerialNumberException {
		try {
			executor.delete("deleteByKey", sn);
		} catch (Throwable e) {
			throw new SerialNumberException("delete SerialNumber failed::sn=" + sn, e);
		}

	}
	public void deleteBatchSerialNumber(String... sns) throws SerialNumberException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", sns);
			tm.commit();
		} catch (Throwable e) {

			throw new SerialNumberException("batch delete SerialNumber failed::sns=" + sns, e);
		} finally {
			tm.release();
		}

	}
	public void updateSerialNumber(SerialNumber serialNumber) throws SerialNumberException {
		try {
			executor.updateBean("updateSerialNumber", serialNumber);
		} catch (Throwable e) {
			throw new SerialNumberException("update SerialNumber failed::", e);
		}

	}
	public SerialNumber getSerialNumber(String sn) throws SerialNumberException {
		try {
			SerialNumber bean = executor.queryObject(SerialNumber.class, "selectById", sn);
			return bean;
		} catch (Throwable e) {
			throw new SerialNumberException("get SerialNumber failed::sn=" + sn, e);
		}

	}

	public SerialNumber getSerialNumberByOrderId(String orderId) throws SerialNumberException {
		try {
			SerialNumber bean = executor.queryObject(SerialNumber.class, "selectByOrderId", orderId);
			return bean;
		} catch (Throwable e) {
			throw new SerialNumberException("get SerialNumber failed::orderId=" + orderId, e);
		}

	}
	public ListInfo queryListInfoSerialNumbers(SerialNumberCondition conditions, long offset, int pagesize)
			throws SerialNumberException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(SerialNumber.class, "queryListSerialNumber", offset, pagesize,
					conditions);
		} catch (Exception e) {
			throw new SerialNumberException("pagine query SerialNumber failed:", e);
		}
		return datas;

	}
	public List<SerialNumber> queryListSerialNumbers(SerialNumberCondition conditions) throws SerialNumberException {
		try {
			List<SerialNumber> beans = executor.queryListBean(SerialNumber.class, "queryListSerialNumber", conditions);
			return beans;
		} catch (Exception e) {
			throw new SerialNumberException("query SerialNumber failed:", e);
		}

	}

	@Override
	public SerialNumber getSNByUserIdAndRole(String userId, String roleId) throws SerialNumberException {
		try {
			SerialNumberCondition conditions = new SerialNumberCondition();
			conditions.setRoleId(roleId);
			conditions.setUserId(userId);
			List<SerialNumber> beans = executor.queryListBean(SerialNumber.class,"getSNByUserIdAndRole",conditions);
			SerialNumber  b = null;
			if (beans.size() > 0) {
				b = beans.get(0);
			}
			return b;
		} catch (Throwable e) {
			throw new SerialNumberException("get getSNByUserIdAndRole failed:" , e);
		}
	}

	@Override
	public void setSerialNumberEnd(String sn) {
		try {
			executor.update("setSerialNumberEnd",sn);
		} catch (Throwable e) {
			throw new SerialNumberException("update SerialNumber failed::", e);
		}
	}
}