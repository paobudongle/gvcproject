
package com.pcloud.serialnumber.action;

import com.pcloud.serialnumber.entity.*;
import com.frameworkset.util.ListInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;
import com.frameworkset.util.StringUtil;
import com.pcloud.serialnumber.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.MapKey;

public class SerialNumberController {

	private static Logger log = LoggerFactory.getLogger(SerialNumberController.class);

	private SerialNumberService serialNumberService;
	public @ResponseBody String addSerialNumber(SerialNumber serialNumber) {
		// 控制器
		try {
			serialNumberService.addSerialNumber(serialNumber);
			return "success";
		} catch (SerialNumberException e) {
			log.error("add SerialNumber failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add SerialNumber failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteSerialNumber(String sn) {
		try {
			serialNumberService.deleteSerialNumber(sn);
			return "success";
		} catch (SerialNumberException e) {
			log.error("delete SerialNumber failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete SerialNumber failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchSerialNumber(String... sns) {
		try {
			serialNumberService.deleteBatchSerialNumber(sns);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch sns failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateSerialNumber(SerialNumber serialNumber) {
		try {
			serialNumberService.updateSerialNumber(serialNumber);
			return "success";
		} catch (Throwable e) {
			log.error("update SerialNumber failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getSerialNumber(String sn, ModelMap model) throws SerialNumberException {
		try {
			SerialNumber serialNumber = serialNumberService.getSerialNumber(sn);
			model.addAttribute("serialNumber", serialNumber);
			return "path:getSerialNumber";
		} catch (SerialNumberException e) {
			throw e;
		} catch (Throwable e) {
			throw new SerialNumberException("get SerialNumber failed::sn=" + sn, e);
		}

	}
	public String queryListInfoSerialNumbers(SerialNumberCondition conditions,
			@PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws SerialNumberException {
		// Constant.component_type_actionimpl
		try {

			ListInfo serialNumbers = serialNumberService.queryListInfoSerialNumbers(conditions, offset, pagesize);
			model.addAttribute("serialNumbers", serialNumbers);
			return "path:queryListInfoSerialNumbers";
		} catch (SerialNumberException e) {
			throw e;
		} catch (Exception e) {
			throw new SerialNumberException("pagine query SerialNumber failed:", e);
		}

	}
	public String queryListSerialNumbers(SerialNumberCondition conditions, ModelMap model)
			throws SerialNumberException {
		try {
			List<SerialNumber> serialNumbers = serialNumberService.queryListSerialNumbers(conditions);
			model.addAttribute("serialNumbers", serialNumbers);
			return "path:queryListSerialNumbers";
		} catch (SerialNumberException e) {
			throw e;
		} catch (Exception e) {
			throw new SerialNumberException("query SerialNumber failed:", e);
		}

	}
	public String toUpdateSerialNumber(String sn, ModelMap model) throws SerialNumberException {
		try {
			SerialNumber serialNumber = serialNumberService.getSerialNumber(sn);
			model.addAttribute("serialNumber", serialNumber);
			return "path:updateSerialNumber";
		} catch (SerialNumberException e) {
			throw e;
		} catch (Throwable e) {
			throw new SerialNumberException("get SerialNumber failed::sn=" + sn, e);
		}

	}
	public String toAddSerialNumber() {
		return "path:addSerialNumber";
	}
	public String index() {
		return "path:index";

	}
}