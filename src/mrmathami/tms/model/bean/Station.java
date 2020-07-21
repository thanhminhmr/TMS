package mrmathami.tms.model.bean;

import java.util.EnumMap;
import java.util.EnumSet;

public final class Station {
	private final EnumMap<Field, Object> map = new EnumMap<>(Field.class);

	// region Getter & Setter

	public Integer getStaId() {
		return (Integer) map.get(Field.staId);
	}

	public void setStaId(Integer staId) {
		map.put(Field.staId, staId);
	}

	public String getStaName() {
		return (String) map.get(Field.staName);
	}

	public void setStaName(String staName) {
		map.put(Field.staName, staName);
	}

	public String getStaAddress() {
		return (String) map.get(Field.staAddress);
	}

	public void setStaAddress(String staAddress) {
		map.put(Field.staAddress, staAddress);
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
		staId,
		staName,
		staAddress;

		private static final Field[] values = values();
	}
}
