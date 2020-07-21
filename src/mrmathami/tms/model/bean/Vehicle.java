package mrmathami.tms.model.bean;

import java.util.EnumMap;
import java.util.EnumSet;

public final class Vehicle {
	private final EnumMap<Field, Object> map = new EnumMap<>(Field.class);

	// region Getter & Setter

	public Integer getVehId() {
		return (Integer) map.get(Field.vehId);
	}

	public void setVehId(Integer vehId) {
		map.put(Field.vehId, vehId);
	}

	public String getVehPlateNumber() {
		return (String) map.get(Field.vehPlateNumber);
	}

	public void setVehPlateNumber(String vehPlateNumber) {
		map.put(Field.vehPlateNumber, vehPlateNumber);
	}

	public String getVehManufacturer() {
		return (String) map.get(Field.vehManufacturer);
	}

	public void setVehManufacturer(String vehManufacturer) {
		map.put(Field.vehManufacturer, vehManufacturer);
	}

	public String getVehColor() {
		return (String) map.get(Field.vehColor);
	}

	public void setVehColor(String vehColor) {
		map.put(Field.vehColor, vehColor);
	}

	public Integer getEmpId() {
		return (Integer) map.get(Field.empId);
	}

	public void setEmpId(Integer empId) {
		map.put(Field.empId, empId);
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
		vehId,
		vehPlateNumber,
		vehManufacturer,
		vehColor,
		empId;

		private static final Field[] values = values();
	}
}
