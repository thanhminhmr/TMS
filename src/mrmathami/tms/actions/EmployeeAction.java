package mrmathami.tms.actions;

import com.opensymphony.xwork2.ActionSupport;
import mrmathami.tms.model.bean.Employee;
import mrmathami.tms.model.dao.Employees;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

public final class EmployeeAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(EmployeeAction.class);
	private List<Employee> employees;
	private Employee employee;
	private boolean success = true;

	public boolean isSuccess() {
		LOGGER.debug("isSuccess = " + success);
		return success;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String doGet() {
		LOGGER.debug("doGet START");
		employee = Employees.get(employee);
		success = employee != null;
		LOGGER.debug("doGet END");
		return SUCCESS;
	}

	public String doList() {
		LOGGER.debug("doList START");
		employees = Employees.list();
		LOGGER.debug("doList END");
		return SUCCESS;
	}

	public String doAdd() {
		LOGGER.debug("doAdd START");
		employee = Employees.add(employee);
		success = employee != null;
		LOGGER.debug("doAdd END");
		return SUCCESS;
	}

	public String doEdit() {
		LOGGER.debug("doEdit START");
		success = Employees.edit(employee);
		LOGGER.debug("doEdit END");
		return SUCCESS;
	}

	public String doDelete() {
		LOGGER.debug("doDelete START");
		success = Employees.delete(employees) == employees.size();
		LOGGER.debug("doDelete END");
		return SUCCESS;
	}
}
