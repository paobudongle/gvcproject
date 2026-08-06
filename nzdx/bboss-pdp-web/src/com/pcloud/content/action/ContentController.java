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

package com.pcloud.content.action;

import com.pcloud.channel.entity.Channel;
import com.pcloud.channel.entity.ChannelCondition;
import com.pcloud.channel.service.ChannelService;
import com.pcloud.content.entity.*;
import com.frameworkset.util.ListInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;
import com.frameworkset.util.StringUtil;
import com.pcloud.content.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.MapKey;

/**
 * <p>Title: ContentController</p> <p>Description: 内容表控制器处理类 </p> <p>xxx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-04 17:27:23 @author lijia @version
 * v1.0
 */
public class ContentController {

	private static Logger log = LoggerFactory.getLogger(ContentController.class);

	private ContentService contentService;

	private ChannelService channelService;

	public @ResponseBody String addContent(Content content) {
		// 控制器
		try {
			String indexImg = content.getIndexImg();
			if(StringUtil.isEmpty(indexImg)) {
				content.setIndexImg("../images/wt.png");
			}
			contentService.addContent(content);
			return "success";
		} catch (ContentException e) {
			log.error("add Content failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add Content failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteContent(String contentId) {
		try {
			contentService.deleteContent(contentId);
			return "success";
		} catch (ContentException e) {
			log.error("delete Content failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete Content failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchContent(String... contentIds) {
		try {
			contentService.deleteBatchContent(contentIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch contentIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateContent(Content content) {
		try {
			contentService.updateContent(content);
			return "success";
		} catch (Throwable e) {
			log.error("update Content failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getContent(String contentId, ModelMap model) throws ContentException {
		try {
			Content content = contentService.getContent(contentId);
			model.addAttribute("content", content);
			return "path:getContent";
		} catch (ContentException e) {
			throw e;
		} catch (Throwable e) {
			throw new ContentException("get Content failed::contentId=" + contentId, e);
		}

	}
	public String queryListInfoContents(ContentCondition conditions, @PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws ContentException {
		// Constant.component_type_actionimpl
		try {
			String cmsContent = conditions.getCmsContent();
			if (cmsContent != null && !cmsContent.equals("")) {
				conditions.setCmsContent("%" + cmsContent + "%");
			}
			String title = conditions.getTitle();
			if (title != null && !title.equals("")) {
				conditions.setTitle("%" + title + "%");
			}

			ListInfo contents = contentService.queryListInfoContents(conditions, offset, pagesize);
			model.addAttribute("contents", contents);
			return "path:queryListInfoContents";
		} catch (ContentException e) {
			throw e;
		} catch (Exception e) {
			throw new ContentException("pagine query Content failed:", e);
		}

	}
	public String queryListContents(ContentCondition conditions, ModelMap model) throws ContentException {
		try {
			String cmsContent = conditions.getCmsContent();
			if (cmsContent != null && !cmsContent.equals("")) {
				conditions.setCmsContent("%" + cmsContent + "%");
			}
			String title = conditions.getTitle();
			if (title != null && !title.equals("")) {
				conditions.setTitle("%" + title + "%");
			}
			List<Content> contents = contentService.queryListContents(conditions);
			model.addAttribute("contents", contents);
			return "path:queryListContents";
		} catch (ContentException e) {
			throw e;
		} catch (Exception e) {
			throw new ContentException("query Content failed:", e);
		}

	}

	public String queryListInfoReprintContents(ContentCondition conditions,@PagerParam(name = PagerParam.OFFSET) long offset,
											   @PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize,ModelMap model) throws ContentException {
		try {

			ListInfo reprint = contentService.queryListInfoReprintContents(conditions, offset, pagesize);
            model.addAttribute("reprint", reprint);
			String type = conditions.getCrawlId();
			String url = "";
			if("0".equals(type)) {

				url = "path:reprintListInfo0";
			}else {

				url = "path:reprintListInfo1";
			}

			return url;
		} catch (ContentException e) {
			throw e;
		} catch (Exception e) {
			throw new ContentException("query Content failed:", e);
		}

	}
	public String toUpdateContent(String contentId, ModelMap model) throws ContentException {
		try {
			Content content = contentService.getContent(contentId);
			List<Channel> channels = channelService.queryListChannels(new ChannelCondition());
			model.addAttribute("channels", channels);
			model.addAttribute("content", content);
			return "path:updateContent";
		} catch (ContentException e) {
			throw e;
		} catch (Throwable e) {
			throw new ContentException("get Content failed::contentId=" + contentId, e);
		}

	}


    public @ResponseBody String sendContent(String contentId) {
        try {
            contentService.sendContent(contentId);
            return "success";
        } catch (Throwable e) {
            log.error("update Content failed:", e);
            return StringUtil.formatBRException(e);
        }

    }
	public String toAddContent(ModelMap model) {
		List<Channel> channels = channelService.queryListChannels(new ChannelCondition());
		model.addAttribute("channels", channels);
		return "path:addContent";
	}
	public String index() {
		return "path:index";

	}

	public String toMainReprint(String crawlId,ModelMap model) {
		List<Channel> channels = channelService.queryListChannels(new ChannelCondition());
		model.addAttribute("channels", channels);
		return "path:toMainReprint";
	}

	public @ResponseBody String rePrintBatchContent(String channelId,String... crawlIds) {
		try {
			contentService.rePrintBatchContent(channelId,crawlIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch contentIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}

	public @ResponseBody String deleteBatchReprintContent(String... crawlIds) {
		try {
			contentService.deleteBatchReprintContent(crawlIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch contentIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}


/*	public String toHostNews(ContentCondition conditions,ModelMap model) {

		String channelId = conditions.getChannelId();
		if(StringUtil.isEmpty(channelId)) {  //默认热点新闻
			conditions.setChannelId("1");
		}
		List<Channel> channels = channelService.queryListChannels(new ChannelCondition());
		ListInfo hostNewsList = contentService.queryListInfoContents(conditions, 0, 12);
		model.addAttribute("channels", channels);
		model.addAttribute("hostNewsList", hostNewsList);
		model.addAttribute("conditions", conditions);
		model.addAttribute("currentPage", 1);
		model.addAttribute("totalPage", hostNewsList.getTotalPages());
		return "path:toHostNews";
	}

	@ResponseBody
	public ListInfo queryListInfoHostNews(ContentCondition conditions, long offset, int pagesize) {
		ListInfo hostNewsList = contentService.queryListInfoContents(conditions, offset, pagesize);
		return hostNewsList;
	}

	public String toNews(ContentCondition conditions,ModelMap model) {
		List<Channel> channels = channelService.queryListChannels(new ChannelCondition());
		model.addAttribute("channels", channels);
		Content content = contentService.getContent(conditions.getContentId());
		model.addAttribute("content", content);
		model.addAttribute("conditions", conditions);
		return "path:toNews";
	}*/
}