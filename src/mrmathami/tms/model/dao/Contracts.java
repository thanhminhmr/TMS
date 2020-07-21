package mrmathami.tms.model.dao;

import mrmathami.tms.model.bean.Contract;
import mrmathami.tms.utilities.DatabaseConnection;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public final class Contracts {
	private Contracts() {
	}

	public static Contract get(Contract contract) {
		if (contract == null || !contract.has(Contract.Field.conId)) return null;
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectOne("mrmathami.tms.model.mapper.Contracts.get", contract);
		} catch (Exception ignored) {
		}
		return null;
	}

	public static List<Contract> list() {
		try (SqlSession sqlSession = DatabaseConnection.getSqlSession()) {
			return sqlSession.selectList("mrmathami.tms.model.mapper.Contracts.list");
		} catch (Exception ignored) {
		}
		return null;
	}
}
