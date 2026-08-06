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

package com.pcloud.contenttype.action;

import com.pcloud.contenttype.entity.*;
import com.frameworkset.util.ListInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;
import com.frameworkset.util.StringUtil;
import com.pcloud.contenttype.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.MapKey;

/**
 * <p>Title: ContentTypeController</p> <p>Description: 内容分类控制器处理类 </p>
 * <p>xxx</p> <p>Copyright (c) 2007</p> @Date 2018-03-04 17:50:51 @author
 * lijia @version v1.0
 */
public class ContentTypeController {

	private static Logger log = LoggerFactory.getLogger(ContentTypeController.class);

	private ContentTypeService contentTypeService;
	public @ResponseBody String addContentType(ContentType contentType) {
		// 控制器
		try {
			contentTypeService.addContentType(contentType);
			return "success";
		} catch (ContentTypeException e) {
			log.error("add ContentType failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add ContentType failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteContentType(String contentTypeId) {
		try {
			contentTypeService.deleteContentType(contentTypeId);
			return "success";
		} catch (ContentTypeException e) {
			log.error("delete ContentType failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete ContentType failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchContentType(String... contentTypeIds) {
		try {
			contentTypeService.deleteBatchContentType(contentTypeIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch contentTypeIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateContentType(ContentType contentType) {
		try {
			contentTypeService.updateContentType(contentType);
			return "success";
		} catch (Throwable e) {
			log.error("update ContentType failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getContentType(String contentTypeId, ModelMap model) throws ContentTypeException {
		try {
			ContentType contentType = contentTypeService.getContentType(contentTypeId);
			model.addAttribute("contentType", contentType);
			return "path:getContentType";
		} catch (ContentTypeException e) {
			throw e;
		} catch (Throwable e) {
			throw new ContentTypeException("get ContentType failed::contentTypeId=" + contentTypeId, e);
		}

	}
	public String queryListInfoContentTypes(ContentTypeCondition conditions,
			@PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws ContentTypeException {
		// Constant.component_type_actionimpl
		try {
			String contentTypeName = conditions.getContentTypeName();
			if (contentTypeName != null && !contentTypeName.equals("")) {
				conditions.setContentTypeName("%" + contentTypeName + "%");
			}

			ListInfo contentTypes = contentTypeService.queryListInfoContentTypes(conditions, offset, pagesize);
			model.addAttribute("contentTypes", contentTypes);
			return "path:queryListInfoContentTypes";
		} catch (ContentTypeException e) {
			throw e;
		} catch (Exception e) {
			throw new ContentTypeException("pagine query ContentType failed:", e);
		}

	}
	public String queryListContentTypes(ContentTypeCondition conditions, ModelMap model) throws ContentTypeException {
		try {
			String contentTypeName = conditions.getContentTypeName();
			if (contentTypeName != null && !contentTypeName.equals("")) {
				conditions.setContentTypeName("%" + contentTypeName + "%");
			}
			List<ContentType> contentTypes = contentTypeService.queryListContentTypes(conditions);
			model.addAttribute("contentTypes", contentTypes);
			return "path:queryListContentTypes";
		} catch (ContentTypeException e) {
			throw e;
		} catch (Exception e) {
			throw new ContentTypeException("query ContentType failed:", e);
		}

	}
	public String toUpdateContentType(String contentTypeId, ModelMap model) throws ContentTypeException {
		try {
			ContentType contentType = contentTypeService.getContentType(contentTypeId);
			model.addAttribute("contentType", contentType);
			return "path:updateContentType";
		} catch (ContentTypeException e) {
			throw e;
		} catch (Throwable e) {
			throw new ContentTypeException("get ContentType failed::contentTypeId=" + contentTypeId, e);
		}

	}
	public String toAddContentType() {
		return "path:addContentType";
	}
	public String index() {
		return "path:index";

	}
}