package GP.service;

import cn.hutool.log.Log;
import cn.hutool.log.LogFactory;
import cn.hutool.log.dialect.commons.ApacheCommonsLogFactory;
import org.springframework.stereotype.Component;

@Component
public class LogConfig {
    public Log log=null;
    public LogConfig() {
        LogFactory.setCurrentLogFactory(new ApacheCommonsLogFactory());
        log = LogFactory.get();
    }
}
