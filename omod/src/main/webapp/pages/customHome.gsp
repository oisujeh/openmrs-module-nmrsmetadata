<%
    ui.decorateWith("appui", "standardEmrPage", [ title: ui.message("referenceapplication.home.title") ])

    def htmlSafeId = { extension ->
        "${ extension.id.replace(".", "-") }-${ extension.id.replace(".", "-") }-extension"
    }
%>

<div id="home-container">
	
    ${ ui.includeFragment("coreapps", "administrativenotification/notifications") }
	
    <% if (authenticatedUser) { %>
        <h4>
            ${ ui.encodeHtmlContent(ui.message("referenceapplication.home.currentUser", ui.format(authenticatedUser), ui.format(sessionContext.sessionLocation))) }
        </h4>
    <% } else { %>
        <h4>
            <a href="login.htm">${ ui.message("referenceapplication.home.logIn") }</a>
        </h4>
    <% } %>

    <div id="recency_notification" style=" padding: 20px;
background-color: #f44336; /* Red */
color: white;
margin-bottom: 15px;"></div>

    <div id="apps">
        <% extensions.each { ext -> %>
            <a id="${ htmlSafeId(ext) }" href="/${ contextPath }/${ ext.url }" class="button app big">
                <% if (ext.icon) { %>
                   <i class="${ ext.icon }"></i>
                <% } %>
                ${ ui.message(ext.label) }
            </a>
        <% } %>
    </div>

</div>

<script type="application/javascript">
    var jq = jQuery;

    jq(function() {
        getRecencyCount();
    });
    function getRecencyCount() {
        //jq("#recency_notification").html("");
        jq.ajax({
            url: "${ ui.actionLink("nmrsmetadata", "customHome", "getRecencyCount") }",
            dataType: "json",
            success: function (response) {
                displayData(response);
                console.log(response);
            }
        });
    }

    function displayData(response) {
       var data = JSON.parse(response);
      // var data = response;
        var content = "";
        if(data.totalCount > 0){
            content += "Total number of recent cases for " + data.quaterStatus + " : "+ data.totalCount+" <a href=\"/${ contextPath }/nmrsmetadata/recentCases.page\" class=\"button\"> View  </a>" ;
        }else {
            jq("#recency_notification").css({display: "none"})
        }
        jq("#recency_notification").html(content);
    }
    
</script>

