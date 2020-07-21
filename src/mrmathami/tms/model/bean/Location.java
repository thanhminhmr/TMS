package mrmathami.tms.model.bean;

import java.util.Date;
import java.util.EnumMap;
import java.util.EnumSet;

public final class Location {
	private final EnumMap<Field, Object> map = new EnumMap<>(Field.class);

	// region Getter & Setter

	public Integer getLocId() {
		return (Integer) map.get(Field.locId);
	}

	public void setLocId(Integer locId) {
		map.put(Field.locId, locId);
	}

	public Integer getVehId() {
		return (Integer) map.get(Field.vehId);
	}

	public void setVehId(Integer vehId) {
		map.put(Field.vehId, vehId);
	}

	public Float getLocLatitude() {
		return (Float) map.get(Field.locLatitude);
	}

	public void setLocLatitude(Float locLatitude) {
		map.put(Field.locLatitude, locLatitude);
	}

	public Float getLocLongitude() {
		return (Float) map.get(Field.locLongitude);
	}

	public void setLocLongitude(Float locLongitude) {
		map.put(Field.locLongitude, locLongitude);
	}

	public Date getLocTimestamp() {
		return (Date) map.get(Field.locTimestamp);
	}

	public void setLocTimestamp(Date locTimestamp) {
		map.put(Field.locTimestamp, locTimestamp);
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
		locId,
		vehId,
		locLatitude,
		locLongitude,
		locTimestamp;

		private static final Field[] values = values();
	}
}
