package com.common;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;

public class HttpClinet {
    private static Logger log = LoggerFactory.getLogger(HttpClinet.class);
    public static String httpPost(String url,String params) {

        String respContent = null;
        HttpPost httpPost = new HttpPost(url);
        try {
            RequestConfig defaultRequestConfig = RequestConfig.custom()
                    .setSocketTimeout(5000)
                    .setConnectTimeout(5000)
                    .setConnectionRequestTimeout(5000)
                    .build();

            CloseableHttpClient client = HttpClients.custom()
                    .setDefaultRequestConfig(defaultRequestConfig)
                    .build();
            log.info("httpPost的参数:" + params.toString());
            StringEntity entity = new StringEntity(params.toString(),"utf-8");//解决中文乱码问题
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            httpPost.setEntity(entity);

            HttpResponse resp = client.execute(httpPost);
            if(resp.getStatusLine().getStatusCode() == 200) {
                HttpEntity he = resp.getEntity();
                respContent = EntityUtils.toString(he,"UTF-8");
                log.info("httpPost的结果:" + respContent);
            }
        } catch (Exception e) {
            return respContent;
          // e.printStackTrace();
        }
        return respContent;
    }

    public static String httpGet(String url) {
        String respContent = null;
        try {
            CloseableHttpClient httpclient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(5000).setConnectionRequestTimeout(1000)
                    .setSocketTimeout(5000).build();
            httpGet.setConfig(requestConfig);
            CloseableHttpResponse response = httpclient.execute(httpGet);
            if(response.getStatusLine().getStatusCode() == 200) {
                HttpEntity entity = response.getEntity();//得到请求回来的数据
                respContent = EntityUtils.toString(entity,"UTF-8");
                log.info("httpGet的结果:" + respContent);
            }
        } catch (Exception e) {
            return respContent;
        }
        return respContent;
    }

    /**
     * 发送http get请求
     *
     * @param getUrl
     * @return
     */
    public static String sendGetRequest(String getUrl)
    {
        log.info("httpGet"+getUrl);
        StringBuffer sb = new StringBuffer();
        InputStreamReader isr = null;
        BufferedReader br = null;
        try
        {
            URL url = new URL(getUrl);
            URLConnection urlConnection = url.openConnection();
            urlConnection.setAllowUserInteraction(false);
            isr = new InputStreamReader(url.openStream());
            br = new BufferedReader(isr);
            String line;
            while ((line = br.readLine()) != null)
            {
                sb.append(line);
                log.info(String.valueOf(sb.length()));
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        finally
        {

            if(isr != null) {
                try {
                    isr.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if(br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return sb.toString();
    }


    public static void DownLoadPages(String urlsrc, String outpath) throws Exception {
        // 输入流
        InputStream in = null;
        // 文件输出流
        FileOutputStream out = null;
        try{
            HttpParams httpParams = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(httpParams,5000); //设置连接超时为5秒
            HttpClient client = new DefaultHttpClient(httpParams); // 生成一个http客户端发送请求对象
            HttpGet httpget1 = new HttpGet(urlsrc); //对查询页面get
            HttpResponse httpResponse1 = client.execute(httpget1); // 发送请求并等待响应
            // 判断网络连接是否成功
            log.info("状态码："+httpResponse1.getStatusLine().getStatusCode());
            if (httpResponse1.getStatusLine().getStatusCode() != 200){
                // System.out.println("网络错误异常！!!!");
                log.info("网络错误异常！!!!");
                throw new Exception("网络错误异常！!!!");
            } else {
                log.info("网络连接成功!!!");
            }

            httpget1.abort(); //关闭get
            HttpGet httpget2 = new HttpGet(urlsrc); //对下载链接get实现下载
            HttpResponse httpResponse2 = client.execute(httpget2);
            HttpEntity entity = httpResponse2.getEntity(); // 获取响应里面的内容
            in = entity.getContent(); // 得到服务气端发回的响应的内容（都在一个流里面）
            out = new FileOutputStream(new File(outpath));
            byte[] b = new byte[1024];
            int len = 0;
            while((len=in.read(b))!= -1){
                out.write(b,0,len);
            }
            in.close();
            out.close();
        }catch(Exception e){
            throw new Exception("网络错误异常！!!!");
        }

        log.info("文件["+urlsrc+"]下载成功");
    }




    public static void main(String args[]) {
//        String rs= HttpClinet.httpGet("http://39.97.224.177:5555/1111/step1/json/");
       // String a = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">";
      //  System.out.println(a.substring(0,10));
       // System.out.println(a.substring(0,10).indexOf("<!DOCTYPE"));

        String urlsrc = "http://39.97.224.177:5555/116/step1/csv/"; //要访问的链接
        String outPath = "/Users/any/Desktop/1.csv"; //本地路径
        try {
            DownLoadPages(urlsrc,outPath);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
