package webservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

import record.JanusRecord;

public class WebServiceCall {
	public static List<JanusRecord> records = new ArrayList<JanusRecord>();

	public static void janusRecords() {

		try {

			URL url = new URL("http://vp.varunaapps.com/WebService/VendorPortal.asmx/get_all_customer_indent_detail");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output, res = "";
			while ((output = br.readLine()) != null) {
				res += output;
			}

			conn.disconnect();

			res = res.substring(74);
			res = res.substring(0, res.length() - 9);
			Object obj = new JSONParser().parse(res);
			JSONObject jo = (JSONObject) obj;

			String message = (String) jo.get("Message");
			if (message.equalsIgnoreCase("Record Found!!")) {
				JanusRecord record;
				JSONArray data = (JSONArray) jo.get("Data");
				Iterator itr2 = data.iterator();
				Iterator<Map.Entry> itr1;

				while (itr2.hasNext()) {
					itr1 = ((Map) itr2.next()).entrySet().iterator();
					record = new JanusRecord();
					while (itr1.hasNext()) {
						Map.Entry pair = itr1.next();
						DateFormat formatter = new SimpleDateFormat("M/d/yyyy h:m:s a", Locale.ENGLISH);
						switch ((String) pair.getKey()) {
						case "Indent_Id":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setIndentId(Integer.parseInt((String) pair.getValue()));
							} else {
								record.setIndentId(null);
							}
							break;
						case "Indent_Date":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setIndentDate(formatter.parse((String) pair.getValue()));
							} else {
								record.setIndentDate(null);
							}
							break;
						case "IndentNo":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setIndentNo((String) pair.getValue());
							} else {
								record.setIndentNo(null);
							}
							break;
						case "T_IndentNo":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setActualTransporter((String) pair.getValue());
							} else {
								record.setActualTransporter(null);
							}
							break;
						case "Customer_Code":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setCustomerCode((String) pair.getValue());
							} else {
								record.setCustomerCode(null);
							}
							break;
						case "Customer_Name":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setCustomer((String) pair.getValue());
							} else {
								record.setCustomer(null);
							}
							break;
						case "Transporter_Name":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setTransporter((String) pair.getValue());
							} else {
								record.setTransporter(null);
							}
							break;
						case "origin":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setOrigin((String) pair.getValue());
							} else {
								record.setOrigin(null);
							}
							break;
						case "Destination":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setDestination((String) pair.getValue());
							} else {
								record.setDestination(null);
							}
							break;
						case "Vehicle_Type":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setVehicleType((String) pair.getValue());
							} else {
								record.setVehicleType(null);
							}
							break;
						case "Transporter_Id":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setTransporterId(Integer.parseInt((String) pair.getValue()));
							} else {
								record.setTransporterId(null);
							}
							break;
						case "Customer_Id":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setCustomerId(Integer.parseInt((String) pair.getValue()));
							} else {
								record.setCustomerId(null);
							}
							break;
						case "origin_address":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setOriginAddr((String) pair.getValue());
							} else {
								record.setOriginAddr(null);
							}
							break;
						case "Destination_Address":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setDestAddr((String) pair.getValue());
							} else {
								record.setDestAddr(null);
							}
							break;
						case "Vehicle_No":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setVehicleNo((String) pair.getValue());
							} else {
								record.setVehicleNo(null);
							}
							break;
						case "Placement_Date":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setPlacementDate(formatter.parse((String) pair.getValue()));
							} else {
								record.setPlacementDate(null);
							}
							break;
						case "LR_DT":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setLrDate(formatter.parse((String) pair.getValue()));
							} else {
								record.setLrDate(null);
							}
							break;
						case "LR_NO":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setLrNo((String) pair.getValue());
							} else {
								record.setLrNo(null);
							}
							break;
						case "Vehicle_Status":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setVehicleStatus((String) pair.getValue());
							} else {
								record.setVehicleStatus(null);
							}
							break;
						case "Vehicle_Status_Id":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setVehicleStatusId(Integer.parseInt((String) pair.getValue()));
							} else {
								record.setVehicleStatusId(null);
							}
							break;
						case "Number_Of_Tyres":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setNoOfTyres(Integer.parseInt((String) pair.getValue()));
							} else {
								record.setNoOfTyres(null);
							}
							break;
						case "ShipmentNo":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setShipmentNo((String) pair.getValue());
							} else {
								record.setShipmentNo(null);
							}
							break;
						case "ETA":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setEta((String) pair.getValue());
							} else {
								record.setEta(null);
							}
							break;
						case "Arrival_at_Origin":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setArrivalAtOrigin(formatter.parse((String) pair.getValue()));
							} else {
								record.setArrivalAtOrigin(null);
							}
							break;
						case "Departure_from_Origin":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setDepartFromOrigin(formatter.parse((String) pair.getValue()));
							} else {
								record.setDepartFromOrigin(null);
							}
							break;
						case "Arrival_at_Dest":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setArrivalAtDest(formatter.parse((String) pair.getValue()));
							} else {
								record.setArrivalAtDest(null);
							}
							break;
						case "Departure_from_Dest":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setDepartFromDest(formatter.parse((String) pair.getValue()));
							} else {
								record.setDepartFromDest(null);
							}
							break;
						case "Loading_Started":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setLoadingStarted(formatter.parse((String) pair.getValue()));
							} else {
								record.setLoadingStarted(null);
							}
							break;
						case "Loading_Completed":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setLoadingCompleted(formatter.parse((String) pair.getValue()));
							} else {
								record.setLoadingCompleted(null);
							}
							break;
						case "LR_Assigned":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setLrAssigned(formatter.parse((String) pair.getValue()));
							} else {
								record.setLrAssigned(null);
							}
							break;
						case "BillDate":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setBillDate(formatter.parse((String) pair.getValue()));
							} else {
								record.setBillDate(null);
							}
							break;
						case "SubmittedDate":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setSubmittedDate(formatter.parse((String) pair.getValue()));
							} else {
								record.setSubmittedDate(null);
							}
							break;
						case "DueDate":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setDueDate(formatter.parse((String) pair.getValue()));
							} else {
								record.setDueDate(null);
							}
							break;
						case "PaymentDate":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setPaymentDate(formatter.parse((String) pair.getValue()));
							} else {
								record.setPaymentDate(null);
							}
							break;
						case "EDD":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setEdd(formatter.parse((String) pair.getValue()));
							} else {
								record.setEdd(null);
							}
							break;
						case "Bill_Status":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setBillStatus((String) pair.getValue());
							} else {
								record.setBillStatus(null);
							}
							break;
						case "BillNo":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setBillNo((String) pair.getValue());
							} else {
								record.setBillNo(null);
							}
							break;
						case "BillAmount":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setBillAmount(Integer.parseInt((String) pair.getValue()));
							} else {
								record.setBillAmount(null);
							}
							break;
						case "Bill_Status1":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setBillStatus1((String) pair.getValue());
							} else {
								record.setBillStatus1(null);
							}
							break;
						case "PaidAmount":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setPaidAmount(Integer.parseInt((String) pair.getValue()));
							} else {
								record.setPaidAmount(null);
							}
							break;
						case "DEPSInformation":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setDepsInfo((String) pair.getValue());
							} else {
								record.setDepsInfo(null);
							}
							break;
						case "Remarks":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setRemarks((String) pair.getValue());
							} else {
								record.setRemarks(null);
							}
							break;
						case "Pod_File_Name":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setPodFile((String) pair.getValue());
							} else {
								record.setPodFile(null);
							}
							break;
						case "Bill_File_Name":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setBillFile((String) pair.getValue());
							} else {
								record.setBillFile(null);
							}
							break;
						case "CLVD":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setClvd((String) pair.getValue());
							} else {
								record.setClvd(null);
							}
							break;
						case "UVD":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setUvd((String) pair.getValue());
							} else {
								record.setUvd(null);
							}
							break;
						case "InvoiceNo":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setInvoiceNo((String) pair.getValue());
							} else {
								record.setInvoiceNo(null);
							}
							break;
						case "Indent_Status":
							if (!pair.getValue().toString().equalsIgnoreCase("")) {
								record.setIndentStatus((String) pair.getValue());
							} else {
								record.setInvoiceNo(null);
							}
							if (pair.getValue().toString().equalsIgnoreCase("Cancel")) {
								record.setVehicleStatus("Cancelled");
							}
							break;
						}
					}
					records.add(record);
				}
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
