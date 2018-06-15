<%@page import="java.util.Date"%>
<%@page import="org.joda.time.DateTimeComparator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="webservice.WebServiceCall"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>TMS Dashboard</title><%
	try {
		WebServiceCall.janusRecords();
		String cust[] = {"Apollo Tyre Dankuni", "Apollo Tyre Ambala", "MRF Becharaji", "Apollo Tyre Indore",
				"TVS Rudrapur", "MRF Rudrapur", "MRF Lucknow", "Apollo Tyre Cuttack", "JK Sonauli",
				"JK Tyre Raipur"};
		int totalIndents[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		int pendingIndents[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		for (int i = 0; i < WebServiceCall.records.size(); i++) {
			if (DateTimeComparator.getDateOnlyInstance().compare(WebServiceCall.records.get(i).getIndentDate(),
					new Date()) == 0) {
				switch (WebServiceCall.records.get(i).getCustomer()) {
					case "Apollo Tyre Dankuni" :
						totalIndents[0]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[0]++;
						}
						break;
					case "Apollo Tyre Ambala" :
						totalIndents[1]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[1]++;
						}
						break;
					case "MRF Becharaji" :
						totalIndents[2]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[2]++;
						}
						break;
					case "Apollo Tyre Indore" :
						totalIndents[3]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[3]++;
						}
						break;
					case "TVS Rudrapur" :
						totalIndents[4]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[4]++;
						}
						break;
					case "MRF Rudrapur" :
						totalIndents[5]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[5]++;
						}
						break;
					case "MRF Lucknow" :
						totalIndents[6]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[6]++;
						}
						break;
					case "Apollo Tyre Cuttack" :
						totalIndents[7]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[7]++;
						}
						break;
					case "JK Sonauli" :
						totalIndents[8]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[8]++;
						}
						break;
					case "JK Tyre Raipur" :
						totalIndents[9]++;
						if (WebServiceCall.records.get(i).getVehicleNo() == null
								|| WebServiceCall.records.get(i).getVehicleNo() == "") {
							pendingIndents[9]++;
						}
						break;
				}
			}
		}

		String dataTableTotalIndent = "";
		String dataTablePendingIndent = "";

		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
		dataTableTotalIndent += "([ \n";
		dataTableTotalIndent += "['Customer','Total Indents','Pending Indents'], \n";

		for (int i = 0; i < 10; i++) {
			dataTableTotalIndent += "['" + cust[i] + "'," + totalIndents[i] + "," + pendingIndents[i] + "],";
		}
		dataTableTotalIndent = dataTableTotalIndent.substring(0, dataTableTotalIndent.length() - 1);
		dataTableTotalIndent += "]); \n";
%>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"> 
       // Load Charts and the corechart package. 
      google.charts.load('current', {'packages':['bar']}); 
 
      google.charts.setOnLoadCallback(drawIndentChart); 
 
      function drawIndentChart() { 
 
        var data = google.visualization.arrayToDataTable 
<%=dataTableTotalIndent%>	
        var options = {chart: { title:'Total Indents for Today',subtitle: 'Indents vs Pending Indents:<%=dateFormat.format(new Date())%>',}, bars:'vertical',hAxis: {format: 'decimal'},width:1350,height:500,colors: ['#1b9e77', '#d95f02']}; 

var chart = new google.charts.Bar(document.getElementById('Total_Indent_chart_div')); 
chart.draw(data, google.charts.Bar.convertOptions(options)); 
} 

</script>
<%
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>
</head>
<body>
	<h1 align='center'>TMS Dashboard</h1>
	<!--Table and divs that hold the bar charts-->
	<table class="columns">
		<tr>
			<td><div id="Total_Indent_chart_div"
					style="border: 1px solid #ccc"></div></td>
		</tr>
	</table>
</body>
</html>