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

package com.pcloud.modelresource.service;

import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.orm.transaction.TransactionManager;
import com.frameworkset.util.ListInfo;
import com.pcloud.modelresource.entity.ModelResource;
import com.pcloud.modelresource.entity.ModelResourceCondition;
import com.pcloud.modelresource.entity.ResourceComment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * <p>Title: ModelResourceServiceImpl</p> <p>Description: 模型资源业务处理类 </p>
 * <p>bjxbc</p> <p>Copyright (c) 2007</p> @Date 2018-07-26 12:17:13 @author
 * lijia @version v1.0
 */
public class ModelResourceServiceImpl implements ModelResourceService {

	private static Logger log = LoggerFactory
			.getLogger(com.pcloud.modelresource.service.ModelResourceServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addModelResource(ModelResource modelResource) throws ModelResourceException {
		// 业务组件
		try {
			executor.insertBean("addModelResource", modelResource);
		} catch (Throwable e) {
			throw new ModelResourceException("add ModelResource failed:", e);
		}

	}
	public void deleteModelResource(String id) throws ModelResourceException {
		try {
			executor.delete("deleteByKey", id);
		} catch (Throwable e) {
			throw new ModelResourceException("delete ModelResource failed::id=" + id, e);
		}

	}
	public void deleteBatchModelResource(String... ids) throws ModelResourceException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", ids);
			executor.deleteByKeys("deleteByParentId", ids);
			tm.commit();
		} catch (Throwable e) {

			throw new ModelResourceException("batch delete ModelResource failed::ids=" + ids, e);
		} finally {
			tm.release();
		}

	}
	public void updateModelResource(ModelResource modelResource) throws ModelResourceException {
		try {
			executor.updateBean("updateModelResource", modelResource);
		} catch (Throwable e) {
			throw new ModelResourceException("update ModelResource failed::", e);
		}

	}
	public ModelResource getModelResource(String id) throws ModelResourceException {
		try {
			ModelResource bean = executor.queryObject(ModelResource.class, "selectById", id);
			return bean;
		} catch (Throwable e) {
			throw new ModelResourceException("get ModelResource failed::id=" + id, e);
		}

	}
	public ListInfo queryListInfoModelResources(ModelResourceCondition conditions, long offset, int pagesize)
			throws ModelResourceException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(ModelResource.class, "queryListModelResource", offset, pagesize,
					conditions);
		} catch (Exception e) {
			throw new ModelResourceException("pagine query ModelResource failed:", e);
		}
		return datas;

	}


	public List<ModelResource> queryListModelResources(ModelResourceCondition conditions)
			throws ModelResourceException {
		try {
			List<ModelResource> beans = executor.queryListBean(ModelResource.class, "queryListModelResource",
					conditions);
			return beans;
		} catch (Exception e) {
			throw new ModelResourceException("query ModelResource failed:", e);
		}

	}

	@Override
	public List<ModelResource> getChildren(ModelResourceCondition conditions) throws ModelResourceException{
		try {
			List<ModelResource> beans = executor.queryListBean(ModelResource.class, "getChildren",
					conditions);
			return beans;
		} catch (Exception e) {
			throw new ModelResourceException("query ModelResource failed:", e);
		}

	}

	@Override
	public void deleteModelResourceFile(ModelResourceCondition conditions) throws ModelResourceException {
		try {
			executor.deleteBean("deleteModelResourceFile",conditions);
		} catch (Throwable e) {
			throw new ModelResourceException("delete ModelResource failed:", e);
		}
	}

	@Override
	public void updateBatchModelResource(String[] ids, String[] sourceNames, String[] descriptions, String[] timeLengths) throws ModelResourceException {
		try {

			for (int i=0;i<ids.length;i++) {
				ModelResource modelResource = new ModelResource();
				modelResource.setId(ids[i]);
				modelResource.setSourceName(sourceNames[i]);
				modelResource.setDescription(descriptions[i]);
				if(timeLengths != null && timeLengths.length > 0) {
					modelResource.setTimeLength(timeLengths[i]);
				}
				executor.updateBean("updateBatchModelResource", modelResource);
			}

		} catch (Throwable e) {
			throw new ModelResourceException("updateBatchModelResource ModelResource failed::", e);
		}
	}

	@Override
	public void updateNextModelResource(ModelResource modelResource) throws ModelResourceException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.updateBean("updateParentInfo",modelResource);
			executor.updateBean("updateChildInfo",modelResource);
			tm.commit();
		} catch (Throwable e) {

			throw new ModelResourceException("updateNextModelResource failed:", e);
		} finally {
			tm.release();
		}
	}

	@Override
	public ListInfo queryChildrenListInfoModelResources(ModelResourceCondition conditions, long offset, int pagesize) throws ModelResourceException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(ModelResource.class, "queryChildrenListInfoModelResources", offset, pagesize,
					conditions);
		} catch (Exception e) {
			throw new ModelResourceException("pagine query ModelResource failed:", e);
		}
		return datas;
	}

	@Override
	public void updateFrontModelResource(ModelResource modelResource) {
		try {
			executor.updateBean("updateFrontModelResource", modelResource);
		} catch (Throwable e) {
			throw new ModelResourceException("update ModelResource failed::", e);
		}
	}

	@Override
	public List<ResourceComment> getCommentList(String id) {
		try {
			ResourceComment bean = new ResourceComment();
			bean.setResourceId(id);
			List<ResourceComment> beans = executor.queryListBean(ResourceComment.class, "getCommentList", bean);
			return beans;
		} catch (Exception e) {
			throw new ModelResourceException("query ModelResource failed:", e);
		}
	}

	@Override
	public void addResourceComment(ResourceComment resourceComment) {
		// 业务组件
		try {
			executor.insertBean("addResourceComment", resourceComment);
		} catch (Throwable e) {
			throw new ModelResourceException("add ModelResource failed:", e);
		}
	}

	@Override
	public void downCount(String resourceId) {
		try {
			executor.update("downCount",resourceId);
		} catch (Throwable e) {
			throw new ModelResourceException("update ModelResource failed::", e);
		}

	}

	@Override
	public ResourceComment getCommentInfo(String id, String userName) {

		try {
			ResourceComment cond = new ResourceComment();
			cond.setResourceId(id);
			cond.setCommentUser(userName);
			ResourceComment bean = executor.queryObjectBean(ResourceComment.class, "getCommentInfo", cond);
			return bean;
		} catch (Throwable e) {
			throw new ModelResourceException("get ModelResource failed::id=" + id, e);
		}
	}
}