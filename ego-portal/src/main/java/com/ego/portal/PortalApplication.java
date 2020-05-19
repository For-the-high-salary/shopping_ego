package com.ego.portal;

import com.alibaba.dubbo.spring.boot.annotation.EnableDubboConfiguration;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 前台门户启动类
 *
 * @author zhoubin
 * @create 2019/12/31
 * @since 1.0.0
 */
@SpringBootApplication
//扫描mapper接口包
@MapperScan("com.ego.portal.mapper")
@EnableDubboConfiguration
public class PortalApplication {
	public static void main(String[] args) {
		SpringApplication.run(PortalApplication.class,args);
	}
}