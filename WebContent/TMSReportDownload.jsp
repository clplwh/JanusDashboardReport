<%@page import="org.joda.time.DateTimeComparator"%>
<%@page import="java.text.SimpleDateFormat"%><%@page
	import="java.text.DateFormat"%><%@page import="java.util.Date"%><%@page
	import="java.io.OutputStream"%><%@page
	import="java.io.ByteArrayOutputStream"%><%@page
	import="org.apache.poi.xssf.usermodel.XSSFCell"%><%@page
	import="org.apache.poi.xssf.usermodel.XSSFRow"%><%@page
	import="org.apache.poi.ss.usermodel.CreationHelper"%><%@page
	import="org.apache.poi.ss.usermodel.FillPatternType"%><%@page
	import="org.apache.poi.ss.usermodel.IndexedColors"%><%@page
	import="org.apache.poi.ss.usermodel.CellStyle"%><%@page
	import="org.apache.poi.xssf.usermodel.XSSFSheet"%><%@page
	import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%><%@page
	import="webservice.WebServiceCall"%>
<%
	try {
		//WebServiceCall.janusRecords();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date fromDate = dateFormat2.parse((String) session.getAttribute("fromDate"));
		Date toDate = dateFormat2.parse((String) session.getAttribute("toDate"));
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("Report");

		for (int i = 0; i <= 24; i++) {
			if (i == 5 || i == 7)
				sheet.setColumnWidth(i, 10000);
			else
				sheet.setColumnWidth(i, 5000);
		}

		CellStyle style1 = workbook.createCellStyle();
		style1.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
		style1.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		CellStyle style2 = workbook.createCellStyle();
		CreationHelper createHelper = workbook.getCreationHelper();
		style2.setDataFormat(createHelper.createDataFormat().getFormat("dd/MM/yyyy HH:mm"));

		XSSFRow row = null;

		row = sheet.createRow(0);
		XSSFCell cell = row.createCell(0);
		cell.setCellStyle(style1);
		cell.setCellValue("Indent Date");
		cell = row.createCell(1);
		cell.setCellStyle(style1);
		cell.setCellValue("Indent Number");
		cell = row.createCell(2);
		cell.setCellStyle(style1);
		cell.setCellValue("Customer");
		cell = row.createCell(3);
		cell.setCellStyle(style1);
		cell.setCellValue("Transporter");
		cell = row.createCell(4);
		cell.setCellStyle(style1);
		cell.setCellValue("Origin");
		cell = row.createCell(5);
		cell.setCellStyle(style1);
		cell.setCellValue("Origin Address");
		cell = row.createCell(6);
		cell.setCellStyle(style1);
		cell.setCellValue("Destination");
		cell = row.createCell(7);
		cell.setCellStyle(style1);
		cell.setCellValue("Destination Address");
		cell = row.createCell(8);
		cell.setCellStyle(style1);
		cell.setCellValue("Vehicle Type");
		cell = row.createCell(9);
		cell.setCellStyle(style1);
		cell.setCellValue("Vehicle Number");
		cell = row.createCell(10);
		cell.setCellStyle(style1);
		cell.setCellValue("Vehicle Status");
		cell = row.createCell(11);
		cell.setCellStyle(style1);
		cell.setCellValue("Placement Date");
		cell = row.createCell(12);
		cell.setCellStyle(style1);
		cell.setCellValue("LR Date");
		cell = row.createCell(13);
		cell.setCellStyle(style1);
		cell.setCellValue("LR Number");
		cell = row.createCell(14);
		cell.setCellStyle(style1);
		cell.setCellValue("EDD");
		cell = row.createCell(15);
		cell.setCellStyle(style1);
		cell.setCellValue("Number Of Tyres");
		cell = row.createCell(16);
		cell.setCellStyle(style1);
		cell.setCellValue("Arrival At Origin");
		cell = row.createCell(17);
		cell.setCellStyle(style1);
		cell.setCellValue("Departure From Origin");
		cell = row.createCell(18);
		cell.setCellStyle(style1);
		cell.setCellValue("Arrival At Destination");
		cell = row.createCell(19);
		cell.setCellStyle(style1);
		cell.setCellValue("Departure From Destination");
		cell = row.createCell(20);
		cell.setCellStyle(style1);
		cell.setCellValue("Loading Started");
		cell = row.createCell(21);
		cell.setCellStyle(style1);
		cell.setCellValue("Loading Completed");
		cell = row.createCell(22);
		cell.setCellStyle(style1);
		cell.setCellValue("POD File Name");
		cell = row.createCell(23);
		cell.setCellStyle(style1);
		cell.setCellValue("Invoice Number/s");

		int index = 1;
		boolean dup = false;

		for (int i = 0; i < WebServiceCall.records.size(); i++) {
			dup = false;
			if (DateTimeComparator.getDateOnlyInstance().compare(WebServiceCall.records.get(i).getIndentDate(),
					fromDate) < 0
					|| DateTimeComparator.getDateOnlyInstance()
							.compare(WebServiceCall.records.get(i).getIndentDate(), toDate) > 0) {
				continue;
			}
			for (int j = 0; j < i; j++) {
				if (WebServiceCall.records.get(i).getIndentNo()
						.equalsIgnoreCase(WebServiceCall.records.get(j).getIndentNo())
						&& WebServiceCall.records.get(i).getCustomer()
								.equalsIgnoreCase(WebServiceCall.records.get(j).getCustomer())
						&& !WebServiceCall.records.get(i).getIndentStatus().equalsIgnoreCase("Cancel")
						&& !WebServiceCall.records.get(j).getIndentStatus().equalsIgnoreCase("Cancel")) {
					dup = true;
					break;
				}
			}
			if (!dup) {
				row = sheet.createRow(index);
				if (WebServiceCall.records.get(i).getIndentDate() != null) {
					cell = row.createCell(0);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getIndentDate());
				}
				if (WebServiceCall.records.get(i).getIndentNo() != null) {
					cell = row.createCell(1);
					cell.setCellValue(WebServiceCall.records.get(i).getIndentNo());
				}
				if (WebServiceCall.records.get(i).getCustomer() != null) {
					cell = row.createCell(2);
					cell.setCellValue(WebServiceCall.records.get(i).getCustomer());
				}
				if (WebServiceCall.records.get(i).getActualTransporter() != null) {
					cell = row.createCell(3);
					cell.setCellValue(WebServiceCall.records.get(i).getActualTransporter());
				}
				if (WebServiceCall.records.get(i).getOrigin() != null) {
					cell = row.createCell(4);
					cell.setCellValue(WebServiceCall.records.get(i).getOrigin());
				}
				if (WebServiceCall.records.get(i).getOriginAddr() != null) {
					cell = row.createCell(5);
					cell.setCellValue(WebServiceCall.records.get(i).getOriginAddr());
				}
				if (WebServiceCall.records.get(i).getDestination() != null) {
					cell = row.createCell(6);
					cell.setCellValue(WebServiceCall.records.get(i).getDestination());
				}
				if (WebServiceCall.records.get(i).getDestAddr() != null) {
					cell = row.createCell(7);
					cell.setCellValue(WebServiceCall.records.get(i).getDestAddr());
				}
				if (WebServiceCall.records.get(i).getVehicleType() != null) {
					cell = row.createCell(8);
					cell.setCellValue(WebServiceCall.records.get(i).getVehicleType());
				}
				if (WebServiceCall.records.get(i).getVehicleNo() != null) {
					cell = row.createCell(9);
					cell.setCellValue(WebServiceCall.records.get(i).getVehicleNo());
				}
				if (WebServiceCall.records.get(i).getVehicleStatus() != null) {
					cell = row.createCell(10);
					cell.setCellValue(WebServiceCall.records.get(i).getVehicleStatus());
				}
				if (WebServiceCall.records.get(i).getPlacementDate() != null) {
					cell = row.createCell(11);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getPlacementDate());
				}
				if (WebServiceCall.records.get(i).getLrDate() != null) {
					cell = row.createCell(12);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getLrDate());
				}
				if (WebServiceCall.records.get(i).getLrNo() != null) {
					cell = row.createCell(13);
					cell.setCellValue(WebServiceCall.records.get(i).getLrNo());
				}
				if (WebServiceCall.records.get(i).getEdd() != null) {
					cell = row.createCell(14);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getEdd());
				}
				if (WebServiceCall.records.get(i).getNoOfTyres() != null) {
					cell = row.createCell(15);
					cell.setCellValue(WebServiceCall.records.get(i).getNoOfTyres());
				}
				if (WebServiceCall.records.get(i).getArrivalAtOrigin() != null) {
					cell = row.createCell(16);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getArrivalAtOrigin());
				}
				if (WebServiceCall.records.get(i).getDepartFromOrigin() != null) {
					cell = row.createCell(17);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getDepartFromOrigin());
				}
				if (WebServiceCall.records.get(i).getArrivalAtDest() != null) {
					cell = row.createCell(18);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getArrivalAtDest());
				}
				if (WebServiceCall.records.get(i).getDepartFromDest() != null) {
					cell = row.createCell(19);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getDepartFromDest());
				}
				if (WebServiceCall.records.get(i).getLoadingStarted() != null) {
					cell = row.createCell(20);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getLoadingStarted());
				}
				if (WebServiceCall.records.get(i).getLoadingCompleted() != null) {
					cell = row.createCell(21);
					cell.setCellStyle(style2);
					cell.setCellValue(WebServiceCall.records.get(i).getLoadingCompleted());
				}
				if (WebServiceCall.records.get(i).getPodFile() != null) {
					cell = row.createCell(22);
					cell.setCellValue(WebServiceCall.records.get(i).getPodFile());
				}
				if (WebServiceCall.records.get(i).getInvoiceNo() != null) {
					cell = row.createCell(23);
					cell.setCellValue(WebServiceCall.records.get(i).getInvoiceNo());
				}

				index++;
			}
		}
		ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
		workbook.write(outByteStream);
		byte[] outArray = outByteStream.toByteArray();
		response.setContentType("application/ms-excel");
		response.setContentLength(outArray.length);
		response.setHeader("Expires:", "0"); // eliminates browser caching
		response.setHeader("Content-Disposition",
				"attachment; filename=TMSReport" + dateFormat.format(new Date()) + ".xlsx");
		OutputStream outStream = response.getOutputStream();
		outStream.write(outArray);
		outStream.flush();
		workbook.close();

	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>