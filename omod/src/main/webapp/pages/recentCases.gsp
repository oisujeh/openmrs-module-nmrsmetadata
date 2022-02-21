<% ui.decorateWith("appui", "standardEmrPage") %>
<div class="row wrapper  white-bg page-heading"  style="">

    <h4>
        List of rencent cases for <span id="quarter_status"></span>

    </h4>

    <table>
        <thead>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Sex</th>
        <th>Age</th>
        <th>Action</th>
        </thead>
        <tbody id="clientLists">

        </tbody>
    </table>

</div>

<script type="application/javascript">
    var jq = jQuery;

    jq(function() {
        getRecencyCount();
    });
    function getRecencyCount() {
        //jq("#recency_notification").html("");
        jq.ajax({
            url: "${ ui.actionLink("nmrsmetadata", "recentCases", "getPatientRecentCases") }",
            dataType: "json",
            success: function (response) {
             displayData(response);
               // console.log(response);
            }
        });
    }

    function displayData(response) {
        var data = JSON.parse(response);

        var content = "";

        for(i=0; i < data.firstname.length; i++){
            console.log(data.firstname[i]);
            console.log(data.lastname[i]);
            content += "<tr><td>"+data.firstname[i]+"</td><td>"+data.lastname[i]+"</td><td>"+data.sex[i]+"</td><td>"+data.age[i]+"</td><td><a href=\"/${ contextPath }/htmlformentryui/htmlform/enterHtmlFormWithStandardUi.page?patientId="+data.patientUUID[i]+"&visitId=0&formUuid=d4d7a5e2-f114-4da1-84e7-1fd1871533af\" class=\"button\"> Fill RRT  </a></td></tr>";
            console.log(data.visitID[i]);
        }

        jq("#clientLists").html(content);
        jq("#quarter_status").html(data.quaterStatus);
        console.log(data.totalCount);
    }

</script>