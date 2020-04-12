package com.qst.common.redis;

import redis.clients.jedis.Jedis;

/*
 *   - @张浩
 * -@zhanghao2902@163.com
 *  -----0.0-------------
 */
public class ClientRedis {

    private static Jedis client;

    public static void main(String[] args) {
        new ClientRedis().setRelation();
        new ClientRedis().jsonAnalysis();
    }

    // 与Redis数据库建立连接
    public void setRelation() {
        try {
            String host = "127.0.0.1";
            int port = 6379;
            if (client == null) {
                client = new Jedis(host, port);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 数据读取与解析操作
    public void jsonAnalysis() {
        try {

            // 输出json数据jsonData
            String jsonData = client.get("gao");
            System.out.println("读取并输出Redis内Json数据:\n" + jsonData);
            // 调用readValue()方法，解析该json数据为String数据stringData，并输出
            JsonConversion stringData = JsonAnalysis.readValue(jsonData, JsonConversion.class);
            System.out.println("解析并输出Json数据:\n" + stringData);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
