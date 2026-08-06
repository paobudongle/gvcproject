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

package com.pcloud.contenttype.service;

import com.pcloud.contenttype.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: ContentTypeServiceImpl</p> <p>Description: 内容分类业务处理类 </p>
 * <p>xxx</p> <p>Copyright (c) 2007</p> @Date 2018-03-04 17:50:51 @author
 * lijia @version v1.0
 */
public class ContentTypeServiceImpl implements ContentTypeService {

	private static Logger log = LoggerFactory.getLogger(ContentTypeServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addContentType(ContentType contentType) throws ContentTypeException {
		// 业务组件
		try {
			executor.insertBean("addContentType", contentType);
		} catch (Throwable e) {
			throw new ContentTypeException("add ContentType failed:", e);
		}

	}
	public void deleteContentType(String contentTypeId) throws ContentTypeException {
		try {
			executor.delete("deleteByKey", contentTypeId);
		} catch (Throwable e) {
			throw new ContentTypeException("delete ContentType failed::contentTypeId=" + contentTypeId, e);
		}

	}
	public void deleteBatchContentType(String... contentTypeIds) throws ContentTypeException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", contentTypeIds);
			tm.commit();
		} catch (Throwable e) {

			throw new ContentTypeException("batch delete ContentType failed::contentTypeIds=" + contentTypeIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateContentType(ContentType contentType) throws ContentTypeException {
		try {
			executor.updateBean("updateContentType", contentType);
		} catch (Throwable e) {
			throw new ContentTypeException("update ContentType failed::", e);
		}

	}
	public ContentType getContentType(String contentTypeId) throws ContentTypeException {
		try {
			ContentType bean = executor.queryObject(ContentType.class, "selectById", contentTypeId);
			return bean;
		} catch (Throwable e) {
			throw new ContentTypeException("get ContentType failed::contentTypeId=" + contentTypeId, e);
		}

	}
	public ListInfo queryListInfoContentTypes(ContentTypeCondition conditions, long offset, int pagesize)
			throws ContentTypeException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(ContentType.class, "queryListContentType", offset, pagesize, conditions);
		} catch (Exception e) {
			throw new ContentTypeException("pagine query ContentType failed:", e);
		}
		return datas;

	}
	public List<ContentType> queryListContentTypes(ContentTypeCondition conditions) throws ContentTypeException {
		try {
			List<ContentType> beans = executor.queryListBean(ContentType.class, "queryListContentType", conditions);
			return beans;
		} catch (Exception e) {
			throw new ContentTypeException("query ContentType failed:", e);
		}

	}
}