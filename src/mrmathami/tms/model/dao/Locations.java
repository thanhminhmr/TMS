package mrmathami.tms.model.dao;

import mrmathami.tms.model.bean.Location;
import mrmathami.tms.utilities.DatabaseConnection;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public final class Locations {
	private Locations() {
	}

	public static List<Location> list() {
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectList("mrmathami.tms.model.mapper.Locations.list");
		} catch (Exception ignored) {
		}
		return null;
	}

	public static List<Location> listByLastTimestamp() {
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectList("mrmathami.tms.model.mapper.Locations.listByLastTimestamp");
		} catch (Exception ignored) {
		}
		return null;
	}

	public static Location get(Location location) {
		if (location == null || !location.has(Location.Field.locId)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectOne("mrmathami.tms.model.mapper.Locations.get", location);
		} catch (Exception ignored) {
		}
		return null;
	}

	public static Location add(Location location) {
		if (location == null || !location.hasAllExcept(Location.Field.locId, Location.Field.locTimestamp)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			if (sqlSession.insert("mrmathami.tms.model.mapper.Locations.add", location) != 0 /*&& location.hasAll()*/) {
				return location;
			}
		} catch (Exception ignored) {
		}
		return null;
	}

	public static boolean edit(Location location) {
		if (location == null || !location.hasAll()) return false;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.update("mrmathami.tms.model.mapper.Locations.edit", location) != 0;
		} catch (Exception ignored) {
		}
		return false;
	}

	public static int delete(List<Location> locations) {
		for (Location location : locations) if (!location.has(Location.Field.locId)) return 0;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.delete("mrmathami.tms.model.mapper.Locations.deleteList", locations);
		} catch (Exception ignored) {
		}
		return 0;
	}
}
