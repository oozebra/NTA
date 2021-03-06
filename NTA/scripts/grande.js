﻿$(document).ready(function () {
    $.soap({
        url: 'http://localhost:52168/coursesStream.asmx?op=CoursesByLocation',
        method: 'CoursesByLocation',
        namespaceURL: 'http://tempuri.org/',
        appendMethodToURL: false,
        SOAPAction: 'http://tempuri.org/CoursesByLocation',
        data: {
            campus: 'Sangre Grande'
        },
        beforeSend: function(SOAPEnvelope) {
            console.log(SOAPEnvelope.toString());
        },

        success: function (soapResponse) {
            // do stuff with soapResponse
            // if you want to have the response as JSON use soapResponse.toJSON();
            // or soapResponse.toString() to get XML string
            // or soapResponse.toXML() to get XML DOM
            //$dom = soapResponse.toXML();
            $son = soapResponse.toJSON();
            //console.log($son);
            $("table").append("<tr>    <th>Course No</th>    <th>Course Name</th>    <th>Description</th>    <th>Course Credit</th>    <th>Room No</th>    <th>Campus</th>    <th>Trainer</th>    <th>Start Date</th>    <th>End Date</th>    </tr>");
            $.each( $son, function( key, val ) {
               
                console.log(val['soap:Envelope']['soap:Body']['CoursesByLocationResponse']['CoursesByLocationResult'].ScheduledCourse);
                $.each(val['soap:Envelope']['soap:Body']['CoursesByLocationResponse']['CoursesByLocationResult'].ScheduledCourse, function (ke, va) {

                    console.log(va['Trainer'].fname);
                    $("tbody").append("<tr>");
                    $("tbody").append("<td>" + va['course'].cid + "</td>");
                    $("tbody").append("<td>" + va['course'].name + "</td>");
                    $("tbody").append("<td>" + va['course'].description + "</td>");
                    $("tbody").append("<td>" + va['course'].credit + "</td>");
                    $("tbody").append("<td>" + va['Campus'].roomNo + "</td>");
                    $("tbody").append("<td>" + va['Campus'].location + "</td>");
                    $("tbody").append("<td>" + va['Trainer'].fname + "</td>");
                    $("tbody").append("<td>" + va['course'].sDate + "</td>");
                    $("tbody").append("<td>" + va['course'].eDate + "</td>");
                    $("tbody").append("</tr>");
                    
                    
                });
            });

           // $("label").html($son);
        },
        error: function (SOAPResponse) {
            // show error
            $("label").html("It no work"+SOAPResponse);
        }
    });
});
