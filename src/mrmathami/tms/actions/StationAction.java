package mrmathami.tms.actions;

import com.opensymphony.xwork2.ActionSupport;
import mrmathami.tms.model.bean.Station;
import mrmathami.tms.model.dao.Stations;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

public final class StationAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(StationAction.class);
	private List<Station> stations;
	private Station station;
	private boolean success = true;

	public boolean isSuccess() {
		LOGGER.debug("isSuccess = " + success);
		return success;
	}

	public List<Station> getStations() {
		return stations;
	}

	public void setStations(List<Station> stations) {
		this.stations = stations;
	}

	public Station getStation() {
		return station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public String doGet() {
		LOGGER.debug("doGet START");
		station = Stations.get(station);
		success = station != null;
		LOGGER.debug("doGet END");
		return SUCCESS;
	}

	public String doList() {
		LOGGER.debug("doList START");
		stations = Stations.list();
		LOGGER.debug("doList END");
		return SUCCESS;
	}
}
