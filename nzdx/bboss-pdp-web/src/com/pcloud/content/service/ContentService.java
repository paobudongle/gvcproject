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

import com.pcloud.content.entity.*;
import com.frameworkset.util.ListInfo;
import java.util.List;

/**
 * <p>Title: ContentService</p> <p>Description: 内容表服务接口 </p> <p>xxx</p>
 * <p>Copyright (c) 2015</p> @Date 2018-03-04 17:27:23 @author lijia @version
 * v1.0
 */
public interface ContentService {
	public void addContent(Content content) throws ContentException;
	public void deleteContent(String contentId) throws ContentException;
	public void deleteBatchContent(String... contentIds) throws ContentException;
	public void updateContent(Content content) throws ContentException;
	public Content getContent(String contentId) throws ContentException;
	public ListInfo queryListInfoContents(ContentCondition conditions, long offset, int pagesize)
			throws ContentException;
	public List<Content> queryListContents(ContentCondition conditions) throws ContentException;

    void sendContent(String contentId);

	ListInfo queryListInfoReprintContents(ContentCondition conditions, long offset, int pagesize);

    void rePrintBatchContent(String channelId, String[] crawlIds);

	void deleteBatchReprintContent(String[] crawlIds);

	List<Content> queryListInfoHotNewsByTopTen();
}