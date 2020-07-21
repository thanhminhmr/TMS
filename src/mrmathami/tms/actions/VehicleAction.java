package mrmathami.tms.actions;

import com.opensymphony.xwork2.ActionSupport;
import mrmathami.tms.model.bean.Vehicle;
import mrmathami.tms.model.dao.Vehicles;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

public final class VehicleAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(VehicleAction.class);
	private List<Vehicle> vehicles;
	private Vehicle vehicle;
	private boolean success = true;

	public boolean isSuccess() {
		LOGGER.debug("isSuccess = " + success);
		return success;
	}

	public List<Vehicle> getVehicles() {
		return vehicles;
	}

	public void setVehicles(List<Vehicle> vehicles) {
		this.vehicles = vehicles;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public String doGet() {
		LOGGER.debug("doGet START");
		vehicle = Vehicles.get(vehicle);
		success = vehicle != null;
		LOGGER.debug("doGet END");
		return SUCCESS;
	}

	public String doList() {
		LOGGER.debug("doList START");
		vehicles = Vehicles.list();
		LOGGER.debug("doList END");
		return SUCCESS;
	}

	public String doAdd() {
		LOGGER.debug("doAdd START");
		vehicle = Vehicles.add(vehicle);
		success = vehicle != null;
		LOGGER.debug("doAdd END");
		return SUCCESS;
	}

	public String doEdit() {
		LOGGER.debug("doEdit START");
		success = Vehicles.edit(vehicle);
		LOGGER.debug("doEdit END");
		return SUCCESS;
	}

	public String doDelete() {
		LOGGER.debug("doDelete END");
		success = Vehicles.delete(vehicles) == vehicles.size();
		LOGGER.debug("doDelete END");
		return SUCCESS;
	}
}
