package util;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;





public class BeanUtil {
	public static Map<String, Object> getParams(HttpServletRequest request) {
  
        Enumeration<String> enumeration = request.getParameterNames();
        Map<String, Object> data = new HashMap<String, Object>();
        while (enumeration.hasMoreElements()) {
            String param = enumeration.nextElement();
            Object value = request.getParameter(param);
            data.put(param, value);
        }
 
        return data;
    } 
	  public static <T> T getBean(Class<T> clazz, Map<String, Object> data)
       {
  T entity = null;
  try {
	if (data != null && data.size() > 0) {
		entity = clazz.newInstance();
		for (Entry<String, Object> entry : data.entrySet()) {
			BeanUtils.setProperty(entity, entry.getKey(), entry.getValue());
		}
	}
} catch (Exception e) {
	e.printStackTrace();
}
  return entity;
}
}
