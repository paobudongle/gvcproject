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
import java.util.List;

/**
 * <p>Title: ContentTypeService</p> <p>Description: 内容分类服务接口 </p> <p>xxx</p>
 * <p>Copyright (c) 2015</p> @Date 2018-03-04 17:50:51 @author lijia @version
 * v1.0
 */
public interface ContentTypeService {
	public void addContentType(ContentType contentType) throws ContentTypeException;
	public void deleteContentType(String contentTypeId) throws ContentTypeException;
	public void deleteBatchContentType(String... contentTypeIds) throws ContentTypeException;
	public void updateContentType(ContentType contentType) throws ContentTypeException;
	public ContentType getContentType(String contentTypeId) throws ContentTypeException;
	public ListInfo queryListInfoContentTypes(ContentTypeCondition conditions, long offset, int pagesize)
			throws ContentTypeException;
	public List<ContentType> queryListContentTypes(ContentTypeCondition conditions) throws ContentTypeException;
}