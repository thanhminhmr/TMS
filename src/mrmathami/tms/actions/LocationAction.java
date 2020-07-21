package mrmathami.tms.actions;

import com.opensymphony.xwork2.ActionSupport;
import mrmathami.tms.model.bean.Location;
import mrmathami.tms.model.dao.Locations;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

public final class LocationAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(LocationAction.class);
	private List<Location> locations;
	private Location location;
	private boolean success = true;

	public boolean isSuccess() {
		LOGGER.debug("isSuccess = " + success);
		return success;
	}

	public List<Location> getLocations() {
		return locations;
	}

	public void setLocations(List<Location> locations) {
		this.locations = locations;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public String doGet() {
		LOGGER.debug("doGet START");
		location = Locations.get(location);
		success = location != null;
		LOGGER.debug("doGet END");
		return SUCCESS;
	}

	public String doList() {
		LOGGER.debug("doList START");
		locations = Locations.list();
		LOGGER.debug("doList END");
		return SUCCESS;
	}

	public String doListByLastTimestamp() {
		LOGGER.debug("doListByLastTimestamp START");
		locations = Locations.listByLastTimestamp();
		LOGGER.debug("doListByLastTimestamp END");
		return SUCCESS;
	}

	public String doAdd() {
		LOGGER.debug("doAdd START");
		location = Locations.add(location);
		success = location != null;
		LOGGER.debug("doAdd END");
		return SUCCESS;
	}

	public String doEdit() {
		LOGGER.debug("doEdit START");
		success = Locations.edit(location);
		LOGGER.debug("doEdit END");
		return SUCCESS;
	}

	public String doDelete() {
		LOGGER.debug("doDelete END");
		success = Locations.delete(locations) == locations.size();
		LOGGER.debug("doDelete END");
		return SUCCESS;
	}
}
