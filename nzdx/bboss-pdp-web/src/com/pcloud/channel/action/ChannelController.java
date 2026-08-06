/**
 * Copyright 2008-2010 biaoping.yin
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.pcloud.channel.action;


import com.common.DateUtils;
import com.frameworkset.util.ListInfo;
import com.frameworkset.util.StringUtil;
import com.github.sd4324530.fastweixin.api.entity.Industry;
import com.pcloud.channel.entity.Channel;
import com.pcloud.channel.entity.ChannelCondition;
import com.pcloud.channel.service.ChannelException;
import com.pcloud.channel.service.ChannelService;
import jxl.write.Blank;
import org.frameworkset.platform.common.JSTreeNode;
import org.frameworkset.platform.common.TreeNodeStage;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.AccessControlContext;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>Title: ChannelController</p> <p>Description: 栏目管理控制器处理类 </p> <p>bxckj</p>
 * <p>Copyright (c) 2007</p> @Date 2018-02-26 21:15:12 @author lijia @version
 * v1.0
 */
public class ChannelController {

    private static Logger log = LoggerFactory.getLogger(ChannelController.class);

    private ChannelService channelService;

    public @ResponseBody
    String addChannel(Channel channel) {
        // 控制器
        try {
            String hasContent = channel.getHasContent();
            String isBlankOpen = channel.getIsBlankOpen();
            String isDisplay = channel.getIsDisplay();

            channel.setHasContent(hasContent == null ? "0" : hasContent);
            channel.setIsBlankOpen(isBlankOpen == null ? "0" : isBlankOpen);
            channel.setIsDisplay(isDisplay == null ? "0" : isDisplay);
            channel.setCreater(AccessControl.getAccessControl().getUserID());
            channel.setCreateDate(DateUtils.getLongDateStr());
            channelService.addChannel(channel);
            return "success";
        } catch (ChannelException e) {
            log.error("add Channel failed:", e);
            return StringUtil.formatBRException(e);
        } catch (Throwable e) {
            log.error("add Channel failed:", e);
            return StringUtil.formatBRException(e);
        }

    }

    public @ResponseBody
    String deleteChannel(String channelId) {
        try {
            channelService.deleteChannel(channelId);
            return "success";
        } catch (ChannelException e) {
            log.error("delete Channel failed:", e);
            return StringUtil.formatBRException(e);
        } catch (Throwable e) {
            log.error("delete Channel failed:", e);
            return StringUtil.formatBRException(e);
        }

    }

    public @ResponseBody
    String deleteBatchChannel(String... channelIds) {
        try {
            channelService.deleteBatchChannel(channelIds);
            return "success";
        } catch (Throwable e) {
            log.error("delete Batch channelIds failed:", e);
            return StringUtil.formatBRException(e);
        }

    }

    public @ResponseBody
    String updateChannel(Channel channel) {
        try {

            String hasContent = channel.getHasContent();
            String isBlankOpen = channel.getIsBlankOpen();
            String isDisplay = channel.getIsDisplay();

            channel.setHasContent(hasContent == null ? "0" : hasContent);
            channel.setIsBlankOpen(isBlankOpen == null ? "0" : isBlankOpen);
            channel.setIsDisplay(isDisplay == null ? "0" : isDisplay);
            channel.setLastModifier(AccessControl.getAccessControl().getUserID());
            channel.setLastModifyDate(DateUtils.getLongDateStr());
            channelService.updateChannel(channel);
            return "success";
        } catch (Throwable e) {
            log.error("update Channel failed:", e);
            return StringUtil.formatBRException(e);
        }

    }

    public String getChannel(String channelId, ModelMap model) throws ChannelException {
        try {
            Channel channel = channelService.getChannel(channelId);
            model.addAttribute("channel", channel);
            return "path:getChannel";
        } catch (ChannelException e) {
            throw e;
        } catch (Throwable e) {
            throw new ChannelException("get Channel failed::channelId=" + channelId, e);
        }

    }

    public String queryListInfoChannels(ChannelCondition conditions, @PagerParam(name = PagerParam.OFFSET) long offset,
                                        @PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
            throws ChannelException {
        // Constant.component_type_actionimpl
        try {
            String title = conditions.getTitle();
            if (title != null && !title.equals("")) {
                conditions.setTitle("%" + title + "%");
            }

            ListInfo channels = channelService.queryListInfoChannels(conditions, offset, pagesize);
            model.addAttribute("channels", channels);
            return "path:queryListInfoChannels";
        } catch (ChannelException e) {
            throw e;
        } catch (Exception e) {
            throw new ChannelException("pagine query Channel failed:", e);
        }

    }

    public String queryListChannels(ChannelCondition conditions, ModelMap model) throws ChannelException {
        try {
            String title = conditions.getTitle();
            if (title != null && !title.equals("")) {
                conditions.setTitle("%" + title + "%");
            }
            List<Channel> channels = channelService.queryListChannels(conditions);
            model.addAttribute("channels", channels);
            return "path:queryListChannels";
        } catch (ChannelException e) {
            throw e;
        } catch (Exception e) {
            throw new ChannelException("query Channel failed:", e);
        }

    }

    public String toUpdateChannel(String channelId, ModelMap model) throws ChannelException {
        try {
            Channel channel = channelService.getChannel(channelId);
            model.addAttribute("channel", channel);
            return "path:updateChannel";
        } catch (ChannelException e) {
            throw e;
        } catch (Throwable e) {
            throw new ChannelException("get Channel failed::channelId=" + channelId, e);
        }

    }

    public String toAddChannel() {
        return "path:addChannel";
    }

    public String index() {
        return "path:index";

    }


    /**
     * 获取行业分类tree数据
     *
     * @param itemType
     * @return
     */
    public @ResponseBody
    List<JSTreeNode> getChildrens(String pId) {

        List<JSTreeNode> treeNodes = buildTree(pId);

        return treeNodes;
    }

    /**
     * 递归查询tree子节点
     *
     * @param itemType
     * @return
     */
    public List<JSTreeNode> buildTree(String pId) {

        List<Channel> list = channelService.getChildren(pId);


        if (list == null || list.size() == 0) {
            return null;
        }

        List<JSTreeNode> treeNodes = new ArrayList<JSTreeNode>();

        for (Channel bean : list) {
            treeNodes.add(this.buildJSTreeNode(bean, pId));
        }

        return treeNodes;

    }


    /**
     * 组装tree节点信息
     *
     * @param org
     * @return
     */
    private JSTreeNode buildJSTreeNode(Channel channel, String pId) {

        List<JSTreeNode> childrens = buildTree(channel.getChannelId());


        JSTreeNode JSTreeNode = new JSTreeNode();
        JSTreeNode.setId(channel.getChannelId());
        JSTreeNode.setText(channel.getTitle());
        JSTreeNode.setIcon(null);
        TreeNodeStage state = new TreeNodeStage();
        state.setDisabled(false);

	/*	if(channel.getPid().equals(pId)) {
			state.setSelected(true);
		}else {
			state.setSelected(false);
		}
*/
        JSTreeNode.setState(state);

        if (childrens == null || childrens.size() == 0) {
            state.setOpened(false);
            JSTreeNode.setChildren(false);
        } else {
            state.setOpened(true);
            JSTreeNode.setChildren(childrens);
        }


        return JSTreeNode;
    }


}