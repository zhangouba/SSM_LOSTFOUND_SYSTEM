package com.qst.common.utils;

import java.io.File;

public class AppFileUtils {


	/**
	 * 更改自定义目录下的文件名
	 *
	 * @param carimg
	 */
	public static String updateFileName(String PATHS,String carimg, String suffix) {
		//找到文件
		try {
			File file = new File(PATHS, carimg);
			if (file.exists()) {
				file.renameTo(new File(PATHS, carimg.replace(suffix, "")));
				return carimg.replace(suffix, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	/**
	 * 更改自定义目录下的文件名
	 *
	 * @param carimg
	 */
	public static String updateFileNameSUB(String PATHS,String carimg) {
		//找到文件
		try {
			File file = new File(PATHS, carimg);
			if (file.exists()) {
				file.renameTo(new File(PATHS, carimg.substring(0,carimg.length()-9)));
				return carimg.substring(0,carimg.length()-9);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


}