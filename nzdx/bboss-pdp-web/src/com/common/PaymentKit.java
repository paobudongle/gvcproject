package com.common;


import com.jfinal.kit.HashKit;
import com.jfinal.kit.StrKit;
import com.jfinal.weixin.sdk.utils.Charsets;
import com.jfinal.weixin.sdk.utils.XmlHelper;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;
import java.util.Map.Entry;

public class PaymentKit {
    public PaymentKit() {
    }

    public static String packageSign(Map<String, String> params, boolean urlEncoder) {
        TreeMap<String, String> sortedParams = new TreeMap(params);
        StringBuilder sb = new StringBuilder();
        boolean first = true;
        Iterator i$ = sortedParams.entrySet().iterator();

        while(i$.hasNext()) {
            Entry<String, String> param = (Entry)i$.next();
            String value = (String) param.getValue();
            if (!StringUtils.isBlank(value)) {
                if (first) {
                    first = false;
                } else {
                    sb.append("&");
                }

                sb.append((String)param.getKey()).append("=");
                if (urlEncoder) {
                    try {
                        value = urlEncode(value);
                    } catch (UnsupportedEncodingException var9) {
                        ;
                    }
                }

                sb.append(value);
            }
        }

        return sb.toString();
    }

    public static String urlEncode(String src) throws UnsupportedEncodingException {
        return URLEncoder.encode(src, Charsets.UTF_8.name()).replace("+", "%20");
    }

    public static String createSign(Map<String, String> params, String paternerKey) {
       /* params.remove("sign");
        String stringA = packageSign(params, false);
        String stringSignTemp = stringA + "&key=" + paternerKey;
        return HashKit.md5(stringSignTemp).toUpperCase();*/

            Set<String> keySet = params.keySet();
            String[] keyArray = keySet.toArray(new String[keySet.size()]);
            Arrays.sort(keyArray);
            StringBuilder sb = new StringBuilder();
            for (String k : keyArray) {
                if (k.equals("sign")) {
                    continue;
                }
                if (params.get(k).trim().length() > 0) // 参数值为空，则不参与签名
                    sb.append(k).append("=").append(params.get(k).trim()).append("&");
            }
            sb.append("key=").append(paternerKey);
            return HashKit.md5(sb.toString()).toUpperCase();
    }

    public static boolean verifyNotify(Map<String, String> params, String paternerKey) {
        String sign = (String)params.get("sign");
        String localSign = createSign(params, paternerKey);
        return sign.equals(localSign);
    }

    public static String toXml(Map<String, String> params) {
        StringBuilder xml = new StringBuilder();
        xml.append("<xml>");
        Iterator i$ = params.entrySet().iterator();

        while(i$.hasNext()) {
            Entry<String, String> entry = (Entry)i$.next();
            String key = (String)entry.getKey();
            String value = (String)entry.getValue();
            if (!StrKit.isBlank(value)) {
                xml.append("<").append(key).append(">");
                xml.append((String)entry.getValue());
                xml.append("</").append(key).append(">");
            }
        }

        xml.append("</xml>");
        return xml.toString();
    }

    public static Map<String, String> xmlToMap(String xmlStr) {
        XmlHelper xmlHelper = XmlHelper.of(xmlStr);
        return xmlHelper.toMap();
    }
}
