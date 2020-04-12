import com.qst.common.constast.SysConstast;

import java.io.File;

public class Test {

    @org.junit.Test
    public  void  RecyleTempFile(){
        String imageBaseUrl = "C:\\Users\\zhangouba\\Desktop\\images";
        File file=new File(imageBaseUrl);
        detele(file);
    }
    public  void  detele(File file){
        File[] files= file.listFiles();
        for (File file1:files){
            System.out.println(file1.getName());
            System.out.println(file1.getName().contains(SysConstast.FILE_UPLOAD_TEMP));
            if (file1.getName().contains(SysConstast.FILE_UPLOAD_TEMP)){
                file1.delete();
            }
            if (file1.isDirectory()){
                detele(file1);
            }
        }
    }

}
