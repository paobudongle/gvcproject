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

package com.pcloud.content.service;

import com.common.DateUtils;
import com.pcloud.content.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: ContentServiceImpl</p> <p>Description: 内容表业务处理类 </p> <p>xxx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-04 17:27:23 @author lijia @version
 * v1.0
 */
public class ContentServiceImpl implements ContentService {

	private static Logger log = LoggerFactory.getLogger(ContentServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addContent(Content content) throws ContentException {
		// 业务组件
		try {
			executor.insertBean("addContent", content);
		} catch (Throwable e) {
			throw new ContentException("add Content failed:", e);
		}

	}
	public void deleteContent(String contentId) throws ContentException {
		try {
			executor.delete("deleteByKey", contentId);
		} catch (Throwable e) {
			throw new ContentException("delete Content failed::contentId=" + contentId, e);
		}

	}
	public void deleteBatchContent(String... contentIds) throws ContentException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", contentIds);
			tm.commit();
		} catch (Throwable e) {

			throw new ContentException("batch delete Content failed::contentIds=" + contentIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateContent(Content content) throws ContentException {
		try {
			executor.updateBean("updateContent", content);
		} catch (Throwable e) {
			throw new ContentException("update Content failed::", e);
		}

	}
	public Content getContent(String contentId) throws ContentException {
		try {
			Content bean = executor.queryObject(Content.class, "selectById", contentId);
			return bean;
		} catch (Throwable e) {
			throw new ContentException("get Content failed::contentId=" + contentId, e);
		}

	}
	public ListInfo queryListInfoContents(ContentCondition conditions, long offset, int pagesize)
			throws ContentException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(Content.class, "queryListContent", offset, pagesize, conditions);
		} catch (Exception e) {
			throw new ContentException("pagine query Content failed:", e);
		}
		return datas;

	}
	public List<Content> queryListContents(ContentCondition conditions) throws ContentException {
		try {
			List<Content> beans = executor.queryListBean(Content.class, "queryListContent", conditions);
			return beans;
		} catch (Exception e) {
			throw new ContentException("query Content failed:", e);
		}

	}

	@Override
	public void sendContent(String contentId) {
		try {
			executor.update("sendContent",contentId);
		} catch (Throwable e) {
			throw new ContentException("sentContent::", e);
		}
	}

	@Override
	public ListInfo queryListInfoReprintContents(ContentCondition conditions, long offset, int pagesize) {

		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(ReprintContent.class, "queryListInfoReprintContents", offset, pagesize, conditions);
		} catch (Exception e) {
			throw new ContentException("pagine query Content failed:", e);
		}
		return datas;
	}


	public ReprintContent getPrintContent(String crawlId) throws ContentException {
		try {
			ReprintContent bean = executor.queryObject(ReprintContent.class, "getPrintContent", crawlId);
			return bean;
		} catch (Throwable e) {
			throw new ContentException("get getPrintContent failed::contentId=" + crawlId, e);
		}

	}

	@Override
	public void rePrintBatchContent(String channelId, String[] crawlIds) {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			for (int i =0;i<crawlIds.length;i++) {
				String id = crawlIds[i];
				ReprintContent rc = getPrintContent(id);
				Content content = new Content();
				content.setChannelId(channelId);
				content.setTitle(rc.getCrawlTitle());
				content.setCmsContent(rc.getCrawlcontent());
				content.setCrawlId(id);
				content.setContentStatus("1");
				content.setReleaseDate(DateUtils.formatDate(rc.getCrawlTime(),"yyyy-MM-dd"));
				addContent(content);
			}


			tm.commit();
		} catch (Throwable e) {

			throw new ContentException("batch rePrintBatchContent failed::contentIds=" + channelId, e);
		} finally {
			tm.release();
		}
	}

	@Override
	public void deleteBatchReprintContent(String... crawlIds) {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteBatchReprintContent", crawlIds);
			tm.commit();
		} catch (Throwable e) {

			throw new ContentException("batch delete Content failed::contentIds=" + crawlIds, e);
		} finally {
			tm.release();
		}
	}

	@Override
	public List<Content> queryListInfoHotNewsByTopTen() {
		try {
			List<Content> beans = executor.queryListBean(Content.class, "queryListInfoHotNewsByTopTen", null);
			return beans;
		} catch (Exception e) {
			throw new ContentException("query Content failed:", e);
		}
	}
}