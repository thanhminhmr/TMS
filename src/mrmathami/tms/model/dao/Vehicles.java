package mrmathami.tms.model.dao;

import mrmathami.tms.model.bean.Vehicle;
import mrmathami.tms.utilities.DatabaseConnection;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public final class Vehicles {
	private Vehicles() {
	}

	public static List<Vehicle> list() {
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectList("mrmathami.tms.model.mapper.Vehicles.list");
		} catch (Exception ignored) {
		}
		return null;
	}

	public static Vehicle get(Vehicle vehicle) {
		if (vehicle == null || !vehicle.has(Vehicle.Field.vehId)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectOne("mrmathami.tms.model.mapper.Vehicles.get", vehicle);
		} catch (Exception ignored) {
		}
		return null;
	}

	public static Vehicle add(Vehicle vehicle) {
		if (vehicle == null || !vehicle.hasAllExcept(Vehicle.Field.vehId)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			if (sqlSession.insert("mrmathami.tms.model.mapper.Vehicles.add", vehicle) != 0 && vehicle.hasAll()) {
				return vehicle;
			}
		} catch (Exception ignored) {
		}
		return null;
	}

	public static boolean edit(Vehicle vehicle) {
		if (vehicle == null || !vehicle.hasAll()) return false;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.update("mrmathami.tms.model.mapper.Vehicles.edit", vehicle) != 0;
		} catch (Exception ignored) {
		}
		return false;
	}

	public static int delete(List<Vehicle> vehicles) {
		for (Vehicle vehicle : vehicles) if (!vehicle.has(Vehicle.Field.vehId)) return 0;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.delete("mrmathami.tms.model.mapper.Vehicles.deleteList", vehicles);
		} catch (Exception ignored) {
		}
		return 0;
	}
}
