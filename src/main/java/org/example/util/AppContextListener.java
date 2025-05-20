//Purpose: Its purpose is to allow your code to "listen" for and react to changes in the web application's lifecycle (startup and shutdown).
package org.example.util;

import javax.servlet.ServletContextEvent;//s like a memo that says "The building is open for business!" or "The building is closing down for the day!" It's the message about an event
import javax.servlet.ServletContextListener;//s like the "Building Manager." This manager is responsible for hearing those memos (ServletContextEvents) and performing specific actions based on them. When the "building open" memo arrives, the manager might turn on the lights, unlock the doors, and get everything ready. When the "building closing" memo arrives, the manager might turn off the lights and lock up.

public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DriverFileUtil.initializeDefaultDrivers();//This is the specific instruction for the Shop Manager: "When the shop opens, make sure to turn on the coffee machines and fill the espresso hoppers with beans."
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}