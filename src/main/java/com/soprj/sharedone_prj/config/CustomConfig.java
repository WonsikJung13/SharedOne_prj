package com.soprj.sharedone_prj.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@MapperScan(value = "com.soprj.sharedone_prj.mapper")
public class CustomConfig {
}
