<%@page import="org.joda.time.DateTimeComparator"%>
<%@page import="webservice.WebServiceCall"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TMS Report</title>
<meta name="generator" content="LibreOffice 6.0.2.1 (Linux)" />
<meta name="author" content="Apache POI" />
<meta name="created" content="2018-06-12T12:31:11" />
<meta name="changed" content="00:00:00" />

<style type="text/css">
body, div, table, thead, tbody, tfoot, tr, th, td, p {
	font-family: "Liberation Sans";
	font-size: x-small
}

a.comment-indicator:hover+comment {
	background: #ffd;
	position: absolute;
	display: block;
	border: 1px solid black;
	padding: 0.5em;
}

a.comment-indicator {
	background: red;
	display: inline-block;
	border: 1px solid black;
	width: 0.5em;
	height: 0.5em;
}

comment {
	display: none;
}
</style>
</head>
<body>
	<h1 align='center'>TMS Report</h1>
	<%
		session.setAttribute("fromDate", request.getParameter("fromDate"));
		session.setAttribute("toDate", request.getParameter("toDate"));
		try {
			DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
			Date fromDate = dateFormat2.parse((String) request.getParameter("fromDate"));
			Date toDate = dateFormat2.parse((String) request.getParameter("toDate"));
	%>
	<h3 align='center'><%=dateFormat.format(new Date())%></h3>
	<center>
		<button onclick="window.location.href = 'TMSReportDownload.jsp';">Download
			Report</button>
	</center>
	<br>
	<%
		WebServiceCall.janusRecords();

			if (WebServiceCall.records.size() == 0) {
	%>
	<h1 align='center' style="color: blue">No Records Found</h1>
	<%
		} else {
	%>

	<table cellspacing="1" border="1">
		<colgroup span="5" width="145"></colgroup>
		<colgroup width="289"></colgroup>
		<colgroup width="145"></colgroup>
		<colgroup width="289"></colgroup>
		<colgroup span="16" width="145"></colgroup>
		<tr>
			<td height="20" align="left" bgcolor="#FFFF00">Indent Date</td>
			<td align="left" bgcolor="#FFFF00">Indent Number</td>
			<td align="left" bgcolor="#FFFF00">Customer</td>
			<td align="left" bgcolor="#FFFF00">Transporter</td>
			<td align="left" bgcolor="#FFFF00">Origin</td>
			<td align="left" bgcolor="#FFFF00">Origin Address</td>
			<td align="left" bgcolor="#FFFF00">Destination</td>
			<td align="left" bgcolor="#FFFF00">Destination Address</td>
			<td align="left" bgcolor="#FFFF00">Vehicle Type</td>
			<td align="left" bgcolor="#FFFF00">Vehicle Number</td>
			<td align="left" bgcolor="#FFFF00">Vehicle Status</td>
			<td align="left" bgcolor="#FFFF00">Placement Date</td>
			<td align="left" bgcolor="#FFFF00">LR Date</td>
			<td align="left" bgcolor="#FFFF00">LR Number</td>
			<td align="left" bgcolor="#FFFF00">EDD</td>
			<td align="left" bgcolor="#FFFF00">Number Of Tyres</td>
			<td align="left" bgcolor="#FFFF00">Arrival At Origin</td>
			<td align="left" bgcolor="#FFFF00">Departure From Origin</td>
			<td align="left" bgcolor="#FFFF00">Arrival At Destination</td>
			<td align="left" bgcolor="#FFFF00">Departure From Destination</td>
			<td align="left" bgcolor="#FFFF00">Loading Started</td>
			<td align="left" bgcolor="#FFFF00">Loading Completed</td>
			<td align="left" bgcolor="#FFFF00">POD File Name</td>
			<td align="left" bgcolor="#FFFF00">Invoice Number/s</td>
		</tr>
		<%
			boolean dup = false;
					for (int i = 0; i < WebServiceCall.records.size(); i++) {
						dup = false;
						if (DateTimeComparator.getDateOnlyInstance()
								.compare(WebServiceCall.records.get(i).getIndentDate(), fromDate) < 0
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
		%>
		<tr>
			<td height="20" align="left">
				<%
					if (WebServiceCall.records.get(i).getIndentDate() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getIndentDate())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getIndentNo() != null) {
				%> <%=WebServiceCall.records.get(i).getIndentNo()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getCustomer() != null) {
				%> <%=WebServiceCall.records.get(i).getCustomer()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getActualTransporter() != null) {
				%> <%=WebServiceCall.records.get(i).getActualTransporter()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getOrigin() != null) {
				%> <%=WebServiceCall.records.get(i).getOrigin()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getOriginAddr() != null) {
				%> <%=WebServiceCall.records.get(i).getOriginAddr()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getDestination() != null) {
				%> <%=WebServiceCall.records.get(i).getDestination()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getDestAddr() != null) {
				%> <%=WebServiceCall.records.get(i).getDestAddr()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getVehicleType() != null) {
				%> <%=WebServiceCall.records.get(i).getVehicleType()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getVehicleNo() != null) {
				%> <%=WebServiceCall.records.get(i).getVehicleNo()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getVehicleStatus() != null) {
				%> <%=WebServiceCall.records.get(i).getVehicleStatus()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getPlacementDate() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getPlacementDate())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getLrDate() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getLrDate())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getLrNo() != null) {
				%> <%=WebServiceCall.records.get(i).getLrNo()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getEdd() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getEdd())%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getNoOfTyres() != null) {
				%> <%=WebServiceCall.records.get(i).getNoOfTyres()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getArrivalAtOrigin() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getArrivalAtOrigin())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getDepartFromOrigin() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getDepartFromOrigin())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getArrivalAtDest() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getArrivalAtDest())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getDepartFromDest() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getDepartFromDest())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getLoadingStarted() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getLoadingStarted())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getLoadingCompleted() != null) {
				%> <%=dateFormat.format(WebServiceCall.records.get(i).getLoadingCompleted())%>
				<%
					} else {
				%> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getPodFile() != null) {
				%> <%=WebServiceCall.records.get(i).getPodFile()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
			<td align="left">
				<%
					if (WebServiceCall.records.get(i).getInvoiceNo() != null) {
				%> <%=WebServiceCall.records.get(i).getInvoiceNo()%> <%
 	} else {
 %> <br> <%
 	}
 %>
			</td>
		</tr>
		<%
			}
					}
		%>

	</table>
	<%
		}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	%>
</body>
</html>