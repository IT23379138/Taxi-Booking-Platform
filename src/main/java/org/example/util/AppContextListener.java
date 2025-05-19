package org.example.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DriverFileUtil.setServletContext(sce.getServletContext());
        DriverFileUtil.initializeDefaultDrivers();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}