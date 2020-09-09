package GP.Test;

import cn.hutool.core.io.file.FileWriter;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class 从网络上下载图片 {
    public static void main(String[] args) {
        String filename = "C:\\Users\\Logan\\Pictures\\test";
        try {
            URL url = new URL("https://tse1-mm.cn.bing.net/th/id/OIP.XNLaEWztEXmh5950CwLSPgHaE8?w=264&h=180&c=7&o=5&dpr=1.5&pid=1.7");
            URLConnection connection = url.openConnection();
            connection.setConnectTimeout(3*1000);
            connection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36");
            InputStream inputStream = connection.getInputStream();
            BufferedInputStream bis = new BufferedInputStream(inputStream);
            File savedir = new File(filename);
            if(!savedir.exists()){
                savedir.mkdir();
            }
            String filepath = filename+File.separator+"text.jpg";
            File file = new File(filepath);
            OutputStream outputStream = new FileOutputStream(file);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);
            byte [] b = new byte[1024];
            int len = 0;
            while ((len=bis.read(b)) != -1){
                bos.write(b,0,len);
            }
            System.out.println("download success");
            bis.close();
            inputStream.close();
            bos.close();
            outputStream.close();
/*
            FileWriter writer = new FileWriter("1.img");
            writer.writeFromStream(inputStream);
            
            inputStream.close();
            bis.close();*/

        } catch (MalformedURLException e) {
            System.out.println("没有网络，无法下载");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("网络连接失败，请重试");
            e.printStackTrace();
        }
    }
}
