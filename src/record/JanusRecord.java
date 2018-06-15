package record;

import java.util.Date;

public class JanusRecord {
	
	Date indentDate, placementDate, lrDate, arrivalAtOrigin, departFromOrigin, arrivalAtDest, departFromDest, loadingStarted, loadingCompleted, lrAssigned, edd, billDate, submittedDate, dueDate, paymentDate; 
	String indentNo, actualTransporter, customer, transporter, origin, destination, vehicleType, vehicleNo, lrNo, vehicleStatus, podFile, invoiceNo, customerCode, originAddr, destAddr, eta, billStatus, billNo, billStatus1, depsInfo, remarks, billFile, clvd, uvd, shipmentNo, indentStatus; 
	Integer noOfTyres, indentId, transporterId, customerId, vehicleStatusId, billAmount, paidAmount;
	public Date getIndentDate() {
		return indentDate;
	}
	public void setIndentDate(Date indentDate) {
		this.indentDate = indentDate;
	}
	public Date getPlacementDate() {
		return placementDate;
	}
	public void setPlacementDate(Date placementDate) {
		this.placementDate = placementDate;
	}
	public Date getLrDate() {
		return lrDate;
	}
	public void setLrDate(Date lrDate) {
		this.lrDate = lrDate;
	}
	public Date getArrivalAtOrigin() {
		return arrivalAtOrigin;
	}
	public void setArrivalAtOrigin(Date arrivalAtOrigin) {
		this.arrivalAtOrigin = arrivalAtOrigin;
	}
	public Date getDepartFromOrigin() {
		return departFromOrigin;
	}
	public void setDepartFromOrigin(Date departFromOrigin) {
		this.departFromOrigin = departFromOrigin;
	}
	public Date getArrivalAtDest() {
		return arrivalAtDest;
	}
	public void setArrivalAtDest(Date arrivalAtDest) {
		this.arrivalAtDest = arrivalAtDest;
	}
	public Date getDepartFromDest() {
		return departFromDest;
	}
	public void setDepartFromDest(Date departFromDest) {
		this.departFromDest = departFromDest;
	}
	public Date getLoadingStarted() {
		return loadingStarted;
	}
	public void setLoadingStarted(Date loadingStarted) {
		this.loadingStarted = loadingStarted;
	}
	public Date getLoadingCompleted() {
		return loadingCompleted;
	}
	public void setLoadingCompleted(Date loadingCompleted) {
		this.loadingCompleted = loadingCompleted;
	}
	public Date getLrAssigned() {
		return lrAssigned;
	}
	public void setLrAssigned(Date lrAssigned) {
		this.lrAssigned = lrAssigned;
	}
	public Date getEdd() {
		return edd;
	}
	public void setEdd(Date edd) {
		this.edd = edd;
	}
	public Date getBillDate() {
		return billDate;
	}
	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}
	public Date getSubmittedDate() {
		return submittedDate;
	}
	public void setSubmittedDate(Date submittedDate) {
		this.submittedDate = submittedDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getIndentNo() {
		return indentNo;
	}
	public void setIndentNo(String indentNo) {
		this.indentNo = indentNo;
	}
	public String getActualTransporter() {
		return actualTransporter;
	}
	public void setActualTransporter(String actualTransporter) {
		this.actualTransporter = actualTransporter;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getTransporter() {
		return transporter;
	}
	public void setTransporter(String transporter) {
		this.transporter = transporter;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public String getLrNo() {
		return lrNo;
	}
	public void setLrNo(String lrNo) {
		this.lrNo = lrNo;
	}
	public String getVehicleStatus() {
		return vehicleStatus;
	}
	public void setVehicleStatus(String vehicleStatus) {
		this.vehicleStatus = vehicleStatus;
	}
	public String getPodFile() {
		return podFile;
	}
	public void setPodFile(String podFile) {
		this.podFile = podFile;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getOriginAddr() {
		return originAddr;
	}
	public void setOriginAddr(String originAddr) {
		this.originAddr = originAddr;
	}
	public String getDestAddr() {
		return destAddr;
	}
	public void setDestAddr(String destAddr) {
		this.destAddr = destAddr;
	}
	public String getEta() {
		return eta;
	}
	public void setEta(String eta) {
		this.eta = eta;
	}
	public String getBillStatus() {
		return billStatus;
	}
	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getBillStatus1() {
		return billStatus1;
	}
	public void setBillStatus1(String billStatus1) {
		this.billStatus1 = billStatus1;
	}
	public String getDepsInfo() {
		return depsInfo;
	}
	public void setDepsInfo(String depsInfo) {
		this.depsInfo = depsInfo;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getBillFile() {
		return billFile;
	}
	public void setBillFile(String billFile) {
		this.billFile = billFile;
	}
	public String getClvd() {
		return clvd;
	}
	public void setClvd(String clvd) {
		this.clvd = clvd;
	}
	public String getUvd() {
		return uvd;
	}
	public void setUvd(String uvd) {
		this.uvd = uvd;
	}
	public String getShipmentNo() {
		return shipmentNo;
	}
	public void setShipmentNo(String shipmentNo) {
		this.shipmentNo = shipmentNo;
	}
	public Integer getNoOfTyres() {
		return noOfTyres;
	}
	public void setNoOfTyres(Integer noOfTyres) {
		this.noOfTyres = noOfTyres;
	}
	public Integer getIndentId() {
		return indentId;
	}
	public void setIndentId(Integer indentId) {
		this.indentId = indentId;
	}
	public Integer getTransporterId() {
		return transporterId;
	}
	public void setTransporterId(Integer transporterId) {
		this.transporterId = transporterId;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public Integer getVehicleStatusId() {
		return vehicleStatusId;
	}
	public void setVehicleStatusId(Integer vehicleStatusId) {
		this.vehicleStatusId = vehicleStatusId;
	}
	public Integer getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(Integer billAmount) {
		this.billAmount = billAmount;
	}
	public Integer getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Integer paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getIndentStatus() {
		return indentStatus;
	}
	public void setIndentStatus(String indentStatus) {
		this.indentStatus = indentStatus;
	}
}
