package com.qst.manger.task;

import com.qst.common.constast.SysConstast;
import com.qst.common.utils.WebUtils;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;


@Component
@EnableScheduling  //开启定时任务
//开启定时任务  <task:annotation-driven/>  二选一
public class RecyleTempFileTask {
    @Scheduled(cron = "0/10 * * * * ? ")
    public  void  RecyleTempFile(){
        String imageBaseUrl = WebUtils.getHttpSession().getServletContext().getRealPath("images");
        System.out.println(imageBaseUrl);
        File file=new File(imageBaseUrl);
        detele(file);
    }
    public  void  detele(File file){
        File[] files= file.listFiles();
        for (File file1:files){
           if (file1.getName().contains(SysConstast.FILE_UPLOAD_TEMP)){
               file1.delete();
           }
            if (file1.isDirectory()){
                detele(file1);
            }
        }
    }

}
