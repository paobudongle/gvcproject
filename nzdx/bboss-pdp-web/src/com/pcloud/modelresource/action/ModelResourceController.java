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

package com.pcloud.modelresource.action;

import com.common.DateUtils;
import com.common.StringUtils;
import com.common.UserUtils;
import com.common.ZxingKit;
import com.frameworkset.util.ListInfo;
import com.frameworkset.util.StringUtil;
import com.pcloud.modelresource.entity.ModelResource;
import com.pcloud.modelresource.entity.ModelResourceCondition;
import com.pcloud.modelresource.entity.ResourceComment;
import com.pcloud.modelresource.service.ModelResourceException;
import com.pcloud.modelresource.service.ModelResourceService;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.util.FileCopyUtils;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.multipart.MultipartFile;
import org.frameworkset.web.servlet.ModelMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.math.BigDecimal;
import java.util.List;


/**
 * <p>Title: ModelResourceController</p> <p>Description: 模型资源控制器处理类 </p>
 * <p>bjxbc</p> <p>Copyright (c) 2007</p> @Date 2018-07-26 12:17:13 @author
 * lijia @version v1.0
 */
public class ModelResourceController {

	private static Logger log = LoggerFactory.getLogger(ModelResourceController.class);

	private ModelResourceService modelResourceService;
	public @ResponseBody String addModelResource(HttpServletRequest request,ModelResource modelResource) {
		// 控制器
		try {
		    String base64 = modelResource.getSourceIcon();
			String id = request.getParameter("id");
			if(StringUtils.isEmpty(id)) {
				id = String.valueOf(System.currentTimeMillis());
			}
            //String ctxPath = request.getSession().getServletContext().getRealPath("/") + DIC_NAME + "/"+id;
			String ctxPath = request.getSession().getServletContext().getRealPath("/") + "modelResource/"+id;
            ZxingKit.base64StringToImage(base64,ctxPath,"icon.jpg");
            modelResource.setSourceIcon("icon.jpg");
            modelResource.setId(id);
			modelResource.setUpdateDate(DateUtils.getReqDate());

			modelResourceService.addModelResource(modelResource);
			return "success";
		} catch (ModelResourceException e) {
			log.error("add ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String addModelResourceNext(String id) {
		// 控制器
		try {
			String cid = String.valueOf(System.currentTimeMillis());
			ModelResource modelResource = modelResourceService.getModelResource(id);
			modelResource.setId(cid);
			modelResource.setParentId(id);
			modelResourceService.addModelResource(modelResource);
			return cid;
		} catch (ModelResourceException e) {
			log.error("add ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteModelResource(String id) {
		try {
			modelResourceService.deleteModelResource(id);
			return "success";
		} catch (ModelResourceException e) {
			log.error("delete ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchModelResource(String... ids) {
		try {
			modelResourceService.deleteBatchModelResource(ids);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch ids failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateModelResource(HttpServletRequest request,ModelResource modelResource) {
		try {
			String base64 = modelResource.getSourceIcon();
			String ctxPath = request.getSession().getServletContext().getRealPath("/") + "modelResource/"+modelResource.getId();
			ZxingKit.base64StringToImage(base64,ctxPath,"icon.jpg");
			modelResourceService.updateNextModelResource(modelResource);

			return "success";
		} catch (Throwable e) {
			log.error("update ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getModelResource(String id, ModelMap model) throws ModelResourceException {
		try {
			ModelResource modelResource = modelResourceService.getModelResource(id);
			model.addAttribute("modelResource", modelResource);
			return "path:getModelResource";
		} catch (ModelResourceException e) {
			throw e;
		} catch (Throwable e) {
			throw new ModelResourceException("get ModelResource failed::id=" + id, e);
		}

	}
	public String queryListInfoModelResources(ModelResourceCondition conditions,
			@PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws ModelResourceException {
		// Constant.component_type_actionimpl
		try {
			String sourceName = conditions.getSourceName();
			if (sourceName != null && !sourceName.equals("")) {
				conditions.setSourceName("%" + sourceName + "%");
			}

			ListInfo modelResources = modelResourceService.queryListInfoModelResources(conditions, offset, pagesize);
			model.addAttribute("modelResources", modelResources);
			return "path:queryListInfoModelResources";
		} catch (ModelResourceException e) {
			throw e;
		} catch (Exception e) {
			throw new ModelResourceException("pagine query ModelResource failed:", e);
		}

	}
	public String queryListModelResources(ModelResourceCondition conditions, ModelMap model)
			throws ModelResourceException {
		try {
			String sourceName = conditions.getSourceName();
			if (sourceName != null && !sourceName.equals("")) {
				conditions.setSourceName("%" + sourceName + "%");
			}
			List<ModelResource> modelResources = modelResourceService.queryListModelResources(conditions);
			model.addAttribute("modelResources", modelResources);
			return "path:queryListModelResources";
		} catch (ModelResourceException e) {
			throw e;
		} catch (Exception e) {
			throw new ModelResourceException("query ModelResource failed:", e);
		}

	}
	public String toUpdateModelResource(String id, ModelMap model) throws ModelResourceException {
		try {
			ModelResource modelResource = modelResourceService.getModelResource(id);
			ModelResourceCondition conditions = new ModelResourceCondition();
			conditions.setParentId(id);
			List<ModelResource>	childrenList = modelResourceService.getChildren(conditions);
			model.addAttribute("modelResource", modelResource);
			model.addAttribute("childrenList", childrenList);
			return "path:updateModelResource";
		} catch (ModelResourceException e) {
			throw e;
		} catch (Throwable e) {
			throw new ModelResourceException("get ModelResource failed::id=" + id, e);
		}

	}
	public String toAddModelResource(ModelMap model) {
		List<ModelResource> parentList = modelResourceService.queryListModelResources(new ModelResourceCondition());
		model.addAttribute("parentList", parentList);
		return "path:addModelResource";
	}
	public String index() {
		return "path:index";

	}


	public @ResponseBody List<ModelResource> getChildren(ModelResourceCondition conditions) {
		List<ModelResource>	childrenList = null;
		try {
			childrenList = modelResourceService.getChildren(conditions);

		} catch (ModelResourceException e) {
			log.error("delete ModelResource failed:", e);
		} catch (Throwable e) {
			log.error("delete ModelResource failed:", e);
		}

		return childrenList;
	}

    public @ResponseBody ModelResource getParentInfo(String id) throws ModelResourceException {
        try {
            ModelResource modelResource = modelResourceService.getModelResource(id);
            return modelResource;
        } catch (ModelResourceException e) {
            throw e;
        } catch (Throwable e) {
            throw new ModelResourceException("get ModelResource failed::id=" + id, e);
        }

    }
    public @ResponseBody String deleteModelResourceFile(ModelResourceCondition conditions) throws ModelResourceException {
        try {
            modelResourceService.deleteModelResourceFile(conditions);
			return "success";
        } catch (ModelResourceException e) {
            throw e;
        } catch (Throwable e) {
            throw new ModelResourceException("deleteModelResourceFile failed:" , e);
        }

    }


    public void processUpload(HttpServletRequest request, MultipartFile file)   throws Exception {

		String parentId = request.getParameter("parentId");
		String sourceType = request.getParameter("sourceType");
        // 获得文件名：
        String realFileName = file.getOriginalFilename();

        String prefix = realFileName.substring(realFileName.lastIndexOf(".")+1);

		String id = request.getParameter("id");
		if(StringUtils.isEmpty(id)) {
			id = String.valueOf(System.currentTimeMillis());
		}
		// 获取路径
		String ctxPath = request.getSession().getServletContext().getRealPath("/");

		String url = "";

		if("00".equals(sourceType)) {
			url = "modelResource/file/"+parentId+"/"+id;
			ctxPath = ctxPath + url;
		}else {
			url = "modelResource/video/"+parentId+"/"+id;
			ctxPath = ctxPath + url;
		}
        // 创建文件
        File dirPath = new File(ctxPath);
        if (!dirPath.exists()) {
         	dirPath.mkdirs();
         }
        File uploadFile = new File(ctxPath  +"/"+  realFileName);
        FileCopyUtils.copy(file.getBytes(), uploadFile);

        //String timeLength = ReadVideoTime(uploadFile);

		ModelResource modelResource = modelResourceService.getModelResource(parentId);
		modelResource.setId(id);
		modelResource.setParentId(parentId);
		modelResource.setSourceName(realFileName);
		modelResource.setSoucrePath("/"+url+"/"+  realFileName);
		modelResource.setSuffix(prefix);
		modelResource.setDescription("");
		modelResource.setUpdateDate(DateUtils.getReqDate());
		modelResource.setUploadTime(DateUtils.currentTime());
		modelResource.setUploadUser(AccessControl.getAccessControl().getUserName());
		modelResource.setFileSize(toFileSizeM(String.valueOf(file.getSize())));
		modelResourceService.addModelResource(modelResource);

    }

	public void processFrontUpload(HttpServletRequest request, MultipartFile file)   throws Exception {

		String parentId = request.getParameter("parentId");
		String sourceType = request.getParameter("sourceType");
		// 获得文件名：
		String realFileName = file.getOriginalFilename();

		String prefix = realFileName.substring(realFileName.lastIndexOf(".")+1);
		String id = request.getParameter("id");
		// 获取路径
		String ctxPath = request.getSession().getServletContext().getRealPath("/");

		String url = "";

		if("00".equals(sourceType)) {
			url = "modelResource/file/"+parentId+"/"+id;
			ctxPath = ctxPath + url;
		}else {
			url = "modelResource/video/"+parentId+"/"+id;
			ctxPath = ctxPath + url;
		}

		// 创建文件
		File dirPath = new File(ctxPath);
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		File uploadFile = new File(ctxPath  +"/"+  realFileName);
		FileCopyUtils.copy(file.getBytes(), uploadFile);

		ModelResource modelResource = new ModelResource();
		modelResource.setId(id);
		modelResource.setParentId(parentId);
		modelResource.setSourceName(realFileName);
		modelResource.setSoucrePath("/"+url+"/"+  realFileName);
		modelResource.setSuffix(prefix);
		modelResource.setUpdateDate(DateUtils.getReqDate());
		modelResource.setUploadTime(DateUtils.currentTime());
		modelResource.setUploadUser(AccessControl.getAccessControl().getUserName());
		modelResource.setFileSize(toFileSizeM(String.valueOf(file.getSize())));
		modelResourceService.addModelResource(modelResource);

	}

	public static String toFileSizeM(String fileSizeKb){
		String fileSizeM= "";
		if(fileSizeKb==null)
			fileSizeM ="0"+"B";
		long fSize = Long.valueOf(fileSizeKb);
		if(fSize<1024){
			fileSizeM = fileSizeKb+"B";//字节
		}else if(fSize>1024){
			BigDecimal bg = new BigDecimal(fSize);
			BigDecimal flsize = new BigDecimal(fSize);
			BigDecimal temp = new BigDecimal(1024);
			if(-1==temp.compareTo(flsize) || 0==temp.compareTo(flsize)){
				//四色五入保留2位小数(根据需求随意调整)
				flsize = bg.divide(new BigDecimal(1024), 2,BigDecimal.ROUND_HALF_UP);
				fileSizeM =flsize+"KB";
			}
			if(-1==temp.compareTo(flsize) || 0==temp.compareTo(flsize)){ //MB
				//四色五入保留2位小数(根据需求随意调整)
				flsize = flsize.divide(new BigDecimal(1024), 2,BigDecimal.ROUND_HALF_UP);
				fileSizeM = flsize+"M";
			}
		}
		return fileSizeM;
	}

	public @ResponseBody String updateBatchModelResource(HttpServletRequest request) {
		try {
			String[] ids = request.getParameterValues("id");
			String[] sourceNames = request.getParameterValues("sourceName");
			String[] descriptions = request.getParameterValues("description");
			String[] timeLengths = request.getParameterValues("timeLength");
			modelResourceService.updateBatchModelResource(ids,sourceNames,descriptions,timeLengths);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch ids failed:", e);
			return StringUtil.formatBRException(e);
		}

	}

	public String toResourceIndex(ModelResourceCondition conditions, int currentPage, long offset, @PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "5") int pagesize, ModelMap model) {

		/*boolean role = UserUtils.isHasRole("globalmodel");
		boolean role1 = UserUtils.isHasRole("trialglobalmodel");
		boolean role2 = UserUtils.isHasRole("trialnationalmodel");
//		boolean role3 = UserUtils.isHasRole("trialmacromodel");//免费
		boolean role3 = UserUtils.isHasRole("macromodel");//收费（资源）

		int count = UserUtils.isHasRoleNum();
		if(count == 1) {
			conditions.setIsCharge("00");
		}else{
			if(conditions.getBlongsModel().equals("04")){//public
				conditions.setIsCharge(null);
			}else  if(conditions.getBlongsModel().equals("00")){//glaob
				if(role){
					conditions.setIsCharge(null);
				}else {
					conditions.setIsCharge("00");
				}
			}else  if(conditions.getBlongsModel().equals("05")){
				if(role3){
					conditions.setIsCharge(null);
				}else {
					conditions.setIsCharge("00");
				}
			}
		}*/



		ListInfo modelResourcesList = modelResourceService.queryChildrenListInfoModelResources(conditions, offset, pagesize);
		model.addAttribute("modelResourcesList", modelResourcesList);
		model.addAttribute("totalPage", modelResourcesList.getTotalPages());
		model.addAttribute("offset", offset);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("currentPage", offset == 0?1:currentPage);
		model.addAttribute("prePage", offset / pagesize -1);
		model.addAttribute("nextPage", (offset == 0?1:currentPage) * pagesize);
		model.addAttribute("conditions", conditions);
		model.addAttribute("menu_id", 4);
		return "path:toResourceIndex";
	}

/*	private String ReadVideoTime(File source) {
		Encoder encoder = new Encoder();
		String length = "";
		try {
			MultimediaInfo m = encoder.getInfo(source);
			long ls = m.getDuration()/1000;
			int hour = (int) (ls/3600);
			int minute = (int) (ls%3600)/60;
			int second = (int) (ls-hour*3600-minute*60);
			length = hour+"'"+minute+"''"+second+"'''";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return length;
	}*/

	public String toResourceUpload(ModelMap model) {
		model.addAttribute("parentId", 0);
		model.addAttribute("id", String.valueOf(System.currentTimeMillis()));
		return "path:toResourceUpload";
	}

	public @ResponseBody String updateFrontModelResource(HttpServletRequest request,ModelResource modelResource) {
		// 控制器
		try {
			String base64 = modelResource.getSourceIcon();
			String id = request.getParameter("id");
			String ctxPath = request.getSession().getServletContext().getRealPath("/") + "modelResource/"+id;
			ZxingKit.base64StringToImage(base64,ctxPath,"icon.jpg");
			modelResource.setSourceIcon("icon.jpg");
			modelResource.setIsCharge("01");
			modelResource.setUpdateDate(DateUtils.getReqDate());
			modelResourceService.updateFrontModelResource(modelResource);
			return "success";
		} catch (ModelResourceException e) {
			log.error("add ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add ModelResource failed:", e);
			return StringUtil.formatBRException(e);
		}

	}

	public String toResourceShow(String id ,ModelResourceCondition conditions, ModelMap model) {
	//TODO
		/*
		1.公开资源04  06，无限制；
		2.全球模型00付费需订阅；
		3.宏观模型05付费需订阅；
		00：全球模型
		01：国家模型
		04，06：公共模型
		05：宏观模型
		 */
		boolean role = UserUtils.isHasRole("globalmodel");
		boolean role1 = UserUtils.isHasRole("macromodel");
		boolean role2 = UserUtils.isHasRole("nationalmodel");

		try {
			ModelResource modelResource = modelResourceService.getModelResource(id);
			//单个资源权限判断
			if("00".equals(modelResource.getBlongsModel())){
				if("00".equals(modelResource.getIsCharge())){
					modelResource.setPermission("access");
				}else if("01".equals(modelResource.getIsCharge())){
					if(role){
						modelResource.setPermission("access");
					}else{
						modelResource.setPermission("none");
					}
				}
			}else if("01".equals(modelResource.getBlongsModel())){
				if("00".equals(modelResource.getIsCharge())){
					modelResource.setPermission("access");
				}else if("01".equals(modelResource.getIsCharge())){
					if(role2){
						modelResource.setPermission("access");
					}else{
						modelResource.setPermission("none");
					}
				}
			}else if("05".equals(modelResource.getBlongsModel())){
				if("00".equals(modelResource.getIsCharge())){
					modelResource.setPermission("access");
				}else if("01".equals(modelResource.getIsCharge())){
					if(role1){
						modelResource.setPermission("access");
					}else{
						modelResource.setPermission("none");
					}
				}
			}else{
				modelResource.setPermission("access");
			}
			List<ResourceComment> commentList = modelResourceService.getCommentList(id);
			ResourceComment commentInfo = modelResourceService.getCommentInfo(id,AccessControl.getAccessControl().getUserName());


			conditions.setNewHot("1");
			ListInfo modelResourcesList = modelResourceService.queryChildrenListInfoModelResources(conditions, 0, 5);
			model.addAttribute("modelResource", modelResource);
			model.addAttribute("hotList", modelResourcesList.getDatas());
			model.addAttribute("commentList", commentList);
			model.addAttribute("size", commentList.size());
			model.addAttribute("userName", AccessControl.getAccessControl().getUserName());
			model.addAttribute("isComment", commentInfo == null?0:1);
			model.addAttribute("menu_id", 4);
			return "path:toResourceShow";
		} catch (ModelResourceException e) {
			throw e;
		} catch (Throwable e) {
			throw new ModelResourceException("get ModelResource failed::id=" + id, e);
		}
	}

	public @ResponseBody String addResourceComment(ResourceComment resourceComment) {
		// 控制器
		try {
			resourceComment.setId(String.valueOf(System.currentTimeMillis()));
			resourceComment.setCommentDate(DateUtils.getReqDate());
			resourceComment.setCommentUser(AccessControl.getAccessControl().getUserName());
			modelResourceService.addResourceComment(resourceComment);
			return "success";
		} catch (ModelResourceException e) {
			log.error("add ModelResource failed:", e);
			return "error";
		} catch (Throwable e) {
			log.error("add ModelResource failed:", e);
			return "error";
		}

	}

	public void downCount(String resourceId) {
		try {
			modelResourceService.downCount(resourceId);
		} catch (Throwable e) {
			log.error("update ModelResource failed:", e);
		}

	}


}