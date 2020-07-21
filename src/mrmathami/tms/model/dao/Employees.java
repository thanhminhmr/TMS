package mrmathami.tms.model.dao;

import mrmathami.tms.model.bean.Employee;
import mrmathami.tms.utilities.DatabaseConnection;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public final class Employees {
	private Employees() {
	}

	public static List<Employee> list() {
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectList("mrmathami.tms.model.mapper.Employees.list");
		} catch (Exception ignored) {
		}
		return null;
	}

	public static Employee get(Employee employee) {
		if (employee == null || !employee.has(Employee.Field.empId)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectOne("mrmathami.tms.model.mapper.Employees.get", employee);
		} catch (Exception ignored) {
		}
		return null;
	}

	public static Employee add(Employee employee) {
		if (employee == null || !employee.hasAllExcept(Employee.Field.empId)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			if (sqlSession.insert("mrmathami.tms.model.mapper.Employees.add", employee) != 0 && employee.hasAll()) {
				return employee;
			}
		} catch (Exception ignored) {
		}
		return null;
	}

	public static boolean edit(Employee employee) {
		if (employee == null || !employee.hasAll()) return false;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.update("mrmathami.tms.model.mapper.Employees.edit", employee) != 0;
		} catch (Exception ignored) {
		}
		return false;
	}

	public static int delete(List<Employee> employees) {
		for (Employee employee : employees) if (!employee.has(Employee.Field.empId)) return 0;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.delete("mrmathami.tms.model.mapper.Employees.deleteList", employees);
		} catch (Exception ignored) {
		}
		return 0;
	}
}
