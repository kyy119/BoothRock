package com.multi.FM.fstv;

import java.io.InputStream;
import java.util.Properties;

public class PropertiesReader {
    private static Properties properties;

    static {
        try (InputStream input = PropertiesReader.class.getClassLoader().getResourceAsStream("db.properties")) {
            properties = new Properties();
            properties.load(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
}