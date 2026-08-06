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

package com.pcloud.advertise.action;

import com.pcloud.advertise.entity.*;
import com.frameworkset.util.ListInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;
import com.frameworkset.util.StringUtil;
import com.pcloud.advertise.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.MapKey;

/**
 * <p>Title: AdvertiseController</p> <p>Description: 招聘控制器处理类 </p> <p>bc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-19 12:05:28 @author lijia @version
 * v1.0
 */
public class AdvertiseController {

	private static Logger log = LoggerFactory.getLogger(AdvertiseController.class);

	private AdvertiseService advertiseService;
	public @ResponseBody String addAdvertise(Advertise advertise) {
		// 控制器
		try {
			advertiseService.addAdvertise(advertise);
			return "success";
		} catch (AdvertiseException e) {
			log.error("add Advertise failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add Advertise failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteAdvertise(String advertiseId) {
		try {
			advertiseService.deleteAdvertise(advertiseId);
			return "success";
		} catch (AdvertiseException e) {
			log.error("delete Advertise failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete Advertise failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchAdvertise(String... advertiseIds) {
		try {
			advertiseService.deleteBatchAdvertise(advertiseIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch advertiseIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateAdvertise(Advertise advertise) {
		try {
			advertiseService.updateAdvertise(advertise);
			return "success";
		} catch (Throwable e) {
			log.error("update Advertise failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getAdvertise(String advertiseId, ModelMap model) throws AdvertiseException {
		try {
			Advertise advertise = advertiseService.getAdvertise(advertiseId);
			model.addAttribute("advertise", advertise);
			return "path:getAdvertise";
		} catch (AdvertiseException e) {
			throw e;
		} catch (Throwable e) {
			throw new AdvertiseException("get Advertise failed::advertiseId=" + advertiseId, e);
		}

	}
	public String queryListInfoAdvertises(AdvertiseCondition conditions,
			@PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws AdvertiseException {
		// Constant.component_type_actionimpl
		try {
			String advertisePosition = conditions.getAdvertisePosition();
			if (advertisePosition != null && !advertisePosition.equals("")) {
				conditions.setAdvertisePosition("%" + advertisePosition + "%");
			}
			String workAddress = conditions.getWorkAddress();
			if (workAddress != null && !workAddress.equals("")) {
				conditions.setWorkAddress("%" + workAddress + "%");
			}

			ListInfo advertises = advertiseService.queryListInfoAdvertises(conditions, offset, pagesize);
			model.addAttribute("advertises", advertises);
			return "path:queryListInfoAdvertises";
		} catch (AdvertiseException e) {
			throw e;
		} catch (Exception e) {
			throw new AdvertiseException("pagine query Advertise failed:", e);
		}

	}
	public String queryListAdvertises(AdvertiseCondition conditions, ModelMap model) throws AdvertiseException {
		try {
			String advertisePosition = conditions.getAdvertisePosition();
			if (advertisePosition != null && !advertisePosition.equals("")) {
				conditions.setAdvertisePosition("%" + advertisePosition + "%");
			}
			String workAddress = conditions.getWorkAddress();
			if (workAddress != null && !workAddress.equals("")) {
				conditions.setWorkAddress("%" + workAddress + "%");
			}
			List<Advertise> advertises = advertiseService.queryListAdvertises(conditions);
			model.addAttribute("advertises", advertises);
			return "path:queryListAdvertises";
		} catch (AdvertiseException e) {
			throw e;
		} catch (Exception e) {
			throw new AdvertiseException("query Advertise failed:", e);
		}

	}
	public String toUpdateAdvertise(String advertiseId, ModelMap model) throws AdvertiseException {
		try {
			Advertise advertise = advertiseService.getAdvertise(advertiseId);
			model.addAttribute("advertise", advertise);
			return "path:updateAdvertise";
		} catch (AdvertiseException e) {
			throw e;
		} catch (Throwable e) {
			throw new AdvertiseException("get Advertise failed::advertiseId=" + advertiseId, e);
		}

	}
	public String toAddAdvertise() {
		return "path:addAdvertise";
	}
	public String index() {
		return "path:index";

	}
}