package mrmathami.tms.model.bean;

import java.util.Date;
import java.util.EnumMap;
import java.util.EnumSet;

public final class Contract {
	private final EnumMap<Field, Object> map = new EnumMap<>(Field.class);

	// region Getter & Setter

	public Integer getConId() {
		return (Integer) map.get(Field.conId);
	}

	public void setConId(Integer conId) {
		map.put(Field.conId, conId);
	}

	public String getConName() {
		return (String) map.get(Field.conName);
	}

	public void setConName(String conName) {
		map.put(Field.conName, conName);
	}

	public Date getConStartDate() {
		return (Date) map.get(Field.conStartDate);
	}

	public void setConStartDate(Date conStartDate) {
		map.put(Field.conStartDate, conStartDate);
	}

	public Date getConExpiryDate() {
		return (Date) map.get(Field.conExpiryDate);
	}

	public void setConExpiryDate(Date conExpiryDate) {
		map.put(Field.conExpiryDate, conExpiryDate);
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
		conId,
		conName,
		conStartDate,
		conExpiryDate;

		private static final Field[] values = values();
	}
}
