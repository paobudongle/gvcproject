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

package com.pcloud.channel.service;

import com.pcloud.channel.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: ChannelServiceImpl</p> <p>Description: 栏目管理业务处理类 </p> <p>bxckj</p>
 * <p>Copyright (c) 2007</p> @Date 2018-02-26 21:15:12 @author lijia @version
 * v1.0
 */
public class ChannelServiceImpl implements ChannelService {

	private static Logger log = LoggerFactory.getLogger(ChannelServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addChannel(Channel channel) throws ChannelException {
		// 业务组件
		try {
			executor.insertBean("addChannel", channel);
		} catch (Throwable e) {
			throw new ChannelException("add Channel failed:", e);
		}

	}
	public void deleteChannel(String channelId) throws ChannelException {
		try {
			executor.delete("deleteByKey", channelId);
		} catch (Throwable e) {
			throw new ChannelException("delete Channel failed::channelId=" + channelId, e);
		}

	}
	public void deleteBatchChannel(String... channelIds) throws ChannelException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", channelIds);
			tm.commit();
		} catch (Throwable e) {

			throw new ChannelException("batch delete Channel failed::channelIds=" + channelIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateChannel(Channel channel) throws ChannelException {
		try {
			executor.updateBean("updateChannel", channel);
		} catch (Throwable e) {
			throw new ChannelException("update Channel failed::", e);
		}

	}
	public Channel getChannel(String channelId) throws ChannelException {
		try {
			Channel bean = executor.queryObject(Channel.class, "selectById", channelId);
			return bean;
		} catch (Throwable e) {
			throw new ChannelException("get Channel failed::channelId=" + channelId, e);
		}

	}
	public ListInfo queryListInfoChannels(ChannelCondition conditions, long offset, int pagesize)
			throws ChannelException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(Channel.class, "queryListChannel", offset, pagesize, conditions);
		} catch (Exception e) {
			throw new ChannelException("pagine query Channel failed:", e);
		}
		return datas;

	}
	public List<Channel> queryListChannels(ChannelCondition conditions) throws ChannelException {
		try {
			List<Channel> beans = executor.queryListBean(Channel.class, "queryListChannel", conditions);
			return beans;
		} catch (Exception e) {
			throw new ChannelException("query Channel failed:", e);
		}

	}

	@Override
	public List<Channel> getChildren(String pId) {
		try {
			List<Channel> beans = executor.queryList(Channel.class, "getChildren",pId);
			return beans;
		} catch (Exception e) {
			throw new ChannelException("query getChildren failed:", e);
		}
	}
}