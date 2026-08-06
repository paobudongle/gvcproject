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

package com.pcloud.advertise.service;

import com.pcloud.advertise.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: AdvertiseServiceImpl</p> <p>Description: 招聘业务处理类 </p> <p>bc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-19 12:05:28 @author lijia @version
 * v1.0
 */
public class AdvertiseServiceImpl implements AdvertiseService {

	private static Logger log = LoggerFactory.getLogger(AdvertiseServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addAdvertise(Advertise advertise) throws AdvertiseException {
		// 业务组件
		try {
			executor.insertBean("addAdvertise", advertise);
		} catch (Throwable e) {
			throw new AdvertiseException("add Advertise failed:", e);
		}

	}
	public void deleteAdvertise(String advertiseId) throws AdvertiseException {
		try {
			executor.delete("deleteByKey", advertiseId);
		} catch (Throwable e) {
			throw new AdvertiseException("delete Advertise failed::advertiseId=" + advertiseId, e);
		}

	}
	public void deleteBatchAdvertise(String... advertiseIds) throws AdvertiseException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", advertiseIds);
			tm.commit();
		} catch (Throwable e) {

			throw new AdvertiseException("batch delete Advertise failed::advertiseIds=" + advertiseIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateAdvertise(Advertise advertise) throws AdvertiseException {
		try {
			executor.updateBean("updateAdvertise", advertise);
		} catch (Throwable e) {
			throw new AdvertiseException("update Advertise failed::", e);
		}

	}
	public Advertise getAdvertise(String advertiseId) throws AdvertiseException {
		try {
			Advertise bean = executor.queryObject(Advertise.class, "selectById", advertiseId);
			return bean;
		} catch (Throwable e) {
			throw new AdvertiseException("get Advertise failed::advertiseId=" + advertiseId, e);
		}

	}
	public ListInfo queryListInfoAdvertises(AdvertiseCondition conditions, long offset, int pagesize)
			throws AdvertiseException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(Advertise.class, "queryListAdvertise", offset, pagesize, conditions);
		} catch (Exception e) {
			throw new AdvertiseException("pagine query Advertise failed:", e);
		}
		return datas;

	}
	public List<Advertise> queryListAdvertises(AdvertiseCondition conditions) throws AdvertiseException {
		try {
			List<Advertise> beans = executor.queryListBean(Advertise.class, "queryListAdvertise", conditions);
			return beans;
		} catch (Exception e) {
			throw new AdvertiseException("query Advertise failed:", e);
		}

	}

	@Override
	public List<Advertise> queryListInfoAdvertiseByTopTen() {
		try {
			List<Advertise> beans = executor.queryListBean(Advertise.class, "queryListInfoAdvertiseByTopTen", null);
			return beans;
		} catch (Exception e) {
			throw new AdvertiseException("query Advertise failed:", e);
		}
	}
}