package com.common;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class DownloadUtils {
    static final int BUFFER = 8192;
    private static File zipFile;
    /**
     * 打包下载
     * @param downQuene
     * @param response
     * @throws IOException
     */
    public static void zipDownLoad(Map<File,String> downQuene, HttpServletResponse response) throws IOException {
        ServletOutputStream out = response.getOutputStream();
        ZipOutputStream zipout = new ZipOutputStream(out);
        ZipEntry entry = null;
        zipout.setLevel(1);
        if (downQuene != null && downQuene.size() > 0) {
            for (Map.Entry<File,String> fileInfo : downQuene.entrySet()) {
                File file = fileInfo.getKey();
                String filename = new String(fileInfo.getValue().getBytes(),"GBK");
                entry = new ZipEntry(filename);
                entry.setSize(file.length());
                zipout.putNextEntry(entry);
                BufferedInputStream fr = new BufferedInputStream(new FileInputStream(fileInfo.getKey()));
                int len;
                byte[] buffer = new byte[BUFFER];
                while ((len = fr.read(buffer)) != -1)
                    zipout.write(buffer,0,len);
                fr.close();
            }
        }
        zipout.finish();
        zipout.flush();
    }



    /**
     * 将文件下载到客户端浏览器
     *
     * @param fileName
     * @param response
     * @throws IOException
     */
    public static void download(String fileName, File source, String contentType, boolean inline,
                                HttpServletResponse response) throws IOException {
        ServletOutputStream outp = null;
        FileInputStream br = null;
        int len = 0;
        try {
            br = new FileInputStream(source);
            response.reset();
            outp = response.getOutputStream();
            response.setContentType(contentType);
            response.setContentLength((int) source.length());
            String header = (inline ? "inline" : "attachment") + ";filename="
                    + new String(fileName.getBytes(), "ISO8859-1");
            response.addHeader("Content-Disposition", header);
            byte[] buf = new byte[BUFFER];
            while ((len = br.read(buf)) != -1) {
                outp.write(buf, 0, len);
            }
            outp.flush();
            outp.close();
        } finally {
            if (br != null) {
                if (0 == br.available()) {
                    br.close();
                }
            }
        }
    }






    public  DownloadUtils(String pathName) {
        zipFile = new File(pathName);
    }
    public  void compress(String... pathName) {
        ZipOutputStream out = null;
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(zipFile);
            CheckedOutputStream cos = new CheckedOutputStream(fileOutputStream,
                    new CRC32());
            out = new ZipOutputStream(cos);
            String basedir = "";
            for (int i=0;i<pathName.length;i++){
                compress(new File(pathName[i]), out, basedir);
            }
            out.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public  void compress(String srcPathName) {
        File file = new File(srcPathName);
        if (!file.exists())
            throw new RuntimeException(srcPathName + "不存在！");
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(zipFile);
            CheckedOutputStream cos = new CheckedOutputStream(fileOutputStream,new CRC32());
            ZipOutputStream out = new ZipOutputStream(cos);
            String basedir = "";
            compress(file, out, basedir);
            out.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private  void compress(File file, ZipOutputStream out, String basedir) {
        /* 判断是目录还是文件 */
        if (file.isDirectory()) {
            System.out.println("压缩：" + basedir + file.getName());
            compressDirectory(file, out, basedir);
        } else {
            System.out.println("压缩：" + basedir + file.getName());
            compressFile(file, out, basedir);
        }
    }

    /** 压缩一个目录 */
    private  void compressDirectory(File dir, ZipOutputStream out, String basedir) {
        if (!dir.exists())
            return;

        File[] files = dir.listFiles();
        for (int i = 0; i < files.length; i++) {
            /* 递归 */
            compress(files[i], out, basedir + dir.getName() + "/");
        }
    }

    /** 压缩一个文件 */
    private static void compressFile(File file, ZipOutputStream out, String basedir) {
        if (!file.exists()) {
            return;
        }
        try {
            BufferedInputStream bis = new BufferedInputStream(
                    new FileInputStream(file));
            ZipEntry entry = new ZipEntry(basedir + file.getName());
            out.putNextEntry(entry);
            int count;
            byte data[] = new byte[BUFFER];
            while ((count = bis.read(data, 0, BUFFER)) != -1) {
                out.write(data, 0, count);
            }
            bis.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
