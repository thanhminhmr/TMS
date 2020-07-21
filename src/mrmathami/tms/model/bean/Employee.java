package mrmathami.tms.model.bean;

import java.util.EnumMap;
import java.util.EnumSet;

public final class Employee {
	private final EnumMap<Field, Object> map = new EnumMap<>(Field.class);

	// region Getter & Setter

	public Integer getEmpId() {
		return (Integer) map.get(Field.empId);
	}

	public void setEmpId(Integer empId) {
		map.put(Field.empId, empId);
	}

	public String getEmpName() {
		return (String) map.get(Field.empName);
	}

	public void setEmpName(String empName) {
		map.put(Field.empName, empName);
	}

	public String getEmpPosition() {
		return (String) map.get(Field.empPosition);
	}

	public void setEmpPosition(String empPosition) {
		map.put(Field.empPosition, empPosition);
	}

	public String getEmpAddress() {
		return (String) map.get(Field.empAddress);
	}

	public void setEmpAddress(String empAddress) {
		map.put(Field.empAddress, empAddress);
	}

	public String getEmpPhone() {
		return (String) map.get(Field.empPhone);
	}

	public void setEmpPhone(String empPhone) {
		map.put(Field.empPhone, empPhone);
	}

	public String getEmpExpYear() {
		return (String) map.get(Field.empExpYear);
	}

	public void setEmpExpYear(String empExpYear) {
		map.put(Field.empExpYear, empExpYear);
	}

	public Integer getStaId() {
		return (Integer) map.get(Field.staId);
	}

	public void setStaId(Integer staId) {
		map.put(Field.staId, staId);
	}

	public Integer getConId() {
		return (Integer) map.get(Field.conId);
	}

	public void setConId(Integer conId) {
		map.put(Field.conId, conId);
	}

	// endregion

	public boolean has(Field firstField, Field... fields) {
		for (Field field : fields) if (map.get(field) == null) return false;
		return map.get(firstField) != null;
	}

	public boolean hasAllExcept(Field firstField, Field... fields) {
		EnumSet<Field> exceptSet = EnumSet.of(firstField, fields);
		for (Field field : Field.values) if (!exceptSet.contains(field) && map.get(field) == null) return false;
		return true;
	}

	public boolean hasAll() {
		for (Field field : Field.values) if (map.get(field) == null) return false;
		return true;
	}

	public enum Field {
		empId,
		empName,
		empPosition,
		empAddress,
		empPhone,
		empExpYear,
		staId,
		conId;

		private static final Field[] values = values();
	}
}
