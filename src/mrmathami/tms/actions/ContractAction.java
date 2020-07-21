package mrmathami.tms.actions;

import com.opensymphony.xwork2.ActionSupport;
import mrmathami.tms.model.bean.Contract;
import mrmathami.tms.model.dao.Contracts;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

public final class ContractAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(ContractAction.class);
	private List<Contract> contracts;
	private Contract contract;
	private boolean success = true;

	public boolean isSuccess() {
		LOGGER.debug("isSuccess = " + success);
		return success;
	}

	public List<Contract> getContracts() {
		return contracts;
	}

	public void setContracts(List<Contract> contracts) {
		this.contracts = contracts;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	public String doGet() {
		LOGGER.debug("doGet START");
		contract = Contracts.get(contract);
		success = contract != null;
		LOGGER.debug("doGet END");
		return SUCCESS;
	}

	public String doList() {
		LOGGER.debug("doList START");
		contracts = Contracts.list();
		success = contracts != null;
		LOGGER.debug("doList END");
		return SUCCESS;
	}
}
