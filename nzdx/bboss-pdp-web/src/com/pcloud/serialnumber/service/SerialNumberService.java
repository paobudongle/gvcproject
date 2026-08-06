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

package com.pcloud.serialnumber.service;

import com.pcloud.serialnumber.entity.*;
import com.frameworkset.util.ListInfo;
import java.util.List;

/**
 * <p>Title: SerialNumberService</p> <p>Description: 序列号服务接口 </p> <p>xx</p>
 * <p>Copyright (c) 2015</p> @Date 2018-02-23 09:05:22 @author lijia @version
 * v1.0
 */
public interface SerialNumberService {
	public void addSerialNumber(SerialNumber serialNumber) throws SerialNumberException;
	public void deleteSerialNumber(String sn) throws SerialNumberException;
	public void deleteBatchSerialNumber(String... sns) throws SerialNumberException;
	public void updateSerialNumber(SerialNumber serialNumber) throws SerialNumberException;
	public SerialNumber getSerialNumber(String sn) throws SerialNumberException;
	public SerialNumber getSerialNumberByOrderId(String orderId) throws SerialNumberException;
	public ListInfo queryListInfoSerialNumbers(SerialNumberCondition conditions, long offset, int pagesize)
			throws SerialNumberException;
	public List<SerialNumber> queryListSerialNumbers(SerialNumberCondition conditions) throws SerialNumberException;

	public SerialNumber getSNByUserIdAndRole(String userId, String roleId) throws SerialNumberException;

    void setSerialNumberEnd(String sn);
}