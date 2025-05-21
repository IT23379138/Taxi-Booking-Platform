//initializes the system by creating a default drivers file when the web application starts.
package org.example.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DriverFileUtil.initializeDefaultDrivers();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}