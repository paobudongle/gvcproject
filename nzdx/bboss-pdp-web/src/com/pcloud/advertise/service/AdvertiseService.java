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

package com.pcloud.advertise.service;

import com.pcloud.advertise.entity.*;
import com.frameworkset.util.ListInfo;
import java.util.List;

/**
 * <p>Title: AdvertiseService</p> <p>Description: 招聘服务接口 </p> <p>bc</p>
 * <p>Copyright (c) 2015</p> @Date 2018-05-19 12:05:28 @author lijia @version
 * v1.0
 */
public interface AdvertiseService {
	public void addAdvertise(Advertise advertise) throws AdvertiseException;
	public void deleteAdvertise(String advertiseId) throws AdvertiseException;
	public void deleteBatchAdvertise(String... advertiseIds) throws AdvertiseException;
	public void updateAdvertise(Advertise advertise) throws AdvertiseException;
	public Advertise getAdvertise(String advertiseId) throws AdvertiseException;
	public ListInfo queryListInfoAdvertises(AdvertiseCondition conditions, long offset, int pagesize)
			throws AdvertiseException;
	public List<Advertise> queryListAdvertises(AdvertiseCondition conditions) throws AdvertiseException;
    List<Advertise> queryListInfoAdvertiseByTopTen();
}