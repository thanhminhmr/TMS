package mrmathami.tms.model.dao;

import mrmathami.tms.model.bean.Station;
import mrmathami.tms.utilities.DatabaseConnection;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public final class Stations {
	private Stations() {
	}

	public static Station get(Station station) {
		if (station == null || !station.has(Station.Field.staId)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectOne("mrmathami.tms.model.mapper.Stations.get", station);
		} catch (Exception ignored) {
		}
		return null;
	}

	public static List<Station> list() {
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectList("mrmathami.tms.model.mapper.Stations.list");
		} catch (Exception ignored) {
		}
		return null;
	}
}
