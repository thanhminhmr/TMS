package mrmathami.tms.interceptors;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public final class LoggingInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(LoggingInterceptor.class);

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		final HttpServletRequest request = ServletActionContext.getRequest();
		LOGGER.debug("intercept START " + request.getRequestURI() + " --> " + invocation.getAction().getClass().getCanonicalName());
		String string = invocation.invoke();
		LOGGER.debug("intercept END " + request.getRequestURI() + " <-- " + invocation.getAction().getClass().getCanonicalName());
		return string;
	}
}
