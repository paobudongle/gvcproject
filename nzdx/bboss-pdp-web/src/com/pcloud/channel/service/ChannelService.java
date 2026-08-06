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
import java.util.List;

/**
 * <p>Title: ChannelService</p> <p>Description: 栏目管理服务接口 </p> <p>bxckj</p>
 * <p>Copyright (c) 2015</p> @Date 2018-02-26 21:15:12 @author lijia @version
 * v1.0
 */
public interface ChannelService {
	public void addChannel(Channel channel) throws ChannelException;
	public void deleteChannel(String channelId) throws ChannelException;
	public void deleteBatchChannel(String... channelIds) throws ChannelException;
	public void updateChannel(Channel channel) throws ChannelException;
	public Channel getChannel(String channelId) throws ChannelException;
	public ListInfo queryListInfoChannels(ChannelCondition conditions, long offset, int pagesize)
			throws ChannelException;
	public List<Channel> queryListChannels(ChannelCondition conditions) throws ChannelException;

    List<Channel> getChildren(String pId);
}