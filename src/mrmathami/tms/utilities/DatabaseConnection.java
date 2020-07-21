package mrmathami.tms.utilities;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.Objects;

public final class DatabaseConnection {
	private static final String RESOURCE = "mybatis.xml";
	private static final SqlSessionFactory SQL_SESSION_FACTORY = createSqlSessionFactory();

	private static SqlSessionFactory createSqlSessionFactory() {
		try (InputStream inputStream = Resources.getResourceAsStream(RESOURCE)) {
			return new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static SqlSession getSqlSession() {
		return Objects.requireNonNull(SQL_SESSION_FACTORY).openSession(true);
	}
}
